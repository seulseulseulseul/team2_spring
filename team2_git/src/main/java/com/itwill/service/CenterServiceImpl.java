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
		// TODO Auto-generated method stub
		return centerDAO.getCenterList(pageDTO);
	}

	@Override
	public Integer getCenterCount() {
		// TODO Auto-generated method stub
		return centerDAO.getCenterCount();
	}

}
