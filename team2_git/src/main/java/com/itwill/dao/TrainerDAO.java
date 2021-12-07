package com.itwill.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import javax.annotation.Resources;
import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itwill.domain.ReviewDTO;

import java.io.IOException;

import java.io.Reader;
import java.sql.Connection;

import org.apache.ibatis.io.Resources;

import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;

import org.apache.ibatis.session.SqlSessionFactoryBuilder;



@Repository
public class TrainerDAO implements TrainerDAOImpl{

	
	//@Autowired
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwill.mapper.TraninrMapper";
	
 public List getTrainer(String t_id) {

	 
	 System.out.println("sqlSession >>>>" + sqlSession);
	 
//	 Map map = sqlSession.selectMap("com.itwill.mapper.TraninrMapper.getTrainer",tid);
	 
//	 System.out.println("map >>>" + map);
	 
	 return sqlSession.selectList(namespace+".getTrainer",t_id);
	 
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
 
// // DB 인설트
// public static int insertDB(HashMap<String, Object> map) {
//
//	 // TODO Auto-generated method stub
//
//	  System.out.println("map >>>>>>>>>" + map);
//	 
//	  SqlSession session = SqlMapClient.getSqlSession();
//	  
//      int result = session.insert("test.InsertReceiveData",map);
//      session.insert("test.InsertReceiveDataLog",map);
//      
//      return result;
//
//	 }
// 
// public static int updateWorkcenter(HashMap<String, Object> map) {
//
//	 // TODO Auto-generated method stub
//
//	  SqlSession session = SqlMapClient.getSqlSession();
//	  
//      int result = session.insert("test.updateReceiveData",map);
//      return result;
//
//	 }
// 
//
// public static void main(String args[]){
//	 List list = getIP();
//	 
//	 for(int i = 0; i < list.size(); i++){
//		 HashMap map = (HashMap)list.get(i);
//		 
//		 System.out.println(map.get("WORKCENTERNAME"));
//	 }
//	 
// }
// 
// 
// // 각 ip에 지정되어있는 채널 전체를 가져오는 쿼리 -> 테이블 추가가 필요
// public static List getChannel(HashMap params) {
//
//	 // TODO Auto-generated method stub
//
//		 
//		  SqlSession session = SqlMapClient.getSqlSession();
//		  
//	      List list = session.selectList("test.selectGetChannel",params);
//	      
//	      return list;
//	 
//
//	 }
//
//
// public static List getIP2(HashMap params) {
//
//	 // TODO Auto-generated method stub
//
//		 
//		  SqlSession session = SqlMapClient.getSqlSession();
//		  
//	      List list = session.selectList("test.selectGetIp2",params);
//	      
//	      return list;
//	 
//
//	 }
 
}