package org.mybatis.domain;

import java.io.Serializable;

public class Account implements Serializable {
	private String id;
	private String password;
	private String name;
	private String email;
	

	/* 기본 생성자 */
	public Account() {
	}

	/* 생성자 */
	public Account(String id, String password, String name, String email) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}