package com.human.service;

import java.util.HashMap;

import javax.inject.Inject;

import com.human.dao.IF_memberDAO;
import com.human.vo.memberVO;
import org.springframework.stereotype.Service;

@Service
public class member_service_impl implements IF_member_service{
	
	@Inject
	IF_memberDAO mdao;

	@Override
	public void insert(memberVO mvo) throws Exception {
		mdao.insert(mvo);		
	}

	@Override
	public memberVO login(String username, String pwd) throws Exception {
		HashMap<String, String> userinfo = new HashMap<String, String>();
		userinfo.put("username", username);
		userinfo.put("pwd", pwd);
		/* 리스트는 순서가 있다. 인덱스가 있다.
		 * 맵은  순서가 없다. 인덱스가 없다. 키와 값으로 구성되어있다.. 검색은 맵이 더 빠르다.
		 */		
		return mdao.selectOne(userinfo);
	}

}
