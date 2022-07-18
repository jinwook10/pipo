package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.vo.BbsVO;
import com.human.vo.PageVO;

@Repository
public class BbsDAO_impl implements IF_BbsDAO {
private static String mapperQuery  ="com.human.dao.IF_BbsDAO";

	@Inject 
	private SqlSession sqlSession;
	
	@Override
	public List<BbsVO> selectAll(PageVO pagevo) throws Exception {
		return sqlSession.selectList(mapperQuery+".selectAll",pagevo);
	}
	
	@Override
	public void insert(BbsVO bbsvo) throws Exception {
		sqlSession.insert(mapperQuery+".insert", bbsvo);
	}

	@Override
	public void delete(String no) throws Exception {
		sqlSession.delete(mapperQuery+".delete", no);
	}

	@Override
	public BbsVO view(String no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".view", no);
	}

	@Override
	public void updatecnt(String no) throws Exception {
		sqlSession.update(mapperQuery+".updatecnt", no);
	}

	@Override
	public void update(BbsVO bbsvo) throws Exception {
		sqlSession.update(mapperQuery+".update", bbsvo);
	}

	@Override
	public int seletCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectCnt");
	}

}
