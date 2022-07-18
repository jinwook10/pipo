package com.human.dao;

import java.util.HashMap;

import com.human.vo.memberVO;

public interface IF_memberDAO {
	public void insert(memberVO membervo) throws Exception;
	// select * from member04 where 
	public memberVO selectOne(HashMap userinfo) throws Exception;
}
