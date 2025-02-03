package com.sondev.backend_service.service;

import com.sondev.backend_service.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
@Slf4j(topic = "USER-SERVICE-DETAIL")
public class UserServiceDetail {
    private final UserRepository userRepository;

    public UserServiceDetail(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public UserDetailsService userDetailsService() {
        return userRepository::findByUsername;
    }
}
