package com.itwill.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.BoardDAO;
import com.itwill.domain.BoardDTO;
import com.itwill.domain.PageDTO;

@Service
public class BoardServiceImpl implements BoardService{

//	BoardDAO boardDAO=new BoardDAOImpl() 객체생성
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoard(BoardDTO boardDTO) {
		System.out.println("BoardServiceImpl insertBoard()");
		//처리작업  name pass subject content
		// num   max(num)+1 , readcount 0, date 현시스템 날짜
		boardDTO.setReadcount(0);
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		if(boardDAO.getMaxNum()==null) {
			//글이 없는경우 1로 설정
			boardDTO.setNum(1);
		} else {
			// 글이 있으면 max(num)+1
			boardDTO.setNum(boardDAO.getMaxNum()+1);
		}
			
			boardDAO.insertBoard(boardDTO);
			
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		// pageSize, pageNum 담아옴
		// currentPage startRow endRow 
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow=(currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow-1); // 디비 startRow-1
		pageDTO.setEndRow(endRow);
		
	
		
		return boardDAO.getBoardList(pageDTO);
	}

	@Override
	public Integer getBoardCount() {
		return boardDAO.getBoardCount();
	}

}
