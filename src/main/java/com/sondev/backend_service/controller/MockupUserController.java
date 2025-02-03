package com.sondev.backend_service.controller;

import com.sondev.backend_service.common.Gender;
import com.sondev.backend_service.controller.request.UserCreateRequest;
import com.sondev.backend_service.controller.request.UserPasswordRequest;
import com.sondev.backend_service.controller.request.UserUpdateRequest;
import com.sondev.backend_service.controller.response.UserResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/mockup/user")
@Tag(name = "Mockup  User Controller")
public class MockupUserController {

    @Operation(summary = "Get user list", description = "API retrieve user from db")
    @GetMapping("/list")
    public Map<String, Object> getList(
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size
    ) {
        UserResponse userResponse1 = new UserResponse();
        userResponse1.setId(1l);
        userResponse1.setFirstName("Son");
        userResponse1.setLastName("Dev");
        userResponse1.setGender(Gender.FEMALE);
        userResponse1.setBirthDay(new Date());
        userResponse1.setUserName("admin");
        userResponse1.setEmail("admin@gmail.com");
        userResponse1.setPhone("0987123123");

        UserResponse userResponse2 = new UserResponse();
        userResponse2.setId(1l);
        userResponse2.setFirstName("An");
        userResponse2.setLastName("Nguyen Van");
        userResponse2.setGender(Gender.MALE);
        userResponse2.setBirthDay(new Date());
        userResponse2.setUserName("admin");
        userResponse2.setEmail("admin@gmail.com");
        userResponse2.setPhone("0987123123");
        List<UserResponse> userList = List.of(userResponse1, userResponse2);

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.OK.value());
        result.put("message","user list");
        result.put("data", userList);

        return result;
    }

    @Operation(summary = "Get user detail", description = "API retrieve user detail by ID")
    @GetMapping("/{userId}")
    public Map<String, Object> getUser(@PathVariable Long userId){
        UserResponse userDetail = new UserResponse();
        userDetail.setId(1l);
        userDetail.setFirstName("Son");
        userDetail.setLastName("Dev");
        userDetail.setGender(Gender.MALE);
        userDetail.setBirthDay(new Date());
        userDetail.setUserName("admin");
        userDetail.setEmail("admin@gmail.com");
        userDetail.setPhone("0987123123");

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.OK.value());
        result.put("message","user detail");
        result.put("data", userDetail);

        return result;
    }

    @Operation(summary = "Creat User", description = "API add new user to db")
    @PostMapping("/add")
    public Map<String, Object> createUser(@RequestBody UserCreateRequest request){
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.CREATED.value());
        result.put("message","User created successfully");
        result.put("data", 3);

        return result;
    }

    @Operation(summary = "Update User", description = "API update user to db")
    @PutMapping("/upd")
    public Map<String, Object> updateUser(@RequestBody UserUpdateRequest request){
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.ACCEPTED.value());
        result.put("message","User updated successfully");
        result.put("data", "");

        return result;
    }

    @Operation(summary = "Change password User", description = "API change password user to db")
    @PatchMapping("/change-pwd")
    public Map<String, Object> changePassword(@RequestBody UserPasswordRequest request){

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.NO_CONTENT.value());
        result.put("message","Password updated successfully");
        result.put("data", "");

        return result;
    }

    @Operation(summary = "Inactivate User", description = "API inactivate user from db")
    @DeleteMapping("/del/{userId}")
    public Map<String, Object> deleteUser(@PathVariable Long userId){

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("status", HttpStatus.RESET_CONTENT.value());
        result.put("message","User deleted successfully");
        result.put("data", "");

        return result;
    }
}
