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
	
	@Override
	public Integer isReply(int b_num) {
		return sqlSession.selectOne(namespace+".isReply",b_num);
	}

	@Override
	public CenterDTO getCenter(int b_num) {
		return sqlSession.selectOne(namespace+".getCenter",b_num);
	}

	@Override
	public void insertReply(CenterDTO centerDTO) {
		System.out.println("CenterDAOImpl insertReply()");
		sqlSession.insert(namespace+".insertReply",centerDTO);
	}
 
	@Override
	public Integer getMaxReply(int b_num) {
		return sqlSession.selectOne(namespace+".getMaxReply",b_num);
	}

	@Override
	public List<CenterDTO> getReplyList(int b_num) {
		return sqlSession.selectList(namespace+".getReplyList",b_num);
	}

	@Override
	public void deleteCenter(int b_num) {
		sqlSession.delete(namespace+".delete",b_num);
	}

	@Override
	public void deleteReply(CenterDTO centerDTO) {
		sqlSession.delete(namespace+".deleteReply",centerDTO);
	}

	@Override
	public void updateCenter(CenterDTO centerDTO) {
		sqlSession.update(namespace+".updateCenter",centerDTO);
	}

	@Override
	public List<CenterDTO> getCenterList2() {
		return sqlSession.selectList(namespace+".getCenterList2");
	}
}
