package com.company.smartwater.dto.login;

import com.company.smartwater.dto.user.UserResponseDTO;

public class LoginResponseDTO {

    private Token token;
    private UserResponseDTO userInfo;

    static class Token{
        private String access_token;
        private String token_type;
        private String refresh_token;
        private String expires_in;
        private String scope;

        public String getAccess_token() {
            return access_token;
        }

        public void setAccess_token(final String access_token) {
            this.access_token = access_token;
        }

        public String getToken_type() {
            return token_type;
        }

        public void setToken_type(final String token_type) {
            this.token_type = token_type;
        }

        public String getRefresh_token() {
            return refresh_token;
        }

        public void setRefresh_token(final String refresh_token) {
            this.refresh_token = refresh_token;
        }

        public String getExpires_in() {
            return expires_in;
        }

        public void setExpires_in(final String expires_in) {
            this.expires_in = expires_in;
        }

        public String getScope() {
            return scope;
        }

        public void setScope(final String scope) {
            this.scope = scope;
        }
    }

    public Token getToken() {
        return token;
    }

    public void setToken(final Token token) {
        this.token = token;
    }

    public UserResponseDTO getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(final UserResponseDTO userInfo) {
        this.userInfo = userInfo;
    }
}
