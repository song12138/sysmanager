package com.company.smartwater.repository;

import com.company.smartwater.domain.Role;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {

    List<Role> selectRoles(List<Long> ids);

    List<Role> selectAllRoles();
}