package com.bowling.teamcover.average.service.dao;

import com.bowling.teamcover.average.vo.AverageVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Map;


@Mapper
public interface AverageDao {

    public Map selectTest();

    int insertAvgList(ArrayList<AverageVo> excelList) throws Exception;
}
