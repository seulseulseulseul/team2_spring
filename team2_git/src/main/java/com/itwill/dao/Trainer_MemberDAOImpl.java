package com.itwill.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwill.domain.ReservationDTO;
import com.itwill.domain.ReviewDTO;
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

	@Override
	public void insertTrainer(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("DAO insertT");
		sqlSession.update(namespace+".insertTrainer", trainer_memberDTO);

	}
	
	@Override
	public void insertReview(ReviewDTO reviewDTO) {
		System.out.println("DAO insertReview");
		sqlSession.insert(namespace+".insertReview",reviewDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}


	@Override
	public List<ReviewDTO> getReviewList(String t_id) {
		return sqlSession.selectList(namespace+".getReviewList",t_id);
	}
	@Override
	public List<Trainer_MemberDTO> trainer_list() {
		System.out.println("MemberDAOImpl trainer_list()");
		return sqlSession.selectList(namespace+".trainer_list");
	}

	@Override
	public void trainer_updateList(Trainer_MemberDTO trainer_memberDTO) {
		sqlSession.update(namespace+".trainer_updateList", trainer_memberDTO);
	}

	@Override
	public void insertReservation(ReservationDTO reservationDTO) {
		System.out.println("MemberDAOImpl insertReservation()");
		sqlSession.insert(namespace+".insertReservation",reservationDTO);
	}

	@Override
	public List<ReservationDTO> trainer_reservation(String t_id) {
		return sqlSession.selectList(namespace+".trainer_getReservation",t_id);
	}

	@Override
	public void trainer_cashUpdate(String t_id) {
		sqlSession.update(namespace+".trainer_cashUpdate", t_id);
	}
	

	
}//Ŭ����