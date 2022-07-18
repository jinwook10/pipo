package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.dao.IF_BbsDAO;
import com.human.vo.BbsVO;
import com.human.vo.PageVO;

@Service
public class Bbs_service_impl implements IF_Bbs_service	{

	@Inject
	IF_BbsDAO bbsdao;
	
	@Override
	public List<BbsVO> selectAll(PageVO pagevo) throws Exception {
		return bbsdao.selectAll(pagevo);
	}
	
	@Override
	public void insert(BbsVO bbsvo) throws Exception {
		if(bbsvo.getScheck() == null) {
			bbsvo.setScheck("2");
		}
		bbsdao.insert(bbsvo);
	}
	
	@Override
	public void deleteOne(String no) throws Exception {
		bbsdao.delete(no);
	}

	@Override
	public BbsVO viewDetail(String no) throws Exception {
		bbsdao.updatecnt(no);
		BbsVO bbsvo = bbsdao.view(no);
		return bbsvo;
	}

	@Override
	public void update(BbsVO bbsvo) throws Exception {
		if(bbsvo.getScheck() == null) {
			bbsvo.setScheck("2");
		}
		bbsdao.update(bbsvo);
	}

	@Override
	public BbsVO mod(String no) throws Exception {
		BbsVO bbsvo = bbsdao.view(no);
		return bbsvo;
	}

	@Override
	public int selectCnt() throws Exception {
		return bbsdao.seletCnt();
	}

}
