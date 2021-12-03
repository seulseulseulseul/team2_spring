package com.itwill.dao;

import java.util.List;

import com.itwill.domain.CenterDTO;
import com.itwill.domain.PageDTO;

public interface CenterDAO {
	public void insertCenter(CenterDTO centerDTO);
	
	public Integer getMaxNum();
	
	public List<CenterDTO> getCenterList(PageDTO pageDTO);
	
	public Integer getCenterCount();
	
	public Integer isReply(int b_num);
	
	public CenterDTO getCenter(int b_num);
	
	public void insertReply(CenterDTO centerDTO);
	
	public Integer getMaxReply(int b_num);
	
	public List<CenterDTO> getReplyList(int b_num);
}
