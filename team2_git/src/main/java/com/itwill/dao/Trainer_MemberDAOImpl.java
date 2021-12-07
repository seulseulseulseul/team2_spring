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
	
	private static final String namespace="com.itwill.mapper.trainer_memberMapper";

	// ���ϰ����� insertMember(MemberDTO memberDTO) �޼��� ����
//	String insertsql="insert into member(id,pass,name,date) values(?,?,?,?)";
	@Override
	public void trainer_register(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("Trainer_MemberDAOImpl trainer_register()");
		// ����۾� => JDBC ���α׷� ��ġ  Spring JDBC ��ġ => �ڵ����� ���α׷� ��ġ
		//  ���̺�   ���α׷��� �ڵ����� ��ġ pom.xml ���̺��� ������ �ڵ带 ������ �ڵ����� �ٿ� �޾���
		//  ���̺�(������α׷� ����) ����Ʈ => pom.xml �ڵ带 ������ => ����Ʈ���� �ڵ����� ��ǻ�ͷ� �ٿ�޾���
		// https://mvnrepository.com/
		
		// ���ڿ��� sql����鼭 ����
//		template.update(insertsql, memberDTO.getId(),memberDTO.getPass(),memberDTO.getName(),memberDTO.getDate());
		// insert()  update()  delete()  selectOne()  selectList()
		sqlSession.insert(namespace+".trainer_register", trainer_memberDTO);
		
	}
	
//	String userChecksql="select * from member where id=? and pass=?";
	@Override
	public Trainer_MemberDTO trainer_userCheck(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("MemberDAOImpl trainer_userCheck()");
		// ��񿡼� ������ ������ MemberDTO �����ؼ� ����
//		RowMapper<MemberDTO> mapper=new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class);
//		
//		return template.queryForObject(userChecksql, mapper, memberDTO.getId(),memberDTO.getPass());
		return sqlSession.selectOne(namespace+".trainer_userCheck", trainer_memberDTO);
	}
	
//	String getMembersql="select * from member where id=?";
	@Override
	public Trainer_MemberDTO trainer_getMember(String t_id) {
		// ��񿡼� ������ ������ MemberDTO �����ؼ� ����
//		RowMapper<MemberDTO> mapper=new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class);
//		return template.queryForObject(getMembersql, mapper, id);
		return sqlSession.selectOne(namespace+".trainer_getMember", t_id);
	}

	@Override
	public void trainer_updateMember(Trainer_MemberDTO trainer_memberDTO) {
		sqlSession.update(namespace+".trainer_updateMember", trainer_memberDTO);
	}

	//���̵� �ߺ�üũ
	@Override
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO) {
		int result = sqlSession.selectOne(namespace+".trainer_IdCheck",trainer_memberDTO);
		return result;
	}
	
	
	
}//Ŭ����
