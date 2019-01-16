package com.company.smartwater.dto.user;

import io.swagger.annotations.ApiModel;

@ApiModel("密码")
public class PasswordDTO {

    private String password;

    private String newPassword;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
