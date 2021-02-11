package com.ict.hhw.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.member.model.dao.MemberDao;
import com.ict.hhw.member.model.service.MemberService;
import com.ict.hhw.member.model.vo.Member;

@Service("mService")
public class MemerServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;

	// 트랜잭션 처리용
	//@Autowired
	//SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(m);
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		int result = mDao.insertMember(m);

		return result;
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}

	@Override
	public Member findId(Member m) {
		Member loginUser = mDao.findId(m);
		return loginUser;
	}

	@Override
	public int findPw(Member m) {
		return mDao.findPw(m);
	}
	
	@Override
	public int idCheck(String id) {
		return mDao.idCheck(id);
	}

}
