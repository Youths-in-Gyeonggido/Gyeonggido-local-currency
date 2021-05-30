package com.test.dao;

import com.test.dto.UserDTO;

public interface IUserDAO {
	public UserDTO Login(UserDTO dto); //로그인
	public void signUp(UserDTO dto); //회원가입
	public int idCheck(String id); //아이디중복체크
	public UserDTO mypage(UserDTO dto); //회원정보
	public void updateUser(UserDTO dto); //회원정보 수정
	public void delete(UserDTO dto); //회원정보 삭제
}