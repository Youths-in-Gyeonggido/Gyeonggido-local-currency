package com.test.dao;

import com.test.dto.UserDTO;

public interface IUserDAO {
	public UserDTO Login(UserDTO dto); //�α���
	public void signUp(UserDTO dto); //ȸ������
	public int idCheck(String id); //���̵��ߺ�üũ
	public UserDTO mypage(UserDTO dto); //ȸ������
	public void updateUser(UserDTO dto); //ȸ������ ����
	public void delete(UserDTO dto); //ȸ������ ����
}