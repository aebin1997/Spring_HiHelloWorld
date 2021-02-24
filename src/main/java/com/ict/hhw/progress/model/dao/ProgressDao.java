package com.ict.hhw.progress.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.progress.model.vo.Progress;



@Repository("progressDao")
public class ProgressDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Progress> selectPlist(String nickname) {
		List<Progress> list = sqlSession.selectList("progressMapper.selectPlist", nickname);
		return (ArrayList<Progress>)list;
	}
	
	public ArrayList<String> selectQaTitle(String nickname) {
		List<String> list = sqlSession.selectList("progressMapper.selectQatitle", nickname);
		return (ArrayList<String>)list;
	}
	
	public String selectUser(String nickname){
		String user = sqlSession.selectOne("progressMapper.selectUser", nickname);
		return user;
	}
	
	public String findQaId(String qa_title) {
		String qa_id = sqlSession.selectOne("progressMapper.findQaId", qa_title);
		return qa_id;
	}
	
	public int insertProgress(Progress progress) {
		return sqlSession.insert("progressMapper.insertProgress", progress);
	}
	
	public ArrayList<Progress> selectRequest(String nickname) {
		List<Progress> list = sqlSession.selectList("progressMapper.selectRequest", nickname);
		return (ArrayList<Progress>)list;
	}
	
	public int requestAccept(int pro_id) {
		return sqlSession.update("progressMapper.requestAccept", pro_id);
	}
}
