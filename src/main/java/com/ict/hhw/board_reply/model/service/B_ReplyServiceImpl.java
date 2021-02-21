package com.ict.hhw.board_reply.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.board_reply.model.vo.B_Reply;
import com.ict.hhw.board_reply.model.dao.B_ReplyDao;

@Service("b_replyService")
public class B_ReplyServiceImpl implements B_ReplyService {

	@Autowired
	private B_ReplyDao b_replyDao;
	
	@Override
	public int insertB_Reply(B_Reply b_reply) {
		return b_replyDao.insertB_Reply(b_reply);
	}

	@Override
	public int updateB_Reply(B_Reply b_reply) {
		return b_replyDao.updateB_Reply(b_reply);
	}

	@Override
	public int deleteB_Reply(int b_rid) {
		return b_replyDao.deleteB_Reply(b_rid);
	}

	@Override
	public B_Reply selectReply(int b_rid) {
		return b_replyDao.selectB_Reply(b_rid);
	}
	
	// 댓글 목록

	@Override
	public ArrayList<B_Reply> selectList(int b_ref_bid) {
		return b_replyDao.selectList(b_ref_bid);
	}


}