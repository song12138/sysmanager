package com.company.smartwater.repository;

import com.company.smartwater.domain.User;
import com.company.smartwater.dto.user.UserResponseDTO;

import java.util.List;
import java.util.Map;

public interface UserMapper extends BaseMapper<User> {

    User selectByAccount(String username);

    List<UserResponseDTO> selectUsers(Map<String, Object> map);

}