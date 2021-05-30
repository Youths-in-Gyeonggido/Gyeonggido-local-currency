package com.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.UserDAOImpl;
import com.test.dto.UserDTO;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Autowired
	UserDAOImpl userDAO;

	// 로그인
	public UserDTO Login(UserDTO dto) {
		return userDAO.Login(dto);
	}

	// 회원가입
	@Override
	public void SignUp(UserDTO dto) {
		userDAO.signUp(dto);
	}

	// 아이디중복체크
	@Override
	public int idCheck(String id) {
		int cnt = userDAO.idCheck(id);
		return cnt;
	}

	//회원정보
	public UserDTO mypage(UserDTO dto) {
		return userDAO.mypage(dto);
	}
	
	//회원정보 수정
	public void updateUser(UserDTO dto) {
		userDAO.updateUser(dto);
	}
	
	//회원정보 삭제
	public void delete(UserDTO dto) {
		userDAO.delete(dto);
	}
	
}