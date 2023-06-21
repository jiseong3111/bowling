package com.bowling.teamcover.cdMng.web;

import com.bowling.teamcover.cdMng.service.CdMngService;
import com.bowling.teamcover.cdMng.vo.CdMngVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
public class CdMngController{

    
    @Autowired
    private CdMngService cdMngService;

    @RequestMapping(value = "/cdMng/selectCdMngList.do")
    public String selectCdMngList(@ModelAttribute CdMngVO cdMngVO, Model model) throws Exception {

        List<CdMngVO> cdList = cdMngService.selectCdMngList(cdMngVO);

        model.addAttribute("resultList", cdList);

        return "/cdMng/selectCdMngList";
    }

    @RequestMapping(value = "/cdMng/insertCdGrdForm.do")
    public String insertCdGrdForm(@ModelAttribute CdMngVO cdMngVO, Model model) throws Exception {
        //logger.info("##### insertCdGrdForm  #####");
        Map cdList;
        String pageType="";
        if (null == cdMngVO.getCdGrpId() || cdMngVO.getCdGrpId().equals("")) {
            cdList=null;
            pageType="I";
        }else{
            cdList = cdMngService.selectCdGrd(cdMngVO.getCdGrpId());
            pageType="U";
        }
        // 리스트 조회
        model.addAttribute("pageType",pageType);
        model.addAttribute("resultList", cdList);

        //logger.debug("##### insertCdGrdForm - result : {} #####", cdList);
        return "/cdMng/insertCdMngGrpPop";
    }

    @RequestMapping(value = "/cdMng/insertCdGrp.do")
    @ResponseBody
    public ModelAndView insertCdGrp(@ModelAttribute CdMngVO cdMngVO, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //logger.info("##### insertCdGrp  #####");
        ModelAndView resultMap = new ModelAndView("jsonView");

        cdMngVO.setLastChgrNo("jiseong");

        int cnt = cdMngService.insertCdGrp(cdMngVO);
        //logger.debug("##### insertCdGrp : {} #####", cnt);

        if (cnt == 1) {
            resultMap.addObject("result", "success");
        }
        else {
            resultMap.addObject("result", "fail");
            resultMap.addObject("code", "E1");
        }

        //logger.debug("##### insertCdGrp - result : {} #####", resultMap);
        return resultMap;
    }

    @RequestMapping(value = "/cdMng/insertCdForm.do")
    public String insertCdForm(@ModelAttribute CdMngVO cdMngVO, Model model) throws Exception {
        //logger.info("##### insertCdForm  #####");
        Map cdList;
        String pageType="";
        List<CdMngVO>  cdGrdList=cdMngService.selectCdGrdList();

        if (null == cdMngVO.getCdGrpId() || cdMngVO.getCdGrpId().equals("")) {
            cdList=null;
            pageType="I";
        }else{
            cdList = cdMngService.selectCd(cdMngVO);
            pageType="U";

        }

        // 리스트 조회
        model.addAttribute("pageType",pageType);
        model.addAttribute("resultList", cdList);
        model.addAttribute("cdGrdList", cdGrdList);

        //logger.debug("##### insertCdForm - result : {} #####", cdList);

        return "/cdMng/insertCdMngPop";
    }

    @RequestMapping(value = "/cdMng/insertCd.do")
    @ResponseBody
    public ModelAndView insertCd(@ModelAttribute CdMngVO cdMngVO, Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
        //logger.info("##### insertCd  #####");
        ModelAndView resultMap = new ModelAndView("jsonView");
        cdMngVO.setLastChgrNo("jiseong");

        String existYn = cdMngService.selectCdCk(cdMngVO) == 0 ? "Y" : "N";
        //logger.debug("##### existYn : {} #####", existYn);
        // 미존재
        if ("Y".equals(existYn)) {
            // 단건 등록
            int cnt = cdMngService.insertCd(cdMngVO);
            //logger.debug("##### insertCd : {} #####", cnt);

            if (cnt > 0) {
                resultMap.addObject("result", "success");
            }
            else {
                resultMap.addObject("result", "fail");
                resultMap.addObject("code", "E1");
            }
        }
        // 존재
        else if ("N".equals(existYn)) {
            resultMap.addObject("result", "fail");
            resultMap.addObject("code", "E2");
        }
        //logger.debug("##### insertCd - result : {} #####", resultMap);
        return resultMap;
    }


}