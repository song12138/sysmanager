package com.company.smartwater.repository;

import com.company.smartwater.domain.RoleResource;

import java.util.List;

public interface RoleResourceMapper extends BaseMapper<RoleResource> {

    List<RoleResource> selectResourcesByRoleIds(List<Long> ids);

    int batchInsert(List<RoleResource> records);

    int deleteResourcesByRoleId(Long roleId);
}