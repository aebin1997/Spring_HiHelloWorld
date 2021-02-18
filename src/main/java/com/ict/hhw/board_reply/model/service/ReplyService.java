package com.ict.hhw.board_reply.model.service;

import java.util.ArrayList;

import com.ict.hhw.board_reply.model.vo.Reply;

public interface ReplyService {
	int insertReply(Reply reply);
	int updateReply(Reply reply);
	int deleteReply(int rid);
	Reply selectReply(int rid);
	ArrayList<Reply> selectList(int ref_bid);
}
