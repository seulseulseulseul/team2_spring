package com.itwill.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.domain.CenterDTO;
import com.itwill.domain.PageDTO;

@Repository
public class CenterDAOImpl implements CenterDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwill.mapper.CenterMapper";
	
	@Override
	public void insertCenter(CenterDTO centerDTO) {
		System.out.println("CenterDAOImpl insertCenter()");
		//디비작업
		sqlSession.insert(namespace+".insertCenter",centerDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<CenterDTO> getCenterList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getCenterList",pageDTO);
	}

	@Override
	public Integer getCenterCount() {
		return sqlSession.selectOne(namespace+".getCenterCount");
	}
	
}
