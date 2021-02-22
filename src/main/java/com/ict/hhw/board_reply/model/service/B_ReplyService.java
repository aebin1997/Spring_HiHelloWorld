package com.ict.hhw.board_reply.model.service;

import java.util.ArrayList;

import com.ict.hhw.board_reply.model.vo.B_Reply;

public interface B_ReplyService {
	//댓글목록
	ArrayList<B_Reply> selectList(int b_rid);
	int insertB_Reply(B_Reply b_reply);
	int updateB_Reply(B_Reply b_reply);
	int deleteB_Reply(int b_rid);
	B_Reply selectReply(int b_rid);
}
