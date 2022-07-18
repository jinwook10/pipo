package com.human.service;

import java.util.List;

import com.human.vo.BbsVO;
import com.human.vo.PageVO;

public interface IF_Bbs_service {
	public List<BbsVO> selectAll(PageVO pagevo) throws Exception;
	public void insert(BbsVO bbsvo) throws Exception;	
	public void deleteOne(String no) throws Exception;
	public BbsVO viewDetail(String no) throws Exception;
	public BbsVO mod(String no) throws Exception;
	public void update(BbsVO bbsvo) throws Exception;
	public int selectCnt() throws Exception;
}
