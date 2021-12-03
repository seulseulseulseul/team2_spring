package com.itwill.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.CenterDAO;
import com.itwill.domain.CenterDTO;
import com.itwill.domain.PageDTO;


@Service
public class CenterServiceImpl implements CenterService{
	@Inject
	private CenterDAO centerDAO ;
	
	@Override
	public void insertCenter(CenterDTO centerDTO) {
		System.out.println("CenterServiceImpl insertCenter()");
		//처리작업 
		//b_num max(b_num)+1,  date (디폴트)
		if(centerDAO.getMaxNum()==null) {
			//글이 없는 경우 1로 설정
			centerDTO.setB_num(1);
		}else {
			//글이 있으면 max(b_num)+1
			centerDTO.setB_num(centerDAO.getMaxNum()+1);
		}
		centerDAO.insertCenter(centerDTO);
	}

	@Override
	public List<CenterDTO> getCenterList(PageDTO pageDTO) {
		//pageSize, pageNum 담아옴
		//currentPage startRow endRow
		int currentPage = Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
				
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow-1); //디비 startRow-1
		pageDTO.setEndRow(endRow);
				
		return centerDAO.getCenterList(pageDTO);
	}

	@Override
	public Integer getCenterCount() {
	
		return centerDAO.getCenterCount();
	}

	@Override
	public Integer isReply(int b_num) {
		return centerDAO.isReply(b_num);
	}
	
	@Override
	public CenterDTO getCenter(int b_num) {
		return centerDAO.getCenter(b_num);
	}

	@Override
	public void insertReply(CenterDTO centerDTO) {
		int b_num = centerDTO.getB_num();
		centerDTO.setB_reply(centerDAO.getMaxReply(b_num)+1);
		centerDAO.insertReply(centerDTO);
	}

	@Override
	public List<CenterDTO> getReplyList(int b_num) {
		return centerDAO.getReplyList(b_num);
	}

}
