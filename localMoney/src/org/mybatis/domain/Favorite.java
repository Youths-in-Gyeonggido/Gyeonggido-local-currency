package org.mybatis.domain;

import java.io.Serializable;

public class Favorite implements Serializable {
	private int favNo; 
	private String shopName;
	private String address;
	private String hrefURL;
	private String id;
	
	/* 기본 생성자 */
	public Favorite() {
	}

	/* 생성자 */
	public Favorite(int favNo, String shopName, String address, String hrefURL, String id) {
		this.favNo = favNo;
		this.shopName = shopName;
		this.address = address;
		this.hrefURL = hrefURL;
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getFavNo() {
		return favNo;
	}

	public void setFavNo(int favNo) {
		this.favNo = favNo;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHrefURL() {
		return hrefURL;
	}

	public void setHrefURL(String hrefURL) {
		this.hrefURL = hrefURL;
	}

}