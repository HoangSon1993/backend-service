package com.sondev.backend_service.controller.response;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Setter
@FieldDefaults(level = AccessLevel.PROTECTED)
public abstract class PageResponseAbstract {
    int pageNumber;
    int pageSize;
    long totalPage;
    long totalElement;
}
