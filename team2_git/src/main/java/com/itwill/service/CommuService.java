package com.itwill.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.domain.CommuDTO;
import com.itwill.domain.PageDTO;

@Service
public interface CommuService {
	
	public void insertBoard(CommuDTO commuDTO);
	
	public List<CommuDTO> getBoardList(PageDTO pageDTO);
	
	public List<CommuDTO> getSearchList(PageDTO pageDTO);
	
	public CommuDTO getBoard(int c_num);
	
	public void updateBoard(CommuDTO commuDTO);
	
	public void deleteBoard(int c_num);
	
	public void updateReadcount(int c_num);
	
	public Integer getBoardCount();
	
	public Integer getSearchCount(String search);
	
	public CommuDTO numCheck(CommuDTO commuDTO);

}
