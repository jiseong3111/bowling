package com.bowling.teamcover.login.service;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface LoginService extends UserDetailsService {
    void setUsersByUsernameQuery(String usersByUsernameQuery);

    void setAuthoritiesByUsernameQuery(String authoritiesByUsernameQuery);
}
