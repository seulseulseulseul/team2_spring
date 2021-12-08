package com.itwill.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.domain.NoticeDTO;
import com.itwill.domain.PageDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwill.mapper.NoticeMapper";


	@Override
	public void insertNotice(NoticeDTO noticeDTO) {
		sqlSession.insert(namespace+".insertNotice",noticeDTO);
		
	}

	@Override
	public NoticeDTO getNotice(int b_num) {
		return sqlSession.selectOne(namespace+".getNotice",b_num);

	}

	@Override
	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getNoticeList",pageDTO);
	}

	@Override
	public Integer getNoticeCount() {
		return sqlSession.selectOne(namespace+".getNoticeCount");

	}

	@Override
	public void deleteNotice(int b_num) {
		sqlSession.delete(namespace+".delete",b_num);
		
	}

	@Override
	public void updateNotice(NoticeDTO noticeDTO) {
		sqlSession.update(namespace+".updateNotice",noticeDTO);

	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

}
