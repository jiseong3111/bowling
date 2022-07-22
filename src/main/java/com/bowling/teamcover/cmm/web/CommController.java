package com.bowling.teamcover.cmm.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * <pre>
 * 공통업무를 관리
 * </pre>
 *
 * @ClassName   : CommController.java
 * @Description : 공통업무를 관리
 * @author Choi MyeongJin
 * @since 2018. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 1. 11.     Choi MyeongJin         최초 생성
 * </pre>
 */

@Controller
public class CommController{
    /**
     * 로그인 페이지
     *
     * @param loginCheck
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/login.do")
    public String login(@ModelAttribute("loginCheck") String loginCheck, Model model) throws Exception {

        return "/login/login";
    }
}