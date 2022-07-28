package com.bowling.teamcover.average.service;


import com.bowling.teamcover.average.vo.AverageVo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface AverageService {
    int insertAvgList(ArrayList<AverageVo> excelList)throws Exception;

    List<AverageVo> selectTtAvgLst()throws Exception;

    void insertTtAvgList(Map data)throws Exception;
}
