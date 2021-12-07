package com.itwill.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.domain.CommuDTO;
import com.itwill.domain.PageDTO;

@Repository
public class CommuDAOImpl implements CommuDAO {
	//마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.CommuMapper";
	
	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}
	@Override
	public void insertBoard(CommuDTO commuDTO) {
		sqlSession.insert(namespace + ".insertBoard", commuDTO);
	}
	@Override
	public List<CommuDTO> getBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getBoardList", pageDTO);
	}
	@Override
	public CommuDTO getBoard(CommuDTO commuDTO) {
		return sqlSession.selectOne(namespace + ".getBoard", commuDTO);
	}
	@Override
	public CommuDTO numCheck(CommuDTO commuDTO) {
		return sqlSession.selectOne(namespace + ".numCheck", commuDTO);
	}
	@Override
	public void updateBoard(CommuDTO commuDTO) {
		sqlSession.update(namespace + ".updateBoard", commuDTO);
	}
	@Override
	public void deleteBoard(int c_num) {
		sqlSession.delete(namespace + ".deleteBoard", c_num);
	}
	@Override
	public void updateReadcount(int c_num) {
		sqlSession.update(namespace + ".updateReadcount", c_num);
	}
	@Override
	public Integer getBoardCount() {
		return sqlSession.selectOne(namespace + ".getBoardCount");
	}

}
