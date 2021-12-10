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

	@Override
	public void trainer_register(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("Trainer_MemberDAOImpl trainer_register()");
		
		sqlSession.insert(namespace+".trainer_register", trainer_memberDTO);
		
	}
	
	@Override
	public Trainer_MemberDTO trainer_userCheck(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("MemberDAOImpl trainer_userCheck()");
		return sqlSession.selectOne(namespace+".trainer_userCheck", trainer_memberDTO);
	}
	
	@Override
	public Trainer_MemberDTO trainer_getMember(String t_id) {
		return sqlSession.selectOne(namespace+".trainer_getMember", t_id);
	}

	@Override
	public void trainer_updateMember(Trainer_MemberDTO trainer_memberDTO) {
		sqlSession.update(namespace+".trainer_updateMember", trainer_memberDTO);
	}

	@Override
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO) {
		int result = sqlSession.selectOne(namespace+".trainer_IdCheck",trainer_memberDTO);
		return result;
	}

	@Override
	public void insertTrainer(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("DAO insertT");
		sqlSession.update(namespace+".insertTrainer", trainer_memberDTO);

	}
	@Override
	public List<Trainer_MemberDTO> trainer_getinfo(String t_id) {
	    System.out.println("sqlSession >>>>" + sqlSession);
	    return sqlSession.selectList(namespace +".trainer_getinfo",t_id);

	}

	
	
	
	
}
