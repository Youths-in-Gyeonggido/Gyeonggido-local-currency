package com.test.dao;

import com.test.dto.UserDTO;

public interface IUserDAO {
	public UserDTO Login(UserDTO dto); //로그인
	public void signUp(UserDTO dto);//회원가입
	public int idCheck(String id);//중복확인
}