package com.sondev.backend_service.controller.request;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SignInRequest {
    String username;
    String password;
    String platform; // web, mobile, miniApp
    String deviceToken;
    String versionApp;
}
