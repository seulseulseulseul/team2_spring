package com.itwill.dao;



import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.itwill.domain.TrainerDTO;


@Repository
public class TrainerDAOImpl implements TrainerDAO{
	@Inject
	private SqlSession sqlSession;
	
	//디비연결 객체생성 받아오기
//	private DataSource dataSource;
	
	//sql구문 만들어서 시행 => SimpleJdbcTemplate
//	private SimpleJdbcTemplate template;
	
	//set메서드
//	@Inject
//	public void setDataSource(DataSource dataSource) {
//		template= new SimpleJdbcTemplate(dataSource);
//	}
	
	private static final String namespace="com.itwillbs.mapper.TrainerMapper";
	
//	String insertsql = "insert into member(id,pass,name,date) values(?,?,?,?)";
	@Override
	public void insertTrainer(TrainerDTO trainerDTO) {
		System.out.println("TrainerDAOImpl insertTrainer()");
		//디비작업 => JDBC 프로그램 설치 Spring JDBC 설치 => 자동으로 프로그램 설치
		//메이븐 프로그램을 자동으로 설치 pom.xml 메이븐이 제공한 코드를 적으면 자동으로 다운받아짐
		//메이븐(모든프로그램 제공) 사이트 => pom.xml 코드를 적으면 => 사이트에서 자동으로 컴퓨터로 다운받아짐
		// https://mvnrepository.com/
		
		//문자열을 sql만들면서 실행
//		template.update(insertsql, trainerDTO.getId(),trainerDTO.getPass(),trainerDTO.getName(),trainerDTO.getDate());
		//insert() update() delete() selectOne() selectList()
		sqlSession.insert(namespace+".insertTrainer", trainerDTO);
	}
//	String userChecksql = "select * from member where id=? and pass=?";
	@Override
	public TrainerDTO trainerCheck(TrainerDTO trainerDTO) {
		System.out.println("TrainerDAOImpl userCheck()");
		//디비에서 가져온 내용을 TrainerDTO 매핑해서 저장
//		RowMapper<TrainerDTO> mapper = new BeanPropertyRowMapper<TrainerDTO>(TrainerDTO.class);
//		return template.queryForObject(userChecksql, mapper , trainerDTO.getId(),trainerDTO.getPass());
		return sqlSession.selectOne(namespace+".trainerCheck", trainerDTO);
	}
//	String getTrainersql = "select * from member where id=?";
	@Override
	public TrainerDTO getTrainer(String t_id) {
		// 디비에서 가져온 내용을 TrainerDTO 매핑해서 저장
//		RowMapper<TrainerDTO> mapper = new BeanPropertyRowMapper<TrainerDTO>(TrainerDTO.class);
//		return template.queryForObject(getTrainersql, mapper , id);
		return sqlSession.selectOne(namespace+".getTrainer",t_id);
	}
	@Override
	public TrainerDTO updateTrainer(TrainerDTO trainerDTO) {
		System.out.println("TrainerDAOImpl updateTrainer()");
		return sqlSession.selectOne(namespace+".updateTrainer",trainerDTO);
	}
//	@Override
//	public void deleteTrainer(TrainerDTO trainerDTO) {
//		System.out.println("TrainerDAOImpl deleteTrainer()");
//		sqlSession.selectOne(namespace+".deleteTrainer",trainerDTO);
//	}
	@Override
	public List<TrainerDTO> getTrainerList() {
		System.out.println("TrainerDAOImpl getTrainerList()");
		return sqlSession.selectList(namespace+".getTrainerList");
	}

}//클래스
