package com.ict.hhw.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.common.SearchDate;
import com.ict.hhw.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	//스프링-마이바티스 연동 객체 연결함 : root-context.xml에 선언되어 있음
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public NoticeDao() {}
	
	public ArrayList<Notice> selectList(){
		List<Notice> list = sqlSession.selectList("noticeMapper.selectAll");
	
		return (ArrayList<Notice>)list;
	}
	
	
	//리스트 보기
	public Notice selectOne(int nid) {
		return sqlSession.selectOne("noticeMapper.selectNotice",nid);
	}
	
	public int insertNotice(Notice notice) {
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}
	
	public int updateNotice(Notice notice) {
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}
	
	public int deletenotice(int nid) {
		return sqlSession.delete("noticeMapper.deleteNotice", nid);
	}
	
	//최근 공지글 몇개 조회
	public ArrayList<Notice> selectNewTop3(){
		List<Notice> list = sqlSession.selectList("noticeMapper.selectNewTop3");
		return (ArrayList<Notice>)list;
	}

	public ArrayList<Notice> selectSearchTitle(String keyword) {
		List<Notice> list = sqlSession.selectList("noticeMapper.searchTitle", keyword);
		return (ArrayList<Notice>)list;
	}

	public ArrayList<Notice> selectSearchWriter(String keyword) {
		List<Notice> list = sqlSession.selectList("noticeMapper.searchWriter", keyword);
		return (ArrayList<Notice>)list;
	}

	public ArrayList<Notice> selectSearchDate(SearchDate dates) {
		List<Notice> list = sqlSession.selectList("noticeMapper.searchDate", dates);
		return (ArrayList<Notice>)list;
	}
	
}