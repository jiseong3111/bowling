package com.bowling.teamcover.login.service.dao;

import com.bowling.teamcover.login.vo.LoginVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDao {
    int signUp(LoginVo loginVo);
}
