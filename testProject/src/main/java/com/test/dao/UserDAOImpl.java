package com.test.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.dto.UserDTO;

@Repository
public class UserDAOImpl implements IUserDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override //로그인
	public UserDTO Login(UserDTO dto) {
		System.out.println("로그인 dao 시작");
		return sqlSession.selectOne("testMapper.Login",dto);
		
	}
	
	@Override //회원가입
	public void signUp(UserDTO dto) {
		System.out.println("회원가입 dao 시작");
		sqlSession.insert("testMapper.signUp", dto);
		System.out.println("회원가입 dao 끝");
	}
	@Override//중복확인
	public int idCheck(String id) {
		int cnt=sqlSession.selectOne("testMapper.idCheck", id);
		return cnt;
	}
}