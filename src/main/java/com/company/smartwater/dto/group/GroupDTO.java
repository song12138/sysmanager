package com.company.smartwater.dto.group;

import com.company.smartwater.dto.BaseDTO;
import io.swagger.annotations.ApiModel;

import java.util.List;

@ApiModel("组织部门")
public class GroupDTO extends BaseDTO {

    private String name;

    private String code;

    private Integer sortBy;

    private Long parentId;

    private String duty;

    private String type;

    private Integer isAdmin;

    public List<GroupDTO> childs;

    public List<GroupDTO> getChilds() {
        return childs;
    }

    public void setChilds(List<GroupDTO> childs) {
        this.childs = childs;
    }

    public Integer getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Integer isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getSortBy() {
        return sortBy;
    }

    public void setSortBy(Integer sortBy) {
        this.sortBy = sortBy;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
