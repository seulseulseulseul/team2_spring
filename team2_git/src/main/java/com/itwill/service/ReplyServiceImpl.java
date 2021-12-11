package com.itwill.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.ReplyDAO;
import com.itwill.domain.PageDTO;
import com.itwill.domain.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO replyDAO;
	
	// 커뮤니티글에 댓글 작성
	@Override
	public ReplyDTO insertBoard(ReplyDTO replyDTO) {
		// 작성시간 입력
		replyDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		// 댓글 순서 설정
		if(replyDAO.getMaxOrder(replyDTO)==null) {
			// 글이 없는경우 1로 설정
			replyDTO.setR_order(1);
			
		} else {
			// 글이 있으면 max(r_order)+1
			replyDTO.setR_order(replyDAO.getMaxOrder(replyDTO)+1); // 댓글 순서
			
		}
		// 댓글 번호 설정
		if(replyDAO.getMaxNum()==null) {
			//글이 없는경우 1로 설정
			replyDTO.setR_num(1);
			
		} else {
			// 글이 있으면 max(r_num)+1
			replyDTO.setR_num(replyDAO.getMaxNum()+1);
			
		}
		replyDAO.insertBoard(replyDTO);
		
		return replyDTO;
		
	}
	// 댓글에 댓글 작성
	@Override
	public ReplyDTO insertBoard2(ReplyDTO replyDTO) {
		// 작성시간 입력
		replyDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		// 댓글 번호 설정
		replyDTO.setR_num(replyDAO.getMaxNum()+1);
		
		replyDAO.insertBoard(replyDTO);
		
		return replyDTO;
		
	}
	// 댓글 정보 불러오기
	@Override
	public ReplyDTO getBoard(int r_num) {
		return replyDAO.getBoard(r_num);
		
	}
	// 댓글 순서 재정렬
	@Override
	public void reOrder(int r_order) {
		replyDAO.reOrder(r_order);
		
	}
	// 댓글 목록 불러오기
	@Override
	public List<ReplyDTO> getBoardList(PageDTO pageDTO) {
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
	// 댓글목록의 마지막 페이지 불러오기
	@Override
	public Integer getReplyPage(ReplyDTO replyDTO) {
		// 한화면에 보여지는 댓글개수 = 10개
		int pageSize=10;
		// 댓글 순번
		int turn = replyDAO.getReplyTurn(replyDTO) + 1;
		
		// 작성한 댓글의 페이지
		int currentPage = (turn/pageSize) + (turn%pageSize==0?0:1);
//		// 마지막 페이지 첫 줄
//		int startRow=((currentPage-1)*pageSize)+1;
//		
//		// pageDTO 생성
//		PageDTO pageDTO=new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setCurrentPage(currentPage);
//		
//		// 댓글 목록 불러오기
//		List<ReplyDTO> replyList=replyDAO.getBoardList(pageDTO);
		
		return currentPage;
		
	}
	@Override
	public Integer isNoReply(int r_num) {
		return replyDAO.isNoReply(r_num);
		
	}
}
