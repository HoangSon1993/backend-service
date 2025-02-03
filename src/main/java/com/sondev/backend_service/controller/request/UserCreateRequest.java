package com.sondev.backend_service.controller.request;


import com.sondev.backend_service.common.Gender;
import com.sondev.backend_service.common.UserType;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserCreateRequest implements Serializable {
    @NotBlank(message = "firstName must be not blank")
    String firstName;

    @NotBlank(message = "lastName must be not blank")
    String lastName;
    Gender gender;
    Date birthDay;
    String userName;

    @Email(message = "Email invalid")
    String email;
    String phone;
    UserType type;
    List<AddressRequest> addresses; //home, office
}
