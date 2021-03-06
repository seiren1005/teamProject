package com.globalin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.globalin.model.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<MemberVO> memberList() {
		return sqlSession.selectList("member.memberList");
	}
	
	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert("member.insertMember", vo);
		
	}

	@Override
	public MemberVO viewMember(String userId) {
		return sqlSession.selectOne("member.viewMember", userId);
	}

	@Override
	public void deleteMember(String userId) {
		sqlSession.delete("member.deleteMember",userId);
	}

	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update("member.updateMember", vo);
		
	}

	@Override
	public boolean checkPw(String userId, String userPw) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		int count = sqlSession.selectOne("member.checkPw", map);
		if(count == 1) result= true;
		return result;
	}
	// 01_01. 회원 로그인체크
		@Override
		public boolean loginCheck(MemberVO vo) {
			String name = sqlSession.selectOne("member.loginCheck", vo);
			return (name == null) ? false : true;
		}
		// 01_02. 회원 로그인 정보
		@Override
		public MemberVO viewMember(MemberVO vo) {
			return sqlSession.selectOne("member.viewMember", vo);
		}
		// 02. 회원 로그아웃
		@Override
		public void logout(HttpSession session) {
		}

}
