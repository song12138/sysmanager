package com.company.smartwater.repository;

import com.company.smartwater.domain.UserRole;

import java.util.List;

public interface UserRoleMapper extends BaseMapper<UserRole> {

    List<UserRole> selectRoleIds(Long userId);

    int batchInsert(List<UserRole> records);

    int deleteRolesByUserId(Long userId);
}