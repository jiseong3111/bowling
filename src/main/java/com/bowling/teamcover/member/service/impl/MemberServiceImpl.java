package com.bowling.teamcover.member.service.impl;

import com.bowling.teamcover.member.service.MemberService;
import com.bowling.teamcover.member.service.dao.MemberDao;
import com.bowling.teamcover.member.vo.MemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberDao memberDao;

    @Override
    public List<MemberVo> selectCuList() throws Exception {
        return memberDao.selectCuList();
    }

    @Override
    public int insertMember(MemberVo memberVo) throws Exception {
        return memberDao.insertMember(memberVo);
    }

    @Override
    public List<MemberVo> selectMemberList() throws Exception {
        return memberDao.selectMemberList();
    }

    @Override
    public void insertTtAvgLst(MemberVo memberVo) throws Exception {
        memberDao.insertTtAvgLst(memberVo);
    }
}
