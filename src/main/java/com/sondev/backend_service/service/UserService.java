package com.sondev.backend_service.service;

import com.sondev.backend_service.controller.request.UserCreateRequest;
import com.sondev.backend_service.controller.request.UserPasswordRequest;
import com.sondev.backend_service.controller.request.UserUpdateRequest;
import com.sondev.backend_service.controller.response.UserPageResponse;
import com.sondev.backend_service.controller.response.UserResponse;

import java.util.List;

public interface UserService {
    UserPageResponse findAll(String keyword, String sort, int page, int size);
    UserResponse findById(Long id);
    UserResponse findByUsername(String username);
    long save(UserCreateRequest request);
    void update(UserUpdateRequest request);
    void changePassword(UserPasswordRequest request);
    void delete(Long id);
}
