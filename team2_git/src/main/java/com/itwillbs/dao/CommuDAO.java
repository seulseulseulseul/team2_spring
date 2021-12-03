package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;

import com.itwillbs.domain.CommuDTO;
import com.itwillbs.domain.PageDTO;


public interface CommuDAO {
	
	public Integer getMaxNum();
	
	public void insertBoard(CommuDTO commuDTO);
	
	public List<CommuDTO> getBoardList(PageDTO pageDTO);
	
	public CommuDTO getBoard(CommuDTO commuDTO);

	public CommuDTO numCheck(CommuDTO commuDTO);
	
	public void updateBoard(CommuDTO commuDTO);
	
	public void deleteBoard(int num);
	
	public void updateReadcount(int num);
	
	public Integer getBoardCount();
}
