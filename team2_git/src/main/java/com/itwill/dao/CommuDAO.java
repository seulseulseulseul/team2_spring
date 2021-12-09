package com.itwill.dao;

import java.util.HashMap;
import java.util.List;

import com.itwill.domain.CommuDTO;
import com.itwill.domain.PageDTO;


public interface CommuDAO {
	
	public Integer getMaxNum();
	
	public void insertBoard(CommuDTO commuDTO);
	
	public List<CommuDTO> getBoardList(PageDTO pageDTO);
	
	public List<CommuDTO> getSearchList(PageDTO pageDTO);
	
	public CommuDTO getBoard(int c_num);

	public CommuDTO numCheck(CommuDTO commuDTO);
	
	public void updateBoard(CommuDTO commuDTO);
	
	public void deleteBoard(int c_num);
	
	public void updateReadcount(int c_num);
	
	public Integer getBoardCount();
	
	public Integer getSearchCount(String search);
}
