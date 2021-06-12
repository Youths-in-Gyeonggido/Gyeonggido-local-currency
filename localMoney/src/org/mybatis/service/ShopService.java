package org.mybatis.service;

import java.util.List;

import org.mybatis.domain.Favorite;
import org.mybatis.domain.History;
import org.mybatis.domain.Shop;

public interface ShopService {
    public List<Shop> find(Shop shop);
    public Shop detail(Shop shop);
    public void insert_history(History history);
    public List<History> select_history(History history);
    public void delete_history(String hisNo);
    public void insert_favorite(Favorite favorite);
    public List<Favorite> select_favorite(Favorite favorite);
    public void delete_favorite(Favorite favorite);
}
