package com.company.smartwater.repository;

import com.company.smartwater.domain.UserGroup;

import java.util.List;

public interface UserGroupMapper extends BaseMapper<UserGroup> {

    int deleteUserGroupsByUserId(Long userId);

    int batchInsert(List<UserGroup> records);

    List<UserGroup> getAllGroupIdsByUserId(Long userId);

}