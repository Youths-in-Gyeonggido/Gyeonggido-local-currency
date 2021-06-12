package org.mybatis.service;

import org.mybatis.domain.Account;

public interface IUserService {
	public Account Login(Account dto);
	public void SignUp(Account dto);
	public int idCheck(String id);
	public Account mypage(Account dto);
	public void updateUser(Account dto);
	public void delete(Account dto);
}