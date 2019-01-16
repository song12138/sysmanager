package com.company.smartwater.dto.user;

import java.util.List;

public class UserRolesDTO {

    private List<Long> roleId;

    private List<Long> userId;

    public List<Long> getRoleId() {
        return roleId;
    }

    public void setRoleId(List<Long> roleId) {
        this.roleId = roleId;
    }

    public List<Long> getUserId() {
        return userId;
    }

    public void setUserId(List<Long> userId) {
        this.userId = userId;
    }
}
