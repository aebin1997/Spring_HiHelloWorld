package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.progress.model.dao.PreplyDao;
import com.ict.hhw.progress.model.vo.P_reply;


@Service("preplyService")
public class PreplyServiceImpl implements PreplyService {

	@Autowired
	private PreplyDao replyDao;
	
	@Override
	public int insertReply(P_reply reply) {
		return replyDao.insertReply(reply);
	}

	@Override
	public int updateReply(P_reply reply) {
		return replyDao.updateReply(reply);
	}

	@Override
	public int deleteReply(int rid) {
		return replyDao.deleteReply(rid);
	}

	@Override
	public P_reply selectReply(int rid) {
		return replyDao.selectReply(rid);
	}

	@Override
	public ArrayList<P_reply> selectList(int ref_bid) {
		return replyDao.selectList(ref_bid);
	}

}