package com.sondev.backend_service.controller.request;


import com.sondev.backend_service.common.Gender;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class UserUpdateRequest implements Serializable {
    @NotNull(message = "Id must be not null")
    @Min(value = 1, message = "id must be equals or greater than 1")
    Long id;

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
    List<AddressRequest> addresses;
}
