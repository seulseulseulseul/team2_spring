package com.itwill.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.domain.PageDTO;
import com.itwill.domain.ReplyDTO;

@Service
public interface ReplyService {
	
	public ReplyDTO insertBoard(ReplyDTO replyDTO);
	
	public ReplyDTO insertBoard2(ReplyDTO replyDTO);
	
	public List<ReplyDTO> getBoardList(PageDTO pageDTO);
	
	public ReplyDTO getBoard(int r_num);
	
	public void reOrder(int r_order);
	
	// public ReplyDTO getBoard(ReplyDTO replyDTO);
	
	public void updateBoard(ReplyDTO replyDTO);
	
	public void deleteBoard(int r_num);
	
	public void deleteBoardAll(int c_num);
	
	public Integer getBoardCount(int c_num);
	
	public ReplyDTO numCheck(ReplyDTO replyDTO);
	
	public Integer getReplyPage(ReplyDTO replyDTO);
	
	public Integer isNoReply(int r_num);

}
