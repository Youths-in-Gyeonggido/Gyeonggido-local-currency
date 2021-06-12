package org.mybatis.persistence;

import java.util.List;

import org.mybatis.domain.Favorite;
import org.mybatis.domain.History;
import org.mybatis.domain.Shop;

public interface ShopMapper {
    public List<Shop> list(Shop shop);
    public Shop detail(Shop shop);
    public void insert_history(History history);
    public void insert_favorite(Favorite favroite);
    public List<Favorite> select_favorite(Favorite favorite);
    public void delete_favorite(Favorite favorite);
    public List<History> select_history(History history);
    public void delete_history(String hisNo);

   
}
