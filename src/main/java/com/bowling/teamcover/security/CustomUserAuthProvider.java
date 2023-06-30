package com.bowling.teamcover.security;

import com.bowling.teamcover.login.vo.LoginVo;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public class CustomUserAuthProvider implements AuthenticationProvider {
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String userId = authentication.getName();
        String userPassword = authentication.getCredentials().toString(); //userPassword

       /* LoginVo user = (LoginVo) userDetailsService.loadUserByUsername(userId);

        if(!user.getPassword().equals(EncryptionUtils.encryptMD5(userPassword))) throw new BadCredentialsException("패스워드가 일치하지 않습니다");
        return new UserToken(userId, userPassword, null, user);*/
        return null;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

    public class UserToken extends UsernamePasswordAuthenticationToken {
        private static final long serialVersionUID = 1L;

        @Getter
        @Setter
        LoginVo user;
        public UserToken(Object principal, Object credentials, Collection<? extends GrantedAuthority> authorities, LoginVo user) {
            super(principal, credentials, null);//user.getAuthorities());
            this.user = user;
            //principal : userId
            //credentials : password
        }
        @Override
        public Object getDetails() {
            return user;
        }
    }
}