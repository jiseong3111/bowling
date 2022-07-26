package com.bowling.teamcover.average.service.impl;

import com.bowling.teamcover.average.service.AverageService;
import com.bowling.teamcover.average.service.dao.AverageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class AverageServiceImpl implements AverageService {

    @Autowired
    AverageDao averageDao;

    @Override
    public Map selectTest() throws Exception {
        return averageDao.selectTest();
    }

}
