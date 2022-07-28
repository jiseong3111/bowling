package com.bowling.teamcover.member.service;

import com.bowling.teamcover.member.vo.MemberVo;

import java.util.List;

public interface MemberService {

    List<MemberVo> selectCuList()throws Exception;

    int insertMember(MemberVo memberVo)throws Exception;

    List<MemberVo> selectMemberList()throws Exception;
}
