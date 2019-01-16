package com.company.smartwater.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

@ApiModel("基础数据维护")
public class BaseDataDTO extends BaseDTO {
    @ApiModelProperty(value = "类型编码(AT-报警类型,EM-设备用途,ET-设备类型,EP-安装位置,MU-计量单位,MT-物料类别,MP-供应商分类)")
    private String type;//参照Constant.BaseDataType

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "描述")
    private String description;

    @ApiModelProperty(value = "上级数据值id")
    private Long parentId;

    @ApiModelProperty(value = "排序")
    private Integer sortBy;

    private List<BaseDataDTO> children;

    public List<BaseDataDTO> getChildren() {
        return children;
    }

    public void setChildren(List<BaseDataDTO> children) {
        this.children = children;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

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

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Integer getSortBy() {
        return sortBy;
    }

    public void setSortBy(Integer sortBy) {
        this.sortBy = sortBy;
    }

}