package com.bowling.teamcover.cdMng.service.dao;

import com.bowling.teamcover.cdMng.vo.CdMngVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CdMngDao {
    List<CdMngVO> selectCdMngList(CdMngVO cdMngVO)throws Exception;

    Map selectCdGrd(String cdGrpId)throws Exception;

    int insertCdGrp(CdMngVO cdMngVO)throws Exception;

    List<CdMngVO> selectCdGrdList()throws Exception;

    Map selectCd(CdMngVO cdMngVO)throws Exception;

    int selectCdCk(CdMngVO cdMngVO)throws Exception;

    int insertCd(CdMngVO cdMngVO)throws Exception;
}
