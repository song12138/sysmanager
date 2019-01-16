package com.company.smartwater.web.rest.Login;

import com.company.smartwater.constant.ReturnCode;
import com.company.smartwater.dto.ReturnResultDTO;
import com.company.smartwater.security.SecurityUtils;
import com.company.smartwater.service.login.LoginService;
import com.company.smartwater.web.rest.BaseResource;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.OAuth2RequestFactory;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.oauth2.provider.token.ConsumerTokenServices;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;

@Api(value = "用户登出", description = "用户登出")
@RestController
@RequestMapping("/api")
public class LogoutResource extends BaseResource {

    @Autowired
    private LoginService loginService;

    @Autowired
    private ConsumerTokenServices consumerTokenServices;

    @Autowired
    private TokenStore tokenStore;

    @Autowired
    private AuthorizationServerTokenServices tokenServices;

    @Autowired
    private OAuth2RequestFactory oAuth2RequestFactory;


    @ApiOperation(value = "退出登录", notes = "退出登录" )
    @PostMapping("/logout")
    @ApiResponses(value = {@ApiResponse(code = 200, message = "成功")})
    public ResponseEntity<ReturnResultDTO<?>> logout(HttpServletRequest request, HttpServletResponse response) {
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            OAuth2AuthenticationDetails detail = ((OAuth2AuthenticationDetails) ((OAuth2Authentication) auth).getDetails());
            Collection<OAuth2AccessToken> tokens = tokenStore.findTokensByClientIdAndUserName(
                    "web_app",
                    SecurityUtils.getCurrentUserLogin());
            for (OAuth2AccessToken token : tokens) {
                consumerTokenServices.revokeToken(token.getValue());
            }
            consumerTokenServices.revokeToken(detail.getTokenValue());
            if (auth != null){
                new SecurityContextLogoutHandler().logout(request, response, auth);
            }
            return prepareReturnResult(ReturnCode.DELETE_SUCCESS, null);
        } catch (Exception ae) {
            return prepareReturnResult(ReturnCode.ERROR_DELETE, ae);
        }

    }

}
