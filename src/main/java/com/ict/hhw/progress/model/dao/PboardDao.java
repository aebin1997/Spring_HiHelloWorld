package com.ict.hhw.progress.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.common.SearchDate;
import com.ict.hhw.progress.model.vo.P_board;
import com.ict.hhw.progress.model.vo.Progress;
import com.ict.hhw.progress.model.vo.Psearch;
import com.ict.hhw.progress.model.vo.QaProgress;

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
	
	public ArrayList<P_board> selectOldList(int pro_id) {
		List<P_board> list = sqlSession.selectList("pboardMapper.selectOldList", pro_id);
		return (ArrayList<P_board>)list;
	}
	
	public P_board selectPboard(int pid) {
		return sqlSession.selectOne("pboardMapper.selectPboard", pid);
	}
	
	public QaProgress selectProgress(int pro_id) {
		return sqlSession.selectOne("progressMapper.selectProgress", pro_id);
	}

	public int addReadCount(int pid) {
		return sqlSession.update("pboardMapper.updatePCount", pid);
	}

	public int insertPboard(P_board pboard) {
		return sqlSession.insert("pboardMapper.insertPboard", pboard);
	}

	public int updateBoard(P_board pboard) {
		return sqlSession.update("pboardMapper.updatePboard", pboard);
	}

	public int deletePboard(int pid) {
		return sqlSession.update("pboardMapper.changePstatusN", pid);
	}

	public ArrayList<P_board> selectSearchTitle(Psearch psearch) {
		List<P_board> list = sqlSession.selectList("pboardMapper.searchTitle", psearch);
		return (ArrayList<P_board>)list;
	}

	public ArrayList<P_board> selectSearchWriter(Psearch psearch) {
		List<P_board> list = sqlSession.selectList("pboardMapper.searchWriter", psearch);
		return (ArrayList<P_board>)list;
	}

	public ArrayList<P_board> selectSearchDate(Psearch psearch) {
		List<P_board> list = sqlSession.selectList("pboardMapper.searchDate", psearch);
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
	
	public int updateDeadline(Progress progress) {
		return sqlSession.update("pboardMapper.updateDeadline", progress);
	}
	
	public int processMinus(int pro_id) {
		return sqlSession.update("pboardMapper.processMinus", pro_id);
	}
	
	public int processPlus(int pro_id) {
		return sqlSession.update("pboardMapper.processPlus", pro_id);
	}
	
	
	
}
