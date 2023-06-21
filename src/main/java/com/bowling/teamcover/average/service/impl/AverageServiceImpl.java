package com.bowling.teamcover.average.service.impl;

import com.bowling.teamcover.average.service.AverageService;
import com.bowling.teamcover.average.service.dao.AverageDao;
import com.bowling.teamcover.average.vo.AverageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class AverageServiceImpl implements AverageService {

    @Autowired
    AverageDao averageDao;


    @Override
    public int insertAvgList(ArrayList<AverageVo> excelList) throws Exception {
        return averageDao.insertAvgList(excelList);
    }

    @Override
    public List<AverageVo> selectTtAvgLst() throws Exception {
        return averageDao.selectTtAvgLst();
    }

    @Override
    public void insertTtAvgList(Map data) throws Exception {
        averageDao.insertTtAvgList(data);
    }

    @Override
    public int updateTtAvgLst(Map data) throws Exception {
        return averageDao.updateTtAvgLst(data);
    }

    @Override
    public List<AverageVo> selectAvgList(AverageVo averageVo) throws Exception {
        return averageDao.selectAvgList(averageVo);
    }

    @Override
    public void insertFxprBfdt(Map fxprData) throws Exception {
        averageDao.insertFxprBfdt(fxprData);
    }

    @Override
    public List<AverageVo> selectMemberOneAvgList(AverageVo averageVo) throws Exception {
        return averageDao.selectMemberOneAvgList(averageVo);
    }

    @Override
    public List<Map> selectFxprBfTnList(AverageVo averageVo) throws Exception {
        return averageDao.selectFxprBfTnList(averageVo);
    }

    @Override
    public int updateAverage(List<Map> list) throws Exception {
        return averageDao.updateAverage(list);
    }

    @Override
    public int selectFxprBfTnTotalCnt() throws Exception {
        return averageDao.fxprBfTnTotalCnt();
    }

    @Override
    public int updateTtAvgMember(Map ttData) throws Exception {
        return averageDao.updateTtAvgMember(ttData);
    }

    @Override
    public int selectMember() throws Exception {
        return averageDao.selectMember();
    }
}
