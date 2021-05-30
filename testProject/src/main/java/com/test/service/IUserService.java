package com.test.service;

import com.test.dto.UserDTO;

public interface IUserService {
	public UserDTO Login(UserDTO dto);
	public void SignUp(UserDTO dto);
	public int idCheck(String id);
	public UserDTO mypage(UserDTO dto);
	public void updateUser(UserDTO dto);
	public void delete(UserDTO dto);
}