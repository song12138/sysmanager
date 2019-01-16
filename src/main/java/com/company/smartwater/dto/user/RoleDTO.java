package com.company.smartwater.dto.user;

import com.company.smartwater.dto.BaseDTO;
import io.swagger.annotations.ApiModel;

@ApiModel("角色")
public class RoleDTO extends BaseDTO {

    private String name;

    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
