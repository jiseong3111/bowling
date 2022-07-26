package com.bowling.teamcover.average.service.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;


@Mapper
public interface AverageDao {

    public Map selectTest();
}
