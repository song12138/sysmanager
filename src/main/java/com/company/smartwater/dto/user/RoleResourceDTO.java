package com.company.smartwater.dto.user;

import java.util.List;

public class RoleResourceDTO {

    private Long roleId;

    private List<Long> resourceId;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public List<Long> getResourceId() {
        return resourceId;
    }

    public void setResourceId(List<Long> resourceId) {
        this.resourceId = resourceId;
    }
}
