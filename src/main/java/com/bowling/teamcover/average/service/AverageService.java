package com.bowling.teamcover.average.service;


import com.bowling.teamcover.average.vo.AverageVo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface AverageService {
    int insertAvgList(ArrayList<AverageVo> excelList)throws Exception;

    List<AverageVo> selectTtAvgLst()throws Exception;

    void insertTtAvgList(Map data)throws Exception;

    int updateTtAvgLst(Map data)throws Exception;

    List<AverageVo> selectAvgList(AverageVo averageVo)throws Exception;

    void insertFxprBfdt(Map fxprData)throws Exception;

    List<AverageVo> selectMemberOneAvgList(AverageVo averageVo)throws Exception;

    List<Map> selectFxprBfTnList(AverageVo averageVo)throws Exception;
}
