package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

@Service
public interface ReplyService { //test
	
	public void insertBoard(ReplyDTO replyDTO);
	
	public List<ReplyDTO> getBoardList(int c_num, PageDTO pageDTO);
	
	public ReplyDTO getBoard(ReplyDTO replyDTO);
	
	public void updateBoard(ReplyDTO replyDTO);
	
	public void deleteBoard(ReplyDTO replyDTO);
	
	public void deleteBoardAll(ReplyDTO replyDTO);
	
	public Integer getBoardCount(int c_num);
	
	public ReplyDTO numCheck(ReplyDTO replyDTO);

}
