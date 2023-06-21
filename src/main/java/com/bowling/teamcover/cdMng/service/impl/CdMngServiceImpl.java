package com.bowling.teamcover.cdMng.service.impl;

import com.bowling.teamcover.cdMng.service.CdMngService;
import com.bowling.teamcover.cdMng.service.dao.CdMngDao;
import com.bowling.teamcover.cdMng.vo.CdMngVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CdMngServiceImpl implements CdMngService {

    @Autowired
    CdMngDao cdMngDao;

    @Override
    public List<CdMngVO> selectCdMngList(CdMngVO cdMngVO) throws Exception {
        return cdMngDao.selectCdMngList(cdMngVO);
    }

    @Override
    public Map selectCdGrd(String cdGrpId) throws Exception {
        return cdMngDao.selectCdGrd(cdGrpId);
    }

    @Override
    public int insertCdGrp(CdMngVO cdMngVO) throws Exception {
        return cdMngDao.insertCdGrp(cdMngVO);
    }

    @Override
    public List<CdMngVO> selectCdGrdList() throws Exception {
        return cdMngDao.selectCdGrdList();
    }

    @Override
    public Map selectCd(CdMngVO cdMngVO) throws Exception {
        return cdMngDao.selectCd(cdMngVO);
    }

    @Override
    public int selectCdCk(CdMngVO cdMngVO) throws Exception {
        return cdMngDao.selectCdCk(cdMngVO);
    }

    @Override
    public int insertCd(CdMngVO cdMngVO) throws Exception {
        return cdMngDao.insertCd(cdMngVO);
    }
}
