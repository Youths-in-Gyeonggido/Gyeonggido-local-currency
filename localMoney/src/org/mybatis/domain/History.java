package org.mybatis.domain;

import java.io.Serializable;

public class History implements Serializable {
	private int hisNo;
	private String hrefURL;
	private String id;
	private String shopType;
	private int sectors;
	private String address;
	
	/* 기본 생성자 */
	public History() {
	}

	/* 생성자 */
	public History(int hisNo, String hrefURL, String id, String shopType, int sectors, String address) {
		this.hisNo = hisNo;
		this.hrefURL = hrefURL;
		this.id = id;
		this.shopType = shopType;
		this.sectors = sectors;
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getHisNo() {
		return hisNo;
	}

	public void setHisNo(int hisNo) {
		this.hisNo = hisNo;
	}

	public String getShopType() {
		return shopType;
	}

	public void setShopType(String shopType) {
		this.shopType = shopType;
	}

	public int getSectors() {
		return sectors;
	}

	public void setSectors(int sectors) {
		this.sectors = sectors;
	}

	public String getHrefURL() {
		return hrefURL;
	}

	public void setHrefURL(String hrefURL) {
		this.hrefURL = hrefURL;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	

}