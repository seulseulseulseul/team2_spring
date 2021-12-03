package com.itwill.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.itwill.domain.user_MemberDTO;

@Repository
public class user_MemberDAOImpl implements user_MemberDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwill.mapper.user_MemberMapper";
	
//	String insertsql = "insert into member(id,pass,name,date) values(?,?,?,?)";
	@Override
	public void user_insertMember(user_MemberDTO user_memberDTO) {
		System.out.println("user_MemberDAOImpl user_insertMember()");
		sqlSession.insert(namespace+".user_insertMember", user_memberDTO);
	}
	
//	String userChecksql = "select * from member where id=? and pass=?";
	@Override
	public user_MemberDTO user_userCheck(user_MemberDTO user_memberDTO) {
		System.out.println("user_MemberDAOImpl user_userCheck()");
		return sqlSession.selectOne(namespace+".user_userCheck", user_memberDTO);
	}
	
//	String getMembersql = "select * from member where id=?";
	@Override
	public user_MemberDTO user_getMember(String u_id) {
		return sqlSession.selectOne(namespace+".user_getMember",u_id);
	}
//	@Override
//	public MemberDTO updateMember(MemberDTO memberDTO) {
//		System.out.println("MemberDAOImpl updateMember()");
//		return sqlSession.selectOne(namespace+".updateMember",memberDTO);
//	}
//	@Override
//	public void deleteMember(MemberDTO memberDTO) {
//		System.out.println("MemberDAOImpl deleteMember()");
//		sqlSession.selectOne(namespace+".deleteMember",memberDTO);
//	}
//	@Override
//	public List<MemberDTO> getMemberList() {
//		System.out.println("MemberDAOImpl getMemberList()");
//		return sqlSession.selectList(namespace+".getMemberList");
//	}

}//클래스
