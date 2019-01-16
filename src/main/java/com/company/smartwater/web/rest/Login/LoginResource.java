package com.company.smartwater.web.rest.Login;

import com.company.smartwater.constant.Constants;
import com.company.smartwater.constant.ReturnCode;
import com.company.smartwater.domain.User;
import com.company.smartwater.dto.ReturnResultDTO;
import com.company.smartwater.dto.login.LoginRequestDTO;
import com.company.smartwater.service.ResultInfo;
import com.company.smartwater.service.login.LoginService;
import com.company.smartwater.service.user.UserService;
import com.company.smartwater.utils.LogUtil;
import com.company.smartwater.utils.Validators;
import com.company.smartwater.web.rest.BaseResource;
import io.swagger.annotations.*;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.ResourceServerTokenServices;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Api(value = "用户登录", description = "用户登录")
@RestController
@RequestMapping("/api")
public class LoginResource extends BaseResource {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private LoginService loginService;

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/authenticate")
    @ApiOperation(value = "普通登录", notes = "必填：用户名、密码；")
    public ResponseEntity<?> authorize(final @RequestBody LoginRequestDTO loginRequestDTO) {
        try {
            //非空验证
            if (StringUtils.isBlank(loginRequestDTO.getUsername())
                    || StringUtils.isBlank(loginRequestDTO.getPassword())) {
               //TODO
            }

            //根据登录名获取用户
            User user = userService.getUserByAccount(loginRequestDTO.getUsername());
            //判断用户是否存在、密码是否正确
            if (user == null || !passwordEncoder.matches(loginRequestDTO.getPassword(), user.getPassword())) {
                return prepareReturnResult(ReturnCode.ERROR_AUTHORIZATION, null);
            }
            return prepareReturnResult(ReturnCode.CREATE_SUCCESS, loginService.getToken(user));
        } catch (Exception e) {
            return prepareReturnResult(ReturnCode.ERROR_AUTHORIZATION, null);
        }
    }

}
