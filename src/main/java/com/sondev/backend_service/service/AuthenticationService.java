package com.sondev.backend_service.service;

import com.sondev.backend_service.controller.request.SignInRequest;
import com.sondev.backend_service.controller.response.TokenResponse;

public interface AuthenticationService {
    TokenResponse getAccessToken(SignInRequest request);

    TokenResponse getRefreshToken(String request);
}
