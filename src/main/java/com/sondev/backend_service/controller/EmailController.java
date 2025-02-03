package com.sondev.backend_service.controller;

import com.sondev.backend_service.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@Slf4j(topic = "EMAIL-CONTROLLER")
public class EmailController {
    private final EmailService emailService;

    public EmailController(EmailService emailService) {
        this.emailService = emailService;
    }

    @PostMapping("/send-email")
    public void send(
            @RequestParam String to,
            @RequestParam String subject,
            @RequestParam String contend
    ) {
        log.info("Sending email to {}", to);
        emailService.send(to, subject, contend);
        log.info("Email sent");
    }

    @PostMapping("/verify-email")
    public void verification(@RequestParam String to, String name) throws IOException {
        log.info("Verifying email to {}", to);
        emailService.emailVerification(to, name);
    }
}
