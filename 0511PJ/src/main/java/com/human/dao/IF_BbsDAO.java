package com.human.dao;

import java.util.List;
import com.human.vo.BbsVO;
import com.human.vo.PageVO;

public interface IF_BbsDAO {
	
	public List<BbsVO> selectAll(PageVO pagevo) throws Exception;
	
	public void insert(BbsVO bbsvo) throws Exception;
	
	public void delete(String no) throws Exception;
	
	// select * from bbs04 where no=?;
	public BbsVO view(String no) throws Exception;
	
	//4번 기능을 수행할 때는 조회수를 1씩 증가한다.    update bbs04 set cnt=cnt+1 where no=6;
	public void updatecnt(String no) throws Exception;
	
	// update bbs04 set pass=?, title=?, memo=?, scheck=? where no=?
	public void update(BbsVO bbsvo) throws Exception;
	
	// select count(*) from bbs04;
	public int seletCnt() throws Exception;
}
