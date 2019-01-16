package com.company.smartwater.service.resource;

import com.company.smartwater.domain.Resource;
import com.company.smartwater.domain.RoleResource;
import com.company.smartwater.repository.ResourceMapper;
import com.company.smartwater.repository.RoleResourceMapper;
import com.company.smartwater.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class MenuService extends BaseService {

    @Autowired
    protected ResourceMapper resourceMapper;

    @Autowired
    protected RoleResourceMapper roleResourceMapper;


    public List<Resource> getResources(){
        List<Resource> resources = resourceMapper.selectResources();
        return resources;
    }

    public List<Resource> getResourcesByRoleId(Long roldId){
        List<Long> rolesIds = new ArrayList<>();
        rolesIds.add(roldId);
        List<RoleResource> resourceIds = roleResourceMapper.selectResourcesByRoleIds(rolesIds);
        List<Long> ids  = new ArrayList<Long>();
        for(RoleResource roleResource : resourceIds){
            ids.add(roleResource.getResourceId());
        }
        if(ids.size()==0){
            return null;
        }
        List<Resource> resources = resourceMapper.selectResourcesByIds(ids);
        return  resources;
    }
}
