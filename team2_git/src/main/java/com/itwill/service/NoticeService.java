package com.itwill.service;

import java.util.List;

import com.itwill.domain.NoticeDTO;
import com.itwill.domain.PageDTO;

public interface NoticeService {

	public void insertNotice(NoticeDTO noticeDTO);
	
	public NoticeDTO getNotice(int b_num);
	
	public List<NoticeDTO> getNoticeList(PageDTO pageDTO);
	
	public Integer getNoticeCount();
	
	public void deleteNotice(int b_num);
	
	public void updateNotice(NoticeDTO noticeDTO);
}
