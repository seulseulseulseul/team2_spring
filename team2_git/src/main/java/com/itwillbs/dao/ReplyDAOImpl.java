package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	//마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.ReplyMapper";
	
	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}
	@Override
	public Integer getMaxOrder() {
		return sqlSession.selectOne(namespace+".getMaxOrder");
	}
	@Override
	public void insertBoard(ReplyDTO replyDTO) {
		sqlSession.insert(namespace + ".insertBoard", replyDTO);
	}
	@Override
	public ReplyDTO getBoard(int r_num) {
		return sqlSession.selectOne(namespace+".getBoard", r_num);
	}
	@Override
	public List<ReplyDTO> getBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getBoardList", pageDTO);
	}
	@Override
	public ReplyDTO numCheck(ReplyDTO replyDTO) {
		return sqlSession.selectOne(namespace + ".numCheck", replyDTO);
	}
	@Override
	public void updateBoard(ReplyDTO replyDTO) {
		sqlSession.update(namespace + ".updateBoard", replyDTO);
	}
	@Override
	public void deleteBoard(int r_num) {
		sqlSession.delete(namespace + ".deleteBoard", r_num);
	}
	@Override
	public void deleteBoardAll(int c_num) {
		sqlSession.delete(namespace + ".deleteBoard", c_num);
	}
	@Override
	public Integer getBoardCount(int c_num) {
		return sqlSession.selectOne(namespace + ".getBoardCount");
	}
	@Override
	public void reOrder(int order) {
		sqlSession.update(namespace + ".reOorder", order);
	}

}
