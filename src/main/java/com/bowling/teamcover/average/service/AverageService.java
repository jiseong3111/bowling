package com.bowling.teamcover.average.service;


import com.bowling.teamcover.average.vo.AverageVo;

import java.util.ArrayList;
import java.util.Map;

public interface AverageService {
    public int insertAvgList(ArrayList<AverageVo> excelList)throws Exception;
}
