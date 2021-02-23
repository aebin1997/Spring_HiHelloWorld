package com.ict.hhw.blame.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.blame.model.vo.Blame;
import com.ict.hhw.blame.model.vo.BlamePage;
import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;

@Repository("blameDao")
public class BlameDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int getListCount() {
		return sqlSession.selectOne("blameMapper.getListCount");
	}

	public ArrayList<Blame> selectList(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit - 1;
		
		List<Blame> list = sqlSession.selectList("blameMapper.selectList", new BlamePage(startRow, endRow));
		return (ArrayList<Blame>)list;
	}

	//리스트보기
	public Blame selectOne(int blame_no) {
		return sqlSession.selectOne("blameMapper.selectBlame", blame_no);
	}

	public int addReadCount(int blame_no) {
		return sqlSession.update("blameMapper.updateBlame", blame_no);
	}

	public int insertBlame(Blame blame) {
		return sqlSession.insert("blameMapper.insertBlame", blame);
	}

	public int updateBlame(Blame blame) {
		return sqlSession.update("blameMapper.updateBlame", blame);
	}

	public int deleteBlame(int blame_no) {
		return sqlSession.update("blameMapper.changeBstatusN", blame_no);
	}

	public ArrayList<Blame> selectSearchTitle(SearchAndPage searches) {
		List<Blame> list = sqlSession.selectList("blameMapper.searchTitle", searches);
		return (ArrayList<Blame>)list;
	}

	public ArrayList<Blame> selectSearchWriter(SearchAndPage searches) {
		List<Blame> list = sqlSession.selectList("blameMapper.searchWriter", searches);
		return (ArrayList<Blame>)list;
	}

	public ArrayList<Blame> selectSearchDate(SearchAndPage searches) {
		List<Blame> list = sqlSession.selectList("blameMapper.searchDate", searches);
		return (ArrayList<Blame>)list;
	}

	public int getSearchTitleListCount(String keyword) {
		return sqlSession.selectOne("blameMapper.getSearchTitleListCount", keyword);
	}

	public int getSearchWriterListCount(String keyword) {
		return sqlSession.selectOne("blameMapper.getSearchWriterListCount", keyword);
	}

	public int getSearchDateListListCount(SearchDate dates) {
		return sqlSession.selectOne("blameMapper.getSearchDateListCount", dates);
	}

}
