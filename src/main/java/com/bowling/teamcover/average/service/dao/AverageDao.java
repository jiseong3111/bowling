package com.bowling.teamcover.average.service.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AverageDao {

    @Autowired
    SqlSession sqlSession;




}
