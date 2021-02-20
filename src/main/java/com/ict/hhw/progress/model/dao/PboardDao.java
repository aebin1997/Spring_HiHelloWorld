package com.ict.hhw.progress.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.progress.model.vo.P_board;
import com.ict.hhw.progress.model.vo.PboardPage;

@Repository("pboardDao")
public class PboardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<P_board> selectList(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit - 1;
		
		List<P_board> list = sqlSession.selectList("pboardMapper.selectList", new PboardPage(startRow, endRow));
		return (ArrayList<P_board>)list;
	}

	public int getListCount() {
		return sqlSession.selectOne("pboardMapper.getListCount");
	}
	
}
