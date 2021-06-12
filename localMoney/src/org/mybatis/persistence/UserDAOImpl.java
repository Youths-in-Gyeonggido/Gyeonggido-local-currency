package org.mybatis.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import org.mybatis.domain.Account;

@Repository
public class UserDAOImpl implements AccountMapper {
	@Inject
	private SqlSession sqlSession;
	
	@Override //로그인
	public Account Login(Account dto) {
		return sqlSession.selectOne("testMapper.Login",dto);		
	}
	
	@Override //회원가입
	public void signUp(Account dto) {
		sqlSession.insert("testMapper.signUp", dto);
	}
	
	@Override//아이디중복체크
	public int idCheck(String id) {
		int cnt=sqlSession.selectOne("testMapper.idCheck", id);
		return cnt;
	}
	
	@Override //회원정보
	public Account mypage(Account dto) {
		return sqlSession.selectOne("testMapper.mypage",dto);		
	}
	
	@Override //회원정보 수정
	public void updateUser(Account dto) {
		sqlSession.update("testMapper.update", dto);		
	}
	
	@Override //회원정보 삭제
	public void delete(Account dto) {
		sqlSession.delete("testMapper.delete", dto);		
	}
}