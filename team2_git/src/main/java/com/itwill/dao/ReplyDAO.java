package com.itwill.dao;

import java.util.HashMap;
import java.util.List;

import com.itwill.domain.PageDTO;
import com.itwill.domain.ReplyDTO;


public interface ReplyDAO {
	
	public Integer getMaxNum();
	
	public Integer getMaxOrder(ReplyDTO replyDTO);
	
	public void insertBoard(ReplyDTO replyDTO);
	
	public ReplyDTO getBoard(int r_num);
	
	public List<ReplyDTO> getBoardList(PageDTO pageDTO);

	public ReplyDTO numCheck(ReplyDTO replyDTO);
	
	public void updateBoard(ReplyDTO replyDTO);
	
	public void deleteBoard(int r_num);
	
	public void deleteBoardAll(int c_num);
	
	public Integer getBoardCount(int c_num);
	
	public void reOrder(int r_order);
	
	public Integer isNoReply(int r_num);
}
