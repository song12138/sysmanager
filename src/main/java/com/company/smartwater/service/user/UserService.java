package com.company.smartwater.service.user;


import com.company.smartwater.domain.User;
import com.company.smartwater.repository.*;
import com.company.smartwater.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class UserService extends BaseService {

    @Autowired
    protected UserMapper userMapper;

    public User getUserByAccount(String account){
       return userMapper.selectByAccount(account);
    }




}
