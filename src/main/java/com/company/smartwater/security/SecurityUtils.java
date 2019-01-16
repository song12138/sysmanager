package com.company.smartwater.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * Utility class for Spring Security.
 */
public final class SecurityUtils {

    public static final String TOKEN_BODY_SEPARATOR = "_";

    private SecurityUtils() {
    }

    public static String getCurrentUserLogin() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        String name = null;
        if (authentication != null) {
            if (authentication.getPrincipal() instanceof UserDetails) {
                UserDetails springSecurityUser = (UserDetails)authentication.getPrincipal();
                name = springSecurityUser.getUsername();
            } else if (authentication.getPrincipal() instanceof String) {
                name = (String)authentication.getPrincipal();
            }
        }
        return name;
    }

    public static String getCurrentSpaceCode(){
        return getCurrentUserLogin().split(TOKEN_BODY_SEPARATOR)[0];
    }

    public static String getCurrentUser(){
        return getCurrentUserLogin().split(TOKEN_BODY_SEPARATOR)[1];
    }

    public static Long getCurrentUserId(){
        return Long.valueOf(getCurrentUserLogin().split(TOKEN_BODY_SEPARATOR)[2]);
    }

    public static String getCurrentUserIdStr(){
        String login = getCurrentUserLogin();
        if(login == null || login.length() == 0){
            return "Sys";
        }

        return login.split(TOKEN_BODY_SEPARATOR)[2];
    }
}
