package com.company.smartwater.service.login;

import com.company.smartwater.config.OAuth2Properties;
import com.company.smartwater.constant.Constants;
import com.company.smartwater.constant.ReturnCode;
import com.company.smartwater.domain.User;
import com.company.smartwater.dto.user.RoleResponseDTO;
import com.company.smartwater.dto.user.UserResponseDTO;
import com.company.smartwater.repository.UserMapper;
import com.company.smartwater.security.SecurityUtils;
import com.company.smartwater.service.BaseService;
import com.company.smartwater.service.ResultInfo;
import com.company.smartwater.service.user.UserService;
import com.company.smartwater.utils.LogUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.security.oauth2.common.exceptions.InvalidClientException;
import org.springframework.security.oauth2.common.exceptions.InvalidGrantException;
import org.springframework.security.oauth2.common.exceptions.InvalidRequestException;
import org.springframework.security.oauth2.common.exceptions.UnsupportedGrantTypeException;
import org.springframework.security.oauth2.common.util.OAuth2Utils;
import org.springframework.security.oauth2.provider.*;
import org.springframework.security.oauth2.provider.request.DefaultOAuth2RequestValidator;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class LoginService extends BaseService{

    private final String AUTHORIZED_GRANT_TYPES_USERNAME = "username";
    private final String AUTHORIZED_GRANT_TYPES_PASSWORD = "password";
    private final String AUTHORIZED_GRANT_TYPES_REFRESH_TOKEN = "refresh_token";
    private final String AUTHORIZED_GRANT_TYPES = "grant_type";

    @Autowired
    private OAuth2Properties oAuth2Properties;

    @Autowired
    private ClientDetailsService clientDetailsService;

    @Autowired
    private OAuth2RequestFactory oAuth2RequestFactory;

    @Autowired
    private AuthorizationServerTokenServices tokenServices;

    public OAuth2AccessToken getToken(User user) {
        Long userId = user.getId();
        String clientId = oAuth2Properties.getWebClientConfiguration().getClientId();
        Map<String, String> parameters = new HashMap<>();
        parameters.put(AUTHORIZED_GRANT_TYPES, AUTHORIZED_GRANT_TYPES_PASSWORD);
        parameters.put(AUTHORIZED_GRANT_TYPES_USERNAME, user.getAccount());

        ClientDetails authenticatedClient = clientDetailsService.loadClientByClientId(clientId);
        TokenRequest tokenRequest = oAuth2RequestFactory.createTokenRequest(parameters, authenticatedClient);

        if (clientId != null && !clientId.equals("")) {
            if (!clientId.equals(tokenRequest.getClientId())) {
                throw new InvalidClientException("Given client ID does not match authenticated client");
            }
        }

        if (authenticatedClient != null) {
            OAuth2RequestValidator oAuth2RequestValidator = new DefaultOAuth2RequestValidator();
            oAuth2RequestValidator.validateScope(tokenRequest, authenticatedClient);
        }
        if (!StringUtils.hasText(tokenRequest.getGrantType())) {
            throw new InvalidRequestException("Missing grant type");
        }
        if (tokenRequest.getGrantType().equals("implicit")) {
            throw new InvalidGrantException("Implicit grant type not supported from token endpoint");
        }

        if (isAuthCodeRequest(parameters)) {
            // The scope was requested or determined during the authorization step
            if (!tokenRequest.getScope().isEmpty()) {
                tokenRequest.setScope(Collections.<String>emptySet());
            }
        }

        if (isRefreshTokenRequest(parameters)) {
            // A refresh token has its own default scopes, so we should ignore any added by the factory here.
            tokenRequest.setScope(OAuth2Utils.parseParameterList(parameters.get(OAuth2Utils.SCOPE)));
        }

        //OAuth2AccessToken token = tokenGranter.grant(tokenRequest.getGrantType(), tokenRequest);
        OAuth2Request storedOAuth2Request = oAuth2RequestFactory.createOAuth2Request(authenticatedClient, tokenRequest);

        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();

        grantedAuthorities.add((new SimpleGrantedAuthority("anonymoususer")));

        Authentication userAuth = new UsernamePasswordAuthenticationToken(userId, "", grantedAuthorities);
        OAuth2AccessToken token = tokenServices.createAccessToken(new OAuth2Authentication(storedOAuth2Request, userAuth));
        if (token == null) {
            throw new UnsupportedGrantTypeException("Unsupported grant type: " + tokenRequest.getGrantType());
        }

        return token;
    }

    private boolean isAuthCodeRequest(Map<String, String> parameters) {
        return "authorization_code".equals(parameters.get("grant_type")) && parameters.get("code") != null;
    }

    private boolean isRefreshTokenRequest(Map<String, String> parameters) {
        return "refresh_token".equals(parameters.get("grant_type")) && parameters.get("refresh_token") != null;
    }

}
