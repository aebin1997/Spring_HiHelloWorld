package com.ict.hhw.progress.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.progress.model.vo.P_reply;

@Repository("preplyDao")
public class PreplyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertReply(P_reply reply) {
		return sqlSession.insert("preplyMapper.insertPreply", reply);
	}

	public int updateReply(P_reply reply) {
		return sqlSession.update("preplyMapper.updatePreply", reply);
	}

	public int deleteReply(int rid) {
		return sqlSession.delete("preplyMapper.deletePreply", rid);
	}

	public P_reply selectReply(int rid) {
		return sqlSession.selectOne("preplyMapper.selectPreply", rid);
	}

	public ArrayList<P_reply> selectList(int ref_bid) {
		List<P_reply> list = sqlSession.selectList("preplyMapper.selectList", ref_bid);
		return (ArrayList<P_reply>)list;
	}
}
