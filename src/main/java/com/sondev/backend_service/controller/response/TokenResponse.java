package com.sondev.backend_service.controller.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
@Builder
public class TokenResponse implements Serializable {
    String accessToken;
    String refreshToken;
}
