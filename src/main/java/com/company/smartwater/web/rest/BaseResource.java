package com.company.smartwater.web.rest;

import com.company.smartwater.dto.ReturnResultDTO;
import com.google.common.collect.ImmutableMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.*;

public abstract class BaseResource {

    protected ResponseEntity<?> handleErrors(Errors errors) {
        List<Map<String, String>> mapList = new ArrayList<>();
        errors.getAllErrors().forEach(objectError -> {
            Map<String, String> errorMap = new HashMap<>();
            if (objectError instanceof FieldError) {
                errorMap.put("name", ((FieldError) objectError).getField());
                errorMap.put("error", objectError.getDefaultMessage());
            } else {
                errorMap.put("name", objectError.getObjectName());
                errorMap.put("error", objectError.getDefaultMessage());
            }
            mapList.add(errorMap);
        });
        return prepareReturnResult("5001", ImmutableMap.of("error", mapList));
    }

    protected ResponseEntity<?> handleErrors(String errorCode, Exception e) {
        return prepareReturnResult(errorCode, ImmutableMap.of("error", Collections.singletonList(ImmutableMap.of("error", e.getMessage()))));
    }

    protected ResponseEntity<ReturnResultDTO<?>> prepareReturnResult(String returnCode, Object data) {
        return new ResponseEntity(new ReturnResultDTO(returnCode, data), HttpStatus.OK);
    }

}
