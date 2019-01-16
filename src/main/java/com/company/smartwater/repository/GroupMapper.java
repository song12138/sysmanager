package com.company.smartwater.repository;

import com.company.smartwater.domain.Group;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GroupMapper extends BaseMapper<Group> {

    List<Group> selectAllGroups(@Param("type") String type, @Param("duty") String duty);

    List<Group> selectAllGroupsWithParentId(@Param("id") Long id);

}