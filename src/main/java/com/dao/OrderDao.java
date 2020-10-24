package com.dao;

import com.domain.Cart;
import com.domain.Order;
import com.domain.Orderdetail;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Array;
import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-22:18
 * @flag Keep on running
 */
@Repository
public interface OrderDao {

    Integer getOrderCount();

    List<Order> queryOrderAll();

    int deleteOrder(Integer id);

    Orderdetail orderXQ(Integer id);

    List<Order> getUserOrder(Integer userid);

    Orderdetail getOrderDetail(Integer id);

    Order getAOreder(String id);

    int updataOrder(Integer id);

    List<Cart> getCart(Integer id);

    int addAGoodsCart(Cart cart);

    int deleteACart(Integer id);

    List<Orderdetail> getOrderDetailList(Integer id);

    void updateCart(Cart cart);

    int addOrder(Order order);

    Cart getCartGood(Integer id);

    void addOrderDetail(Orderdetail orderdetail);
}
