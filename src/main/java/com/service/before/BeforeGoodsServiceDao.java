package com.service.before;

import com.domain.Cart;
import com.domain.Goods;
import com.domain.Order;
import com.domain.Orderdetail;

import java.lang.reflect.Array;

/**
 * @author hcy
 * @create 2020-10-13-17:40
 * @flag Keep on running
 */
public interface BeforeGoodsServiceDao {

    Goods getAGoodsInfo(Integer id);

    void updateCart(Cart cart);

    int addOrder(Order order);


    Cart getCart(Integer id);

    void addOrderDetail(Orderdetail orderdetail);

    int updategstore(Orderdetail orderdetail);


    Integer getgstore(Integer goodstable_id);
}
