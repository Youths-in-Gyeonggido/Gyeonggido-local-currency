package org.mybatis.persistence;

import org.mybatis.domain.Account;

public interface AccountMapper {
	public Account Login(Account dto); //로그인
	public void signUp(Account dto); //회원가입
	public int idCheck(String id); //아이디중복체크
	public Account mypage(Account dto); //회원정보
	public void updateUser(Account dto); //회원정보 수정
	public void delete(Account dto); //회원정보 삭제
}
