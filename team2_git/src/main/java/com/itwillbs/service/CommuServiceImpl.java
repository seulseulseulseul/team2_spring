package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CommuDAO;
import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.CommuDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class CommuServiceImpl implements CommuService{
	
	@Inject
	private CommuDAO commuDAO;

	@Override
	public void insertBoard(CommuDTO commuDTO) {
		// 전체글 개수 조회
		commuDTO.setReadcount(0);
		commuDTO.setDate(new Timestamp(System.currentTimeMillis()));
		// c_num 설정
		if(commuDAO.getMaxNum()==null) {
			//글이 없는경우 1로 설정
			commuDTO.setC_num(1);
		} else {
			// 글이 있으면 max(c_num)+1
			commuDTO.setC_num(commuDAO.getMaxNum()+1);
		}
		
		commuDAO.insertBoard(commuDTO);
	}

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
	
	@Override
	public CommuDTO getBoard(CommuDTO commuDTO) {
		// 작성자 본인 여부 확인
		if(commuDAO.numCheck(commuDTO)!=null) {
			// 작성자 본인일 경우
			
		}
		return commuDAO.getBoard(commuDTO);
	}

	@Override
	public void updateBoard(CommuDTO commuDTO) {
		// 작성자 본인 여부 확인
		if(commuDAO.numCheck(commuDTO) != null) {
			// 작성자 본인일 경우
			commuDAO.updateBoard(commuDTO);
		} else {
			
		}
	}

	@Override
	public void deleteBoard(CommuDTO commuDTO) {
		// 작성자 본인 여부 확인
		if(commuDAO.numCheck(commuDTO) != null) {
			commuDAO.deleteBoard(commuDTO.getC_num());
		}
	}

	@Override
	public void updateReadcount(int num) {
		commuDAO.updateReadcount(num);
		
	}
	
	@Override
	public Integer getBoardCount() {
		return commuDAO.getBoardCount();
	}
	
	@Override
	public CommuDTO numCheck(CommuDTO commuDTO) {
		return commuDAO.numCheck(commuDTO);
	}
	
}
