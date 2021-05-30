package com.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.UserDAOImpl;
import com.test.dto.UserDTO;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Autowired
	UserDAOImpl userDAO;

	// �α���
	public UserDTO Login(UserDTO dto) {
		return userDAO.Login(dto);
	}

	// ȸ������
	@Override
	public void SignUp(UserDTO dto) {
		userDAO.signUp(dto);
	}

	// ���̵��ߺ�üũ
	@Override
	public int idCheck(String id) {
		int cnt = userDAO.idCheck(id);
		return cnt;
	}

	//ȸ������
	public UserDTO mypage(UserDTO dto) {
		return userDAO.mypage(dto);
	}
	
	//ȸ������ ����
	public void updateUser(UserDTO dto) {
		userDAO.updateUser(dto);
	}
	
	//ȸ������ ����
	public void delete(UserDTO dto) {
		userDAO.delete(dto);
	}
	
}