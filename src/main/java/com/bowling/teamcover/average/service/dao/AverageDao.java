package com.bowling.teamcover.average.service.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
public interface AverageDao {
    int selectTest() throws Exception;
}
