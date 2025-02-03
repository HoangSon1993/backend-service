package com.sondev.backend_service.service.impl;

import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;
import com.sendgrid.helpers.mail.objects.Personalization;
import com.sondev.backend_service.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.actuate.web.mappings.MappingsEndpoint;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@Slf4j(topic = "EMAIL-SERVICE")
public class EmailServiceImpl implements EmailService {
    private final SendGrid sendGrid;
    private final MappingsEndpoint mappingsEndpoint;

    @Value("${spring.sendgrid.fromEmail}")
    private String fromEmail;

    @Value("${spring.sendgrid.templateId}")
    private String templateId;

    @Value("${spring.sendgrid.verificationLink}")
    private String verificationLink;

    public EmailServiceImpl(SendGrid sendGrid, MappingsEndpoint mappingsEndpoint) {
        this.sendGrid = sendGrid;
        this.mappingsEndpoint = mappingsEndpoint;
    }

    /**
     * Send email by SendGrid
     * @param to send email to someone
     * @param subject
     * @param text
     */
    @Override
    public void send(String to, String subject, String text) {
        Email fromEmail = new Email(this.fromEmail);
        Email toEmail = new Email(to);

        Content content = new Content("text/plain", text);
        Mail mail = new Mail(fromEmail, subject, toEmail, content);

        Request request = new Request();
        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());
            Response response = sendGrid.api(request);

            if (response.getStatusCode() == 202) { // 202: Accepted
                log.info("Email sent successfully");
            } else {
                log.error("Email sent failed");
            }
        } catch (IOException e) {
            log.error("Error occurred while sending email, error: {}", e);
        }
    }

    /**
     * Email verification by SendGrid
     * @param to
     * @param name
     * @throws IOException
     */
    @Override
    public void emailVerification(String to, String name) throws IOException {
        log.info("Email verified");
        Email fromEmail = new Email(this.fromEmail);
        Email toEmail = new Email(to);

        String secretCode = String.format("?secret=%s", UUID.randomUUID());

        // Todo: generate secretCode and save to database

        String subject = "Xác thực tài khoản";
        // Dinh nghia template
        Map<String, String> map = new HashMap<>();
        map.put("name", name);
        map.put("verification_link", verificationLink + secretCode);

        Mail mail = new Mail();
        mail.setFrom(fromEmail);
        mail.setSubject(subject);

        Personalization personalization = new Personalization();
        personalization.addTo(toEmail);

        // add to dynamic data
        map.forEach(personalization::addDynamicTemplateData);
        mail.addPersonalization(personalization);
        mail.setTemplateId(templateId);

        Request request = new Request();
        request.setMethod(Method.POST);
        request.setEndpoint("mail/send");
        request.setBody(mail.build());

        Response response = sendGrid.api(request);
        if (response.getStatusCode() == 202) {
            // successfull
            log.info("Verification email sent successfully");
        }else {
            // error
            log.error("Verification email sent failed");
        }

    }
}
