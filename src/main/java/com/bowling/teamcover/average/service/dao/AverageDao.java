package com.bowling.teamcover.average.service.dao;

import com.bowling.teamcover.average.vo.AverageVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Mapper
public interface AverageDao {

    int insertAvgList(ArrayList<AverageVo> excelList) throws Exception;

    List<AverageVo> selectTtAvgLst()throws Exception;

    void insertTtAvgList(Map data)throws Exception;

    int updateTtAvgLst(Map data)throws Exception;

    List<AverageVo> selectAvgList(AverageVo averageVo)throws Exception;

    void insertFxprBfdt(Map fxprData)throws Exception;

    List<AverageVo> selectMemberOneAvgList(AverageVo averageVo)throws Exception;

    List<Map> selectFxprBfTnList(AverageVo averageVo)throws Exception;

    int updateAverage(List<Map> list)throws Exception;

    int fxprBfTnTotalCnt()throws Exception;

    int updateTtAvgMember(Map ttData)throws Exception;

    int selectMember()throws Exception;
}
