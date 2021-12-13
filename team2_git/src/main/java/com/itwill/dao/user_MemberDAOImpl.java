package com.itwill.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.itwill.domain.ReservationDTO;
import com.itwill.domain.user_MemberDTO;

@Repository
public class user_MemberDAOImpl implements user_MemberDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwill.mapper.user_memberMapper";
	
//	String insertsql = "insert into member(id,pass,name,date) values(?,?,?,?)";
	@Override
	public void user_register(user_MemberDTO user_memberDTO) {
		System.out.println("user_MemberDAOImpl user_register()");
		sqlSession.insert(namespace+".user_register", user_memberDTO);
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

	@Override
	public void user_updateMember(user_MemberDTO user_memberDTO) {
		sqlSession.update(namespace+".user_updateMember", user_memberDTO);
	}

	@Override
	public int user_IdCheck(user_MemberDTO user_memberDTO) {
		int result = sqlSession.selectOne(namespace+".user_IdCheck",user_memberDTO);
		return result;
	}
	
	
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
	
	@Override
	public List<user_MemberDTO> user_list() {
		System.out.println("MemberDAOImpl user_list()");
		return sqlSession.selectList(namespace+".user_list");
	}
	@Override
	public void user_updateList(user_MemberDTO user_memberDTO) {
		sqlSession.update(namespace+".user_updateList", user_memberDTO);
	}
	
	@Override
	public List<ReservationDTO> user_reservation(String u_id) {
		return sqlSession.selectList(namespace+".user_getReservation",u_id);
	}

	@Override
	public void user_cashUpdate(String u_id) {
		sqlSession.update(namespace+".user_cashUpdate", u_id);

		
	}

	@Override
	public user_MemberDTO naverUserCheck(String u_id) {
		System.out.println("user_MemberDAOImpl user_userCheck()");
		return sqlSession.selectOne(namespace+".naverUserCheck", u_id);
	}
}//클래스
