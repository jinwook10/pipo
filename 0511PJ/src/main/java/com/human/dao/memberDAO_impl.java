package com.human.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.vo.memberVO;
@Repository
public class memberDAO_impl implements IF_memberDAO{
private static String mapperQuery  ="com.human.dao.IF_memberDAO";
	
	@Inject  // 컨테이너에 있는 객체를 주입받는 어노테이션
	private SqlSession sqlSession;

	@Override
	public void insert(memberVO membervo) throws Exception {
		sqlSession.insert(mapperQuery+".insert", membervo);
		
	}

	@Override
	public memberVO selectOne(HashMap userinfo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectOne", userinfo);
	}

}
