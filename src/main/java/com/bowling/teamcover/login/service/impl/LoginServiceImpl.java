package com.bowling.teamcover.login.service.impl;

import com.bowling.teamcover.login.service.LoginService;
import com.bowling.teamcover.login.vo.LoginVo;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;
import java.util.Collection;

public class LoginServiceImpl extends LoginService implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        username="test";
        LoginVo userVO = new LoginVo();

        String password = "1234";
        userVO.setPassword(password);
        /*PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        userVO.setPassword(passwordEncoder.encode(password));*/

        Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
        roles.add(new SimpleGrantedAuthority("ROLE_USER"));

        UserDetails user = new User(username, userVO.getPassword(), roles);

        return user;
    }

}
