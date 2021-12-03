package com.itwill.service;


import java.sql.Timestamp;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.TrainerDAO;
import com.itwill.domain.TrainerDTO;




@Service
public class TrainerServiceImpl implements TrainerService {
	//멤버변수
//	TrainerDAO trainerDAO = new TrainerDAOImpl();
	@Inject
	private TrainerDAO trainerDAO;
	//set메서드
//	@Inject
//	public void setTrainerDAO(TrainerDAO trainerDAO) {
//		this.trainerDAO = trainerDAO;
//	}
	
	//리턴값 없음 insertTrainer(TrainerDTO trainerDTO) 메서드 정의
	@Override
	public void insertTrainer(TrainerDTO trainerDTO) {
		System.out.println("TrainerServiceImpl insertTrainer()");
		//처리단계에서 날짜생성해서 저장
//		trainerDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		//1. 객체생성
//		TrainerDAOImpl trainerDAO = new TrainerDAOImpl();
//		trainerDAO.insertTrainer(trainerDTO);
		
		//2. 객체생성 수정최소화 방법 => 부모인터페이스 틀 => 부모 = 자식 객체생성
		// 부모인터페이스 틀 패키지 com.itwillbs.service 인터페이스 파일 TrainerDAO 추상메서드 정의
		//					TrainerDAOImpl 부모인터페이스 상속 TrainerDAO 메서드 오버라이딩
//		// 부모인터페이스 TrainerDAO = 자식클래스 객체생성 TrainerDAOImpl
//		TrainerDAO trainerDAO = new TrainerDAOImpl();
//		// 부모인터페이스 변수.insertTrainer(trainerDTO) 메서드 호출
//		trainerDAO.insertTrainer(trainerDTO);
		
		//3. 객체생성
		//스프링 객체생성 방법 => 의존관계 주입(DI Dependency Injection)
		//멤버변수 정의 <= 외부에 있는 xml에서 TrainerServiceImpl 객체생성한 것을 전달해오면 받음
		//받아오는 방법 1. 생성자  2. set 메서드
		trainerDAO.insertTrainer(trainerDTO);
	}

	@Override
	public TrainerDTO trainerCheck(TrainerDTO trainerDTO) {
		System.out.println("TrainerServiceImpl userCheck()");
		return trainerDAO.trainerCheck(trainerDTO);
	}

	@Override
	public TrainerDTO getTrainer(String t_id) {
		System.out.println("TrainerServiceImpl getTrainer()");
		return trainerDAO.getTrainer(t_id);
	}

	@Override
	public TrainerDTO updateTrainer(TrainerDTO trainerDTO) {
		System.out.println("TrainerServiceImpl updateTrainer()");
		return trainerDAO.updateTrainer(trainerDTO);
	}

//	@Override
//	public void deleteTrainer(TrainerDTO trainerDTO) {
//		System.out.println("TrainerServiceImpl deleteTrainer()");
//		trainerDAO.deleteTrainer(trainerDTO);
//	}

	@Override
	public List<TrainerDTO> getTrainerList() {
		System.out.println("TrainerServiceImpl getTrainerList()");
		return trainerDAO.getTrainerList();
	}


}
