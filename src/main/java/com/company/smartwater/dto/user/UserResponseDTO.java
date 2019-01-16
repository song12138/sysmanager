package com.company.smartwater.dto.user;

import com.company.smartwater.dto.BaseDTO;
import com.company.smartwater.dto.group.GroupDTO;

import java.util.List;

public class UserResponseDTO extends BaseDTO {

    private String fullName;

    private String code;

    private String officePhone;

    private String telphone;

    private String account;

    private String status;

    private String remarks;

    private String spaceCode;

    private String roleName;

    private Long groupId;

    private GroupDTO department;

    private GroupDTO company;

    private GroupDTO group;

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    private List<RoleResponseDTO> roles;

    public List<RoleResponseDTO> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleResponseDTO> roles) {
        this.roles = roles;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getOfficePhone() {
        return officePhone;
    }

    public void setOfficePhone(String officePhone) {
        this.officePhone = officePhone;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getSpaceCode() {
        return spaceCode;
    }

    public void setSpaceCode(String spaceCode) {
        this.spaceCode = spaceCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public GroupDTO getDepartment() {
        return department;
    }

    public void setDepartment(GroupDTO department) {
        this.department = department;
    }

    public GroupDTO getCompany() {
        return company;
    }

    public void setCompany(GroupDTO company) {
        this.company = company;
    }

    public GroupDTO getGroup() {
        return group;
    }

    public void setGroup(GroupDTO group) {
        this.group = group;
    }
}
