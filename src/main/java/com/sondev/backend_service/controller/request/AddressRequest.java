package com.sondev.backend_service.controller.request;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AddressRequest implements Serializable {
    String apartmentNumber;
    String street;
    String floor;
    String building;
    String streetNumber;
    String city;
    String country;
    Integer addressType;


}
