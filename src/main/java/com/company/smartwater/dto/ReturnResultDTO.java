package com.company.smartwater.dto;

import java.io.Serializable;

public class ReturnResultDTO<T> implements Serializable {
    private String returnCode;
    private T data;

    public ReturnResultDTO() {
    }

    public ReturnResultDTO(String returnCode, T data) {
        this.setData(data);
        this.setReturnCode(returnCode);
    }

    public String getReturnCode() {
        return this.returnCode;
    }

    public void setReturnCode(String returnCode) {
        this.returnCode = returnCode;
    }

    public T getData() {
        return this.data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
