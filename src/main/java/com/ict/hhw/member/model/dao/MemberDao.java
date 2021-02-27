package com.ict.hhw.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.member.model.vo.Member;

//@Repository라는 어노테이션 : DB와 접근하는 클래스에 부여(@Component의 구체화된 개념이다)
@Repository("mDao")
public class MemberDao {

	// 데이터베이스 연결객체 (root-context에서 작성한 bean으로 생성되어 주입이된다.)
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 회원정보 리스트
	public ArrayList<Member> selectList(){
		List<Member> list = sqlSession.selectList("memberMapper.selectAll");
	
		return (ArrayList<Member>)list;
	}
	
	

	public Member loginMember(Member m) {
		return (Member) sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int deleteMember(String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}

	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public Member findId(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.findId", m);
	}

	public Member findPw(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.findPw", m);
	}
	
	public int setTempPw(Member m) {
		return sqlSession.update("memberMapper.setTempPw", m);
	}
	
	public int idCheck(String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}
}
