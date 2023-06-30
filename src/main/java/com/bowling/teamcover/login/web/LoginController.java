package com.bowling.teamcover.login.web;

import com.bowling.teamcover.member.vo.MemberVo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    private Logger log = Logger.getLogger(getClass());

    @RequestMapping(value = "/login")
    public String login() throws Exception {
        return "/login/login";
    }

    @RequestMapping(value = "/join")
    public String mbrJoin() throws Exception {
        return "/join/join";
    }

    @RequestMapping(value = "/main")
    public String loginProcess(@ModelAttribute MemberVo memberVo, Model model) throws Exception {
        return "/main";
    }


}
