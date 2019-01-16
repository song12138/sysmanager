package com.company.smartwater.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel("附件")
public class CommonAttachmentDTO extends BaseDTO {

    @ApiModelProperty(value = "附件名")
    private String name;

    @ApiModelProperty(value = "附件地址")
    private String path;

    @ApiModelProperty(value = "附件大小")
    private Integer fileSize;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getFileSize() {
        return fileSize;
    }

    public void setFileSize(Integer fileSize) {
        this.fileSize = fileSize;
    }
}
