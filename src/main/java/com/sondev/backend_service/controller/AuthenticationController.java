package com.sondev.backend_service.controller;

import com.sondev.backend_service.controller.request.SignInRequest;
import com.sondev.backend_service.controller.response.TokenResponse;
import com.sondev.backend_service.service.AuthenticationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
@Tag(name = "Authentication Controller")
@Slf4j(topic = "AUTHENTICATION-CONTROLLER")
public class AuthenticationController {
    private final AuthenticationService authenticationService;

    private final AuthenticationManager authenticationManager;

    public AuthenticationController(AuthenticationService authenticationService, AuthenticationManager authenticationManager) {
        this.authenticationService = authenticationService;
        this.authenticationManager = authenticationManager;
    }

    @Operation(summary = "Access token", description = "Get access token and refresh token by username and password")
    @PostMapping(value ="/access-token", produces = MediaType.APPLICATION_JSON_VALUE)
    public TokenResponse accessToken(@RequestBody SignInRequest request) {
        log.info("Access token request");

        return authenticationService.getAccessToken(request);
    }



    @Operation(summary = "Refresh token", description = "Get access token by refresh token")
    @PostMapping(value = "/refresh-token",produces = MediaType.APPLICATION_JSON_VALUE)
    public TokenResponse refreshToken(@RequestBody String refreshToken) {
        log.info("Refresh token request");

        return authenticationService.getRefreshToken(refreshToken);
    }
}
