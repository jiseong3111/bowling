package com.bowling.teamcover.login.web;

import com.bowling.teamcover.login.service.LoginService;
import com.bowling.teamcover.login.vo.LoginVo;
import com.bowling.teamcover.member.vo.MemberVo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @Autowired
    LoginService loginService;

    private Logger log = Logger.getLogger(getClass());

    @RequestMapping(value = "/login")
    public String login() throws Exception {
        return "/login/login";
    }

    @RequestMapping(value = "/joinPage")
    public String mbrJoin() throws Exception {
        return "/join/join";
    }

    @RequestMapping(value = "/signUp")
    public String signUp(@ModelAttribute LoginVo loginVo, Model model) throws Exception {

        log.debug("params ==> " + loginVo.toString());
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        loginVo.setPassword(passwordEncoder.encode(loginVo.getPassword()));
        int cnt = loginService.signUp(loginVo);

        if (cnt > 0) {
            model.addAttribute("result", "success");

            return "/login/login";
        } else {
            model.addAttribute("result", "fail");

            return "/join/join";
        }
    }

    @RequestMapping(value = "/main")
    public String loginProcess(@ModelAttribute MemberVo memberVo, Model model) throws Exception {

        
        return "/main";
    }


}
