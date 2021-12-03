package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CommuDTO;
import com.itwillbs.domain.PageDTO;

@Service
public interface CommuService {
	
	public void insertBoard(CommuDTO commuDTO);
	
	public List<CommuDTO> getBoardList(PageDTO pageDTO);
	
	public CommuDTO getBoard(CommuDTO commuDTO);
	
	public void updateBoard(CommuDTO commuDTO);
	
	public void deleteBoard(CommuDTO commuDTO);
	
	public void updateReadcount(int c_num);
	
	public Integer getBoardCount();
	
	public CommuDTO numCheck(CommuDTO commuDTO);

}
