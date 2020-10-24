package com.service.before;

import com.domain.Cart;
import com.domain.Order;
import com.domain.Orderdetail;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-14-14:18
 * @flag Keep on running
 */
public interface UserCenterServiceDao {

    Integer getBuserId(String userEmail);

    List<Order> getUserOrder(Integer userid);


    Order getAOrder(String id);


    int updataOrder(Integer id);

    List<Cart> qureyCart(Integer id);

    void AddAgoodsCart(Cart cart);

    int deleteACart(Integer id);


    List<Orderdetail> getOrderDetailList(Integer busertable_id);

    List<Orderdetail> getAllOrderGoods(Integer id);


}
