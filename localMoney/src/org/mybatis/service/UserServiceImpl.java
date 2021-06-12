package org.mybatis.service;

import javax.annotation.Resource;

import org.mybatis.domain.Account;
import org.mybatis.persistence.AccountMapper;
import org.mybatis.persistence.UserDAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Autowired
	UserDAOImpl userDAO;
	
	@Resource
	private AccountMapper accountMapper;

	@Override
	public Account Login(Account dto) {
		// 매퍼 객체 호출
		System.out.println(dto.getId());
		System.out.println(dto.getPassword());
		return accountMapper.Login(dto);
	}
	
	@Override
	public void SignUp(Account dto) {
		// 매퍼 객체 호출
		this.accountMapper.signUp(dto);
	}
	
	@Override
	public int idCheck(String id) {
		// 매퍼 객체 호출
		int cnt = accountMapper.idCheck(id);
		return cnt;
	}
	
	@Override
	public Account mypage(Account dto) {
		// 매퍼 객체 호출
		return this.accountMapper.mypage(dto);
	}
	
	@Override
	public void updateUser(Account dto) {
		// 매퍼 객체 호출
		accountMapper.updateUser(dto);
	}
	
	@Override
	public void delete(Account dto) {
		// 매퍼 객체 호출
		accountMapper.delete(dto);
	}
	
	/*
	 * public Account Login(Account dto) { return userDAO.Login(dto); }
	 * 
	 * 
	 * @Override public void SignUp(Account dto) { userDAO.signUp(dto); }
	 * 
	 * 
	 * @Override public int idCheck(String id) { int cnt = userDAO.idCheck(id);
	 * return cnt; }
	 * 
	 * 
	 * public Account mypage(Account dto) { return userDAO.mypage(dto); }
	 * 
	 * 
	 * public void updateUser(Account dto) { userDAO.updateUser(dto); }
	 * 
	 * 
	 * public void delete(Account dto) { userDAO.delete(dto); }
	 */
}