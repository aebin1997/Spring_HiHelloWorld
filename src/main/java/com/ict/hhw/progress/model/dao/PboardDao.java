package com.ict.hhw.progress.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.progress.model.vo.P_board;
import com.ict.hhw.progress.model.vo.PboardPage;

@Repository("pboardDao")
public class PboardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("pboardMapper.getListCount");
	}
	
	public ArrayList<P_board> selectList(int pro_id) {
		List<P_board> list = sqlSession.selectList("pboardMapper.selectList", pro_id);
		return (ArrayList<P_board>)list;
	}
	
	public P_board selectPboard(int pid) {
		return sqlSession.selectOne("pboardMapper.selectPboard", pid);
	}

	public int addReadCount(int pid) {
		return sqlSession.update("pboardMapper.updatePCount", pid);
	}

//	public int insertBoard(P_board pboard) {
//		return sqlSession.insert("pboardMapper.insertPboard", pboard);
//	}

	public int updateBoard(P_board pboard) {
		return sqlSession.update("pboardMapper.updatePboard", pboard);
	}

	public int deletePboard(int pid) {
		return sqlSession.update("pboardMapper.changeBstatusN", pid);
	}

	public ArrayList<P_board> selectSearchTitle(SearchAndPage searches) {
		List<P_board> list = sqlSession.selectList("pboardMapper.searchTitle", searches);
		return (ArrayList<P_board>)list;
	}

	public ArrayList<P_board> selectSearchWriter(SearchAndPage searches) {
		List<P_board> list = sqlSession.selectList("pboardMapper.searchWriter", searches);
		return (ArrayList<P_board>)list;
	}

	public ArrayList<P_board> selectSearchDate(SearchAndPage searches) {
		List<P_board> list = sqlSession.selectList("pboardMapper.searchDate", searches);
		return (ArrayList<P_board>)list;
	}

	public int getSearchTitleListCount(String keyword) {
		return sqlSession.selectOne("pboardMapper.getSearchTitleListCount", keyword);
	}

	public int getSearchWriterListCount(String keyword) {
		return sqlSession.selectOne("pboardMapper.getSearchWriterListCount", keyword);
	}

	public int getSearchDateListListCount(SearchDate dates) {
		return sqlSession.selectOne("pboardMapper.getSearchDateListCount", dates);
	}
	
}
