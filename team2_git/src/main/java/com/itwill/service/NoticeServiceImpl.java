package com.itwill.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.NoticeDAO;
import com.itwill.domain.NoticeDTO;
import com.itwill.domain.PageDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	private NoticeDAO noticeDAO;


	@Override
	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("NoticeServiceImpl insertCenter()");
		//처리작업 
		//b_num max(b_num)+1,  date (디폴트)
		if(noticeDAO.getMaxNum()==null) {
			//글이 없는 경우 1로 설정
			noticeDTO.setB_num(1);
		}else {
			//글이 있으면 max(b_num)+1
			noticeDTO.setB_num(noticeDAO.getMaxNum()+1);
		}
		noticeDAO.insertNotice(noticeDTO);
	}		
	

	@Override
	public NoticeDTO getNotice(int b_num) {
		return noticeDAO.getNotice(b_num);

	}

	@Override
	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		return noticeDAO.getNoticeList(pageDTO);
	}

	@Override
	public Integer getNoticeCount() {
		// TODO Auto-generated method stub
		return noticeDAO.getNoticeCount();
	}

	@Override
	public void deleteNotice(int b_num) {
		noticeDAO.deleteNotice(b_num);
		
	}

	@Override
	public void updateNotice(NoticeDTO noticeDTO) {
		noticeDAO.updateNotice(noticeDTO);
		
	}

	
}
