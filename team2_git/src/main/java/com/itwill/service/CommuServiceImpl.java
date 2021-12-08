package com.itwill.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.CommuDAO;
import com.itwill.domain.CommuDTO;
import com.itwill.domain.PageDTO;

@Service
public class CommuServiceImpl implements CommuService{
	
	@Inject
	private CommuDAO commuDAO;
	
	// 커뮤니티글 작성
	@Override
	public void insertBoard(CommuDTO commuDTO) {
		// 조회수 0, 작성시간 입력
		commuDTO.setReadcount(0);
		commuDTO.setDate(new Timestamp(System.currentTimeMillis()));
		// 커뮤니티글 번호 설정
		if(commuDAO.getMaxNum()==null) {
			//글이 없는경우 1로 설정
			commuDTO.setC_num(1);
		} else {
			// 글이 있으면 max(c_num)+1
			commuDTO.setC_num(commuDAO.getMaxNum()+1);
		}
		
		commuDAO.insertBoard(commuDTO);
	}
	// 커뮤니티글 목록 불러오기
	@Override
	public List<CommuDTO> getBoardList(PageDTO pageDTO) {
		// pageSize, pageNum 담아옴
		// currentPage startRow endRow
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow=(currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow-1); // 디비 startRow-1
		pageDTO.setEndRow(endRow);
		
		return commuDAO.getBoardList(pageDTO);
	}
	// 커뮤니티글 불러오기
	@Override
	public CommuDTO getBoard(int c_num) {
		return commuDAO.getBoard(c_num);
	}
	// 커뮤니티글 수정
	@Override
	public void updateBoard(CommuDTO commuDTO) {
		commuDAO.updateBoard(commuDTO);
	}
	// 커뮤니티글 삭제
	@Override
	public void deleteBoard(int c_num) {
		commuDAO.deleteBoard(c_num);
	}
	// 조회수 +1
	@Override
	public void updateReadcount(int c_num) {
		commuDAO.updateReadcount(c_num);
		
	}
	// 전체 커뮤니티글 개수 조회
	@Override
	public Integer getBoardCount() {
		return commuDAO.getBoardCount();
	}
	// 본인 확인
	@Override
	public CommuDTO numCheck(CommuDTO commuDTO) {
		return commuDAO.numCheck(commuDTO);
	}
	
}
