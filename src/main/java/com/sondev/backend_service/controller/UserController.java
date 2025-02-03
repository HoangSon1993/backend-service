package com.sondev.backend_service.controller;

import com.sondev.backend_service.controller.request.UserCreateRequest;
import com.sondev.backend_service.controller.request.UserPasswordRequest;
import com.sondev.backend_service.controller.request.UserUpdateRequest;
import com.sondev.backend_service.controller.response.UserPageResponse;
import com.sondev.backend_service.controller.response.UserResponse;
import com.sondev.backend_service.service.EmailService;
import com.sondev.backend_service.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@Slf4j(topic = "USER-CONTROLLER")
@RestController
@RequestMapping("/user")
@Validated
public class UserController {
    private final UserService userService;
    private final EmailService emailService;

    public UserController(UserService userService, EmailService emailService) {
        this.userService = userService;
        this.emailService = emailService;
    }


    @Operation(summary = "Create User", description = "API create user to database")
    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> createUser(@RequestBody @Valid UserCreateRequest request) {
        var data = userService.save(request);

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.CREATED.value());
        result.put("message", "User created successfully");
        result.put("data", data);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @Operation(summary = "Update User", description = "API update user to database")
    @PostMapping("/upd")
    public ResponseEntity<?> updateUser(@RequestBody @Valid UserUpdateRequest request) {
        log.info("Updating user: {}", request);
        userService.update(request);

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.CREATED.value());
        result.put("message", "User created successfully");
        result.put("data", "");
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @Operation(summary = "Change password User", description = "API change password user to db")
    @PatchMapping("/change-pwd")
    public Map<String, Object> changePassword(@RequestBody UserPasswordRequest request) {
        userService.changePassword(request);

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.NO_CONTENT.value());
        result.put("message", "Password updated successfully");
        result.put("data", "");
        return result;
    }

    @GetMapping({"/confirm-email"})
    public void confirmEmail(@RequestParam String secretCode, HttpServletResponse response) throws IOException {
        log.info("Confirming email: {}", secretCode);
        try {
            // Todo check or compare from database
        } catch (Exception e) {
            log.error("Error while confirming email: {}", e.getMessage());
        } finally {
            response.sendRedirect(""); // redirect về trang login
        }

    }

    @Operation(summary = "Inactivate User", description = "API inactivate user from db")
    @DeleteMapping("/del/{userId}")
    public Map<String, Object> deleteUser(
            @PathVariable
            @Min(value = 1, message = "id must be equals or greater than 1") Long userId) {
        userService.delete(userId);


        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.RESET_CONTENT.value());
        result.put("message", "User deleted successfully");
        result.put("data", "");

        return result;
    }

    @Operation(summary = "Get user detail", description = "API retrieve user detail by ID")
    @GetMapping("/{userId}")
    public Map<String, Object> getUser(
            @PathVariable
            @Min(value = 1, message = "userId must be equals or greater than 1") Long userId) {

        UserResponse userDetail = userService.findById(userId);

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.OK.value());
        result.put("message", "user detail");
        result.put("data", userDetail);

        return result;
    }

    @Operation(summary = "Get user list", description = "API retrieve user from db")
    @GetMapping("/list")
    public Map<String, Object> getList(
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestParam(required = false) String sort
    ) {
        UserPageResponse userResponses = userService.findAll(keyword, sort, page, size);

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.OK.value());
        result.put("message", "user list");
        result.put("data", userResponses);

        return result;
    }
}
