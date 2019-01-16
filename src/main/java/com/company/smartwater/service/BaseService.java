package com.company.smartwater.service;

import com.company.smartwater.domain.UserGroup;
import com.company.smartwater.dto.CodeValueDTO;
import com.company.smartwater.dto.CommonAttachmentDTO;
import com.company.smartwater.service.group.GroupService;
import com.company.smartwater.utils.BeanUtils;
import com.company.smartwater.utils.RfcPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class BaseService {


    //默认密码比较器
    @Autowired
    protected PasswordEncoder passwordEncoder;


    public static final String ACCT_PASSWORD_TYPE_RFC = "RFC";

    public boolean passwordMatches(final String passwordType, final String rawPassword,
                                   final String encodedPassword) {
        if (ACCT_PASSWORD_TYPE_RFC.equalsIgnoreCase(passwordType)) {
            if (!RfcPasswordEncoder.matches(rawPassword, encodedPassword)) {
                return false;
            }
            return true;
        } else {
            if (!passwordEncoder.matches(rawPassword, encodedPassword)) {
                return false;
            }
            return true;
        }

    }

    protected String getString(String[] s, int idx){
        try{
            return s[idx].trim();
        }catch (Exception e){
        }

        return null;
    }
}
