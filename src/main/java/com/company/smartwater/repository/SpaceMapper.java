package com.company.smartwater.repository;

import com.company.smartwater.domain.Space;

public interface SpaceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Space record);

    int insertSelective(Space record);

    Space selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Space record);

    int updateByPrimaryKey(Space record);
}