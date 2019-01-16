package com.company.smartwater.repository;

import com.company.smartwater.domain.Resource;

import java.util.List;

public interface ResourceMapper{

    List<Resource> selectResourcesByIds(List<Long> ids);

    List<Resource> selectResources();
}