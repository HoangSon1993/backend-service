package com.sondev.backend_service.service;

import java.io.IOException;

public interface EmailService {
    void send(String to, String subject, String text);

    void emailVerification(String to, String name) throws IOException;
}
