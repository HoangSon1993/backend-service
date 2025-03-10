package com.sondev.backend_service.controller.request;


import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.ToString;

import java.io.Serializable;


@Getter
@ToString
public class UserPasswordRequest implements Serializable {
    @NotNull(message = "Id must be not null")
    @Min(value = 1, message = "id must be equals or greater than 1")
    private Long id;

    @NotBlank(message = "password must be not blank")
    private String password;

    @NotBlank(message = "confirmPassword must be not blank")
    private String confirmPassword;
}
