package com.company.smartwater.domain;

import com.company.smartwater.security.SecurityUtils;

import java.util.Date;

public class BaseEntity {
    private Long id;

    private String spaceCode;

    private Integer version;

    private String createdBy;

    private Date createdDate;

    private String updatedBy;

    private Date updatedDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSpaceCode() {
        return spaceCode;
    }

    public void setSpaceCode(String spaceCode) {
        this.spaceCode = spaceCode;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public void preCreate(){
        this.setSpaceCode(spaceCode == null ? SecurityUtils.getCurrentSpaceCode() : spaceCode);
        this.setCreatedBy(createdBy == null ? SecurityUtils.getCurrentUserIdStr() : createdBy);
        this.setCreatedDate(createdDate == null ? new Date() : createdDate);
        preUpdate();
    }

    public void preUpdate(){
        this.setUpdatedBy(updatedBy == null ? SecurityUtils.getCurrentUserIdStr() : updatedBy);
        this.setUpdatedDate(updatedDate == null ? new Date() : updatedDate);
        Integer version = this.getVersion();
        if(version == null){
            version = 0;
        }
        this.setVersion(version + 1);
    }
}
