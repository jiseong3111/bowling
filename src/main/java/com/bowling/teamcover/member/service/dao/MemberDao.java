package com.bowling.teamcover.member.service.dao;

import com.bowling.teamcover.member.vo.MemberVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberDao {
    List<MemberVo> selectCuList()throws Exception;

    int insertMember(MemberVo memberVo)throws Exception;

    List<MemberVo> selectMemberList()throws Exception;

    void insertTtAvgLst(MemberVo memberVo)throws Exception;
}
