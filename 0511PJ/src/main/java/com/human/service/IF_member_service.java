package com.human.service;

import com.human.vo.memberVO;

public interface IF_member_service {
	public void insert(memberVO mvo) throws Exception;

	public memberVO login(String username, String pwd) throws Exception;
}
