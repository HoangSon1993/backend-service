package com.sondev.backend_service.controller.response;

import com.sondev.backend_service.common.Gender;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserResponse implements Serializable {
    Long id;
    String firstName;
    String lastName;
    Gender gender;
    Date birthDay;
    String userName;
    String email;
    String phone;
    // more
}
