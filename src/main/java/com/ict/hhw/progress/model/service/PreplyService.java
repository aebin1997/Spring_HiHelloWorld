package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import com.ict.hhw.progress.model.vo.P_reply;


public interface PreplyService {
	int insertReply(P_reply reply);
	int updateReply(P_reply reply);
	int deleteReply(int rid);
	P_reply selectReply(int rid);
	ArrayList<P_reply> selectList(int ref_bid);
}
