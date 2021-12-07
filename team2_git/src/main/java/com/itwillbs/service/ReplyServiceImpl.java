package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReplyDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO replyDAO;
	
	// 커뮤니티글에 댓글 작성
	@Override
	public void insertBoard(ReplyDTO replyDTO) {
		// 작성시간 입력
		replyDTO.setDate(new Timestamp(System.currentTimeMillis()));
		// 댓글 번호 설정
		if(replyDAO.getMaxNum()==null) {
			//글이 없는경우 1로 설정
			replyDTO.setR_num(1);
		} else {
			// 글이 있으면 max(r_num)+1
			replyDTO.setR_num(replyDAO.getMaxNum()+1);
		}
		// 댓글 순서 설정
		replyDTO.setOrder(replyDAO.getMaxOrder()+1); // 댓글 순서
		replyDTO.setParent(0); // 부모댓글 없음
		replyDTO.setDepth(0); // 깊이 없음
		
		replyDAO.insertBoard(replyDTO);
	}
	// 댓글에 댓글 작성
	@Override
	public void insertBoard2(ReplyDTO replyDTO2) {
		// 작성시간 입력
		replyDTO2.setDate(new Timestamp(System.currentTimeMillis()));
		// 댓글 번호 설정
		replyDTO2.setR_num(replyDAO.getMaxNum()+1);
		
		replyDAO.insertBoard(replyDTO2);
	}
	// 댓글 정보 불러오기
	@Override
	public ReplyDTO getBoard(int r_num) {
		return replyDAO.getBoard(r_num);
	}
	// 댓글 순서 재정렬
	@Override
	public void reOrder(int order) {
		replyDAO.reOrder(order);		
	}
	// 댓글 목록 불러오기
	@Override
	public List<ReplyDTO> getBoardList(int c_num, PageDTO pageDTO) {
		// pageSize, pageNum 담아옴
		// currentPage startRow endRow
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow=(currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow-1); // 디비 startRow-1
		pageDTO.setEndRow(endRow);
		
		return replyDAO.getBoardList(pageDTO);
	}
	// 댓글 수정
	@Override
	public void updateBoard(ReplyDTO replyDTO) {
		replyDAO.updateBoard(replyDTO);
	}
	// 댓글 삭제
	@Override
	public void deleteBoard(int r_num) {
		replyDAO.deleteBoard(r_num);
	}
	// 커뮤니티글 삭제 시 모든 댓글 삭제
	@Override
	public void deleteBoardAll(int c_num) {
		replyDAO.deleteBoardAll(c_num);
	}
	// 커뮤니티글의 댓글 개수
	@Override
	public Integer getBoardCount(int c_num) {
		return replyDAO.getBoardCount(c_num);
	}
	// 본인 확인
	@Override
	public ReplyDTO numCheck(ReplyDTO replyDTO) {
		return replyDAO.numCheck(replyDTO);
	}
	// 댓글목록의 마지막 페이지
	@Override
	public Integer getLastPage(int c_num, int pageSize) {
		// 커뮤니티글의 댓글 개수
		int boardCount = replyDAO.getBoardCount(c_num);
		
		return ((boardCount-1)/pageSize) + (boardCount%pageSize==0?0:1);
	}

}
