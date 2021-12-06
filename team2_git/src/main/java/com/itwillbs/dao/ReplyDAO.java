package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;

import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.PageDTO;


public interface ReplyDAO {
	
	public Integer getMaxNum();
	
	public void insertBoard(ReplyDTO replyDTO);
	
	public List<ReplyDTO> getBoardList(PageDTO pageDTO);

	public ReplyDTO numCheck(ReplyDTO replyDTO);
	
	public void updateBoard(ReplyDTO replyDTO);
	
	public void deleteBoard(int r_num);
	
	public void deleteBoardAll(int c_num);
	
	public Integer getBoardCount(int c_num);
	
	public void orderBoard(ReplyDTO replyDTO);
}
