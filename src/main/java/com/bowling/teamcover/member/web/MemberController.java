package com.bowling.teamcover.member.web;

import com.bowling.teamcover.member.service.MemberService;
import com.bowling.teamcover.member.vo.MemberVo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MemberController {

    @Autowired
    MemberService memberService;

    private Logger log = Logger.getLogger(MemberController.class);

    @RequestMapping(value = "/member/memberList.do")
    public String memberList(@ModelAttribute MemberVo memberVo, Model model) throws Exception {

        List<MemberVo> resultList = memberService.selectMemberList();

        model.addAttribute("resultList",resultList);

        return "/member/member";
    }

    @RequestMapping(value = "/member/insertMemberForm.do")
    public String insertMemberForm(Model model, HttpServletRequest request) throws Exception {

        List<MemberVo> cuList = memberService.selectCuList();

        if(request.getParameter("pageType").equals("I")){
            model.addAttribute("pageType", "I");
        }else if(request.getParameter("pageType").equals("U")){
            model.addAttribute("pageType", "U");
        }

        model.addAttribute("cuList", cuList);

        return "/member/memberPop";
    }

    @RequestMapping(value = "/member/insertMember.do")
    public ModelAndView insertMember(@ModelAttribute MemberVo memberVo, Model model, MultipartHttpServletRequest multipartRequest) throws Exception {

        multipartRequest.setCharacterEncoding("utf-8");
        ModelAndView resultMap = new ModelAndView("jsonView");

        int cnt = memberService.insertMember(memberVo);

        if(cnt >= 1){
            memberService.insertTtAvgLst(memberVo);
            resultMap.addObject("result", "success");
        }else{
            resultMap.addObject("result", "fail");
        }

        return resultMap;
    }
}
