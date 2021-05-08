package com.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.UserDAOImpl;
import com.test.dto.UserDTO;

@Service("userService")
public class UserServiceImpl implements IUserService{
	@Autowired
	UserDAOImpl userDAO;
	
	//로그인
	public UserDTO Login(UserDTO dto) {
		System.out.println("로그인 서비스 시작");
		return userDAO.Login(dto);
		
	}
	
	//회원가입
	@Override
	public void SignUp(UserDTO dto) {
		System.out.println("회원가입 서비스 시작");
		userDAO.signUp(dto);
		System.out.println("회원가입 서비스 끝");
	}
	//아이디 중복확인
		@Override
		public int idCheck(String id) {
			int cnt=userDAO.idCheck(id);
			return cnt;
		}
}