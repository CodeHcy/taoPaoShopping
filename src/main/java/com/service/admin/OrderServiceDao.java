package com.service.admin;

import com.domain.Order;
import com.domain.Orderdetail;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-22:16
 * @flag Keep on running
 */
public interface OrderServiceDao {
    Integer getOrderCount();

    List<Order> queryOrderAll();

    int deleteOrder(Integer id);

    Orderdetail OrderXQ(Integer id);
}
