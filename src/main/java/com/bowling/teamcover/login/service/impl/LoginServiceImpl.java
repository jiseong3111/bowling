package com.bowling.teamcover.login.service.impl;

import com.bowling.teamcover.login.service.LoginService;
import com.bowling.teamcover.login.service.dao.LoginDao;
import com.bowling.teamcover.login.vo.LoginVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.Collection;

public class LoginServiceImpl implements UserDetailsService, LoginService {

    @Autowired
    LoginDao loginDao;

    @Override
    public int signUp(LoginVo loginVo) {
        return loginDao.signUp(loginVo);
    }

    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {

        userId="test";
        LoginVo userVO = new LoginVo();

        String password = "1234";
        userVO.setPassword(password);
        /*PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        userVO.setPassword(passwordEncoder.encode(password));*/

        Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
        roles.add(new SimpleGrantedAuthority("ROLE_USER"));

        UserDetails user = new User(userId, userVO.getPassword(), roles);

        return user;
    }
}
