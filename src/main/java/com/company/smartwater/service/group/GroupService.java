package com.company.smartwater.service.group;

import com.company.smartwater.domain.Group;
import com.company.smartwater.domain.UserGroup;
import com.company.smartwater.dto.group.GroupDTO;
import com.company.smartwater.repository.GroupMapper;
import com.company.smartwater.repository.UserGroupMapper;
import com.company.smartwater.repository.UserMapper;
import com.company.smartwater.service.BaseService;
import com.company.smartwater.utils.BeanUtils;
import com.company.smartwater.utils.Validators;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class GroupService extends BaseService {

    @Autowired
    protected UserMapper userMapper;

    @Autowired
    protected GroupMapper groupMapper;

    @Autowired
    protected UserGroupMapper userGroupMapper;


    public List<GroupDTO> selectAllGroupsWithTree(String type, String duty){
        List<Group> groups = groupMapper.selectAllGroups(type,duty);
        Map<Long,List<GroupDTO>> groupMaps = new HashMap<Long,List<GroupDTO>>();
        List<GroupDTO> groupList = new ArrayList<GroupDTO>();
        List<GroupDTO> returnList = new ArrayList<GroupDTO>();
        for(Group group : groups){
              if(group.getParentId()==null || group.getParentId()==0){
                GroupDTO groupDTO = new GroupDTO();
                BeanUtils.copyPropertiesExcludeNull(group, groupDTO);
                groupList.add(groupDTO);
            }
            GroupDTO groupDTO = new GroupDTO();
            BeanUtils.copyPropertiesExcludeNull(group, groupDTO);
            groupMaps.put(group.getId(),perGroups(group.getId(),groups));
        }
        for(GroupDTO groupDTO : groupList){
            groupDTO = checkChilds(groupMaps,groupDTO);
            returnList.add(groupDTO);
        }
        return returnList;
    }


    public List<Group> selectDownGroupsWithTreeByGroupId(Long id){
        Group groupTemp = groupMapper.selectByPrimaryKey(id);
        List<Group> groups = selectAllGroupsWithParentId(groupTemp.getId(),new ArrayList<Group>());
        groups.add(groupTemp);
        return groups;
    }

    private List<Group> selectAllGroupsWithParentId(Long parentId, List<Group> groups){
        List<Group> groupTemps = groupMapper.selectAllGroupsWithParentId(parentId);
        if(groupTemps!=null && groupTemps.size()>0){
            groups.addAll(groupTemps);
            for(Group group : groupTemps){
                groups = selectAllGroupsWithParentId(group.getId(),groups);
            }
        }
        return groups;
    }


    private GroupDTO checkChilds(Map<Long,List<GroupDTO>> groupMaps, GroupDTO groupDTO ) {
        List<GroupDTO> temps = groupMaps.get(groupDTO.getId());
        if (temps != null) {
            groupDTO.setChilds(temps);
            for (GroupDTO tempDTO : temps) {
                tempDTO = checkChilds(groupMaps,tempDTO);
            }
        }
        return groupDTO;
    }

    private List<GroupDTO>  perGroups (Long parentId, List<Group> groups){
        List<GroupDTO> childs = new ArrayList<GroupDTO>();
        for(Group group : groups) {
            if (parentId.compareTo(group.getParentId()) == 0) {
                GroupDTO groupTemp = new GroupDTO();
                BeanUtils.copyPropertiesExcludeNull(group, groupTemp);
                childs.add(groupTemp);
            }
        }
        return childs;
    }

    public List<Group> selectAllGroups(String type, String duty){
        return groupMapper.selectAllGroups(type,duty);
    }

    public GroupDTO createGroupInfo(GroupDTO groupDTO){
       Group group = new Group();
       BeanUtils.copyPropertiesExcludeNull(groupDTO, group);
       if(group.getParentId()==null){
           group.setParentId(0L); 
       }
       groupMapper.saveInsert(group);
       groupDTO.setId(group.getId());
       return groupDTO;
    }


    public GroupDTO updateGroupInfo(GroupDTO groupDTO){
        Group group = groupMapper.selectByPrimaryKey(groupDTO.getId());
        group.setName(groupDTO.getName());
        group.setCode(groupDTO.getCode());
        group.setParentId(groupDTO.getParentId());
        group.setType(groupDTO.getType());
        group.setDuty(groupDTO.getDuty());
        groupMapper.saveUpdate(group);
        return groupDTO;
    }



    public List<UserGroup> getAllGroupIdsByUserId(final Long userId){
        return userGroupMapper.getAllGroupIdsByUserId(userId);
    }

    public int deleteGroupId(final Long groupId){
        return groupMapper.deleteByPrimaryKey(groupId);
    }

    public GroupDTO getCurrentGroupDetail(final Long id, final String child){
        GroupDTO groupDTO = new GroupDTO();
        Group group =  groupMapper.selectByPrimaryKey(id);
        BeanUtils.copyPropertiesExcludeNull(group, groupDTO);
        if(Validators.fieldNotEmpty(child) && "Y".equalsIgnoreCase(child)){
           List<Group> groups = groupMapper.selectAllGroupsWithParentId(group.getId());
            if(groups != null && groups.size()>0){
                List<GroupDTO> groupList = new ArrayList<GroupDTO>();
                for(Group temp : groups){
                    GroupDTO groupTemp = new GroupDTO();
                    BeanUtils.copyPropertiesExcludeNull(temp, groupTemp);
                    groupList.add(groupTemp);
                }
                groupDTO.setChilds(groupList);
            }
        }
        return groupDTO;
    }

}
