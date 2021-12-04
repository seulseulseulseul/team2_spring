package com.itwill.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Trainer_MemberDTO;

@Repository
public class Trainer_MemberDAOImpl implements Trainer_MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	
//	// sql구문을 만들어서 실행 => SimpleJdbcTemplate 
//	private SimpleJdbcTemplate template;
//	
//	//set메서드
//	@Inject
//	public void setDataSource(DataSource dataSource) {
//		template=new SimpleJdbcTemplate(dataSource);
//	}
	
	private static final String namespace="com.itwill.mapper.trainer_memberMapper";

	// 리턴값없음 insertMember(MemberDTO memberDTO) 메서드 정의
//	String insertsql="insert into member(id,pass,name,date) values(?,?,?,?)";
	@Override
	public void trainer_register(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("Trainer_MemberDAOImpl trainer_register()");
		// 디비작업 => JDBC 프로그램 설치  Spring JDBC 설치 => 자동으로 프로그램 설치
		//  메이븐   프로그램을 자동으로 설치 pom.xml 메이븐이 제공한 코드를 적으면 자동으로 다운 받아짐
		//  메이븐(모든프로그램 제공) 사이트 => pom.xml 코드를 적으면 => 사이트에서 자동으로 컴퓨터로 다운받아짐
		// https://mvnrepository.com/
		
		// 문자열을 sql만들면서 실행
//		template.update(insertsql, memberDTO.getId(),memberDTO.getPass(),memberDTO.getName(),memberDTO.getDate());
		// insert()  update()  delete()  selectOne()  selectList()
		sqlSession.insert(namespace+".trainer_register", trainer_memberDTO);
		
	}
	
//	String userChecksql="select * from member where id=? and pass=?";
	@Override
	public Trainer_MemberDTO trainer_userCheck(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("MemberDAOImpl trainer_userCheck()");
		// 디비에서 가져온 내용을 MemberDTO 매핑해서 저장
//		RowMapper<MemberDTO> mapper=new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class);
//		
//		return template.queryForObject(userChecksql, mapper, memberDTO.getId(),memberDTO.getPass());
		return sqlSession.selectOne(namespace+".trainer_userCheck", trainer_memberDTO);
	}
	
//	String getMembersql="select * from member where id=?";
	@Override
	public Trainer_MemberDTO trainer_getMember(String t_id) {
		// 디비에서 가져온 내용을 MemberDTO 매핑해서 저장
//		RowMapper<MemberDTO> mapper=new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class);
//		return template.queryForObject(getMembersql, mapper, id);
		return sqlSession.selectOne(namespace+".trainer_getMember", t_id);
	}

	@Override
	public void trainer_updateMember(Trainer_MemberDTO trainer_memberDTO) {
		sqlSession.update(namespace+".trainer_updateMember", trainer_memberDTO);
	}

	//아이디 중복체크
	@Override
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO) {
		int result = sqlSession.selectOne(namespace+".trainer_IdCheck",trainer_memberDTO);
		return result;
	}
	
	
	
}//클래스
