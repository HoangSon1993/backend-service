package com.sondev.backend_service.service;

import com.sondev.backend_service.common.TokenType;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public interface JwtService {
    String generateAccessToken(long userId, String username, Collection<? extends GrantedAuthority> authorities);

    String generateRefreshToken(long userId, String username, Collection<? extends GrantedAuthority> authorities);

    String extractUsername(String token, TokenType type);
}
