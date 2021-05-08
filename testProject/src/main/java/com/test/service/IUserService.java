package com.test.service;

import com.test.dto.UserDTO;

public interface IUserService {
	public UserDTO Login(UserDTO dto);
	public void SignUp(UserDTO dto);
	public int idCheck(String id);
}