package org.mybatis.domain;

import java.io.Serializable;

public class Shop implements Serializable {
	private String shopName;
	private String shopType;
	private String shopLocationX;
	private String shopLocationY;
	private String shopAddress;
	private int shopPost;
	private String city;
	private int sectors;
	private double lat;
	private double lon;

	/* 기본 생성자 */
	public Shop() {
	}

	/* 생성자 */
	public Shop(String shopName, String shopType, String shopLocationX, String shopLocationY, String shopAddress, int shopPost, String city, int sectors, double lat, double lon) {
		this.shopName = shopName;
		this.shopType = shopType;
		this.shopLocationX = shopLocationX;
		this.shopLocationY = shopLocationY;
		this.shopAddress = shopAddress;
		this.shopPost = shopPost;
		this.city = city;
		this.sectors = sectors;
		this.lat = lat;
		this.lon = lon;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getSectors() {
		return sectors;
	}

	public void setSectors(int sectors) {
		this.sectors = sectors;
	}

	public String getShopType() {
		return shopType;
	}

	public void setShopType(String shopType) {
		this.shopType = shopType;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopLocationX() {
		return shopLocationX;
	}

	public void setShopLocationX(String shopLocationX) {
		this.shopLocationX = shopLocationX;
	}

	public String getShopLocationY() {
		return shopLocationY;
	}

	public void setShopLocationY(String shopLocationY) {
		this.shopLocationY = shopLocationY;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public int getShopPost() {
		return shopPost;
	}

	public void setShopPost(int shopPost) {
		this.shopPost = shopPost;
	}
}