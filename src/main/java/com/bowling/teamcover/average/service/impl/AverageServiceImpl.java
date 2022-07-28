package com.bowling.teamcover.average.service.impl;

import com.bowling.teamcover.average.service.AverageService;
import com.bowling.teamcover.average.service.dao.AverageDao;
import com.bowling.teamcover.average.vo.AverageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;

@Service
public class AverageServiceImpl implements AverageService {

    @Autowired
    AverageDao averageDao;


    @Override
    public int insertAvgList(ArrayList<AverageVo> excelList) throws Exception {
        return averageDao.insertAvgList(excelList);
    }
}
