package com.service.admin.Impl;

import com.dao.OrderDao;
import com.domain.Order;
import com.domain.Orderdetail;
import com.service.admin.OrderServiceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-22:17
 * @flag Keep on running
 */
@Service
public class OrderServiceImpl implements OrderServiceDao {

    @Autowired
    private OrderDao orderDao;
    @Override
    public Integer getOrderCount() {
        return orderDao.getOrderCount();
    }

    @Override
    public List<Order> queryOrderAll() {
        return orderDao.queryOrderAll();
    }


    public int deleteOrder(Integer id) {
        return orderDao.deleteOrder(id);
    }
    @Override
    public Orderdetail OrderXQ(Integer id) {
        return orderDao.orderXQ(id);
    }

}
