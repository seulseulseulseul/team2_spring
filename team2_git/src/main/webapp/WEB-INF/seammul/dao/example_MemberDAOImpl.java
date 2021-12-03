package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
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
	
	private static final String namespace="com.itwillbs.mapper.MemberMapper";

	// 리턴값없음 insertMember(MemberDTO memberDTO) 메서드 정의
//	String insertsql="insert into member(id,pass,name,date) values(?,?,?,?)";
	@Override
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl insertMember()");
		// 디비작업 => JDBC 프로그램 설치  Spring JDBC 설치 => 자동으로 프로그램 설치
		//  메이븐   프로그램을 자동으로 설치 pom.xml 메이븐이 제공한 코드를 적으면 자동으로 다운 받아짐
		//  메이븐(모든프로그램 제공) 사이트 => pom.xml 코드를 적으면 => 사이트에서 자동으로 컴퓨터로 다운받아짐
		// https://mvnrepository.com/
		
		// 문자열을 sql만들면서 실행
//		template.update(insertsql, memberDTO.getId(),memberDTO.getPass(),memberDTO.getName(),memberDTO.getDate());
		// insert()  update()  delete()  selectOne()  selectList()
		sqlSession.insert(namespace+".insertMember", memberDTO);
		
	}
	
//	String userChecksql="select * from member where id=? and pass=?";
	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl userCheck()");
		// 디비에서 가져온 내용을 MemberDTO 매핑해서 저장
//		RowMapper<MemberDTO> mapper=new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class);
//		
//		return template.queryForObject(userChecksql, mapper, memberDTO.getId(),memberDTO.getPass());
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}
	
//	String getMembersql="select * from member where id=?";
	@Override
	public MemberDTO getMember(String id) {
		// 디비에서 가져온 내용을 MemberDTO 매핑해서 저장
//		RowMapper<MemberDTO> mapper=new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class);
//		return template.queryForObject(getMembersql, mapper, id);
		return sqlSession.selectOne(namespace+".getMember", id);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		sqlSession.update(namespace+".updateMember", memberDTO);
	}

	@Override
	public void deleteMember(MemberDTO memberDTO) {
		sqlSession.delete(namespace+".deleteMember", memberDTO);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		return sqlSession.selectList(namespace+".getMemberList");
	}
	
}//클래스
