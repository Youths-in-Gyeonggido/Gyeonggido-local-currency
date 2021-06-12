package org.mybatis.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.domain.Favorite;
import org.mybatis.domain.History;
import org.mybatis.domain.Shop;
import org.mybatis.persistence.ShopMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ShopServiceImpl implements ShopService {
	@Resource
	private ShopMapper shopMapper;

	/* 가게 목록 조회 */
	@Override
	public List<Shop> find(Shop shop) {
		// 매퍼 객체 호출
		return this.shopMapper.list(shop);
	}
	
	@Override
	public Shop detail(Shop shop) {
		// 매퍼 객체 호출
		return this.shopMapper.detail(shop);
	}
	
	@Override
	public void insert_history(History history) {
		// 매퍼 객체 호출
		this.shopMapper.insert_history(history);
	}
	
	@Override
	public List<History> select_history(History history) {
		// 매퍼 객체 호출
		return this.shopMapper.select_history(history);
	}
	
	@Override
	public void delete_history(String hisNo) {
		// 매퍼 객체 호출
		this.shopMapper.delete_history(hisNo);
	}
	
	@Override
	public void insert_favorite(Favorite favorite) {
		this.shopMapper.insert_favorite(favorite);
	}
	
	@Override
    public List<Favorite> select_favorite(Favorite favorite){
		return this.shopMapper.select_favorite(favorite);
	}
	
	@Override
    public void delete_favorite(Favorite favorite) {
		this.shopMapper.delete_favorite(favorite);
	}
}