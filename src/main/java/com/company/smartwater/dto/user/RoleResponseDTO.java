package com.company.smartwater.dto.user;

import com.company.smartwater.dto.BaseDTO;

public class RoleResponseDTO extends BaseDTO {
    private String name;

    private String description;

    private String spaceCode;

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

    public String getSpaceCode() {
        return spaceCode;
    }

    public void setSpaceCode(String spaceCode) {
        this.spaceCode = spaceCode;
    }
}
