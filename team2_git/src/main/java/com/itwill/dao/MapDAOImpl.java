package com.itwill.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.domain.TrainerDTO;


@Repository
public class MapDAOImpl implements MapDAO {
	
	//마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwill.mapper.MapMapper";
	
	@Override
	public List<TrainerDTO> getAddress(String t_extraAddress) {
		
		List<TrainerDTO> trainerList = sqlSession.selectList(namespace+".getAddress", t_extraAddress);
		
		return trainerList;
	}


}
