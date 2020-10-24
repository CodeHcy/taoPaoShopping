package com.service.before.Impl;

import com.dao.OrderDao;
import com.dao.goodstable;
import com.domain.Cart;
import com.domain.Goods;
import com.domain.Order;
import com.domain.Orderdetail;
import com.service.before.BeforeGoodsServiceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;

/**
 * @author hcy
 * @create 2020-10-13-17:41
 * @flag Keep on running
 */
@Service
public class BeforeGoodsServiceImpl implements BeforeGoodsServiceDao {
    @Autowired
    private goodstable goodstable;
    @Autowired
    private OrderDao orderDao;

    @Override
    public int addOrder(Order order) {
        return orderDao.addOrder(order);
    }

    @Override
    public Cart getCart(Integer id) {
        return orderDao.getCartGood(id);
    }

    @Override
    public void addOrderDetail(Orderdetail orderdetail) {
        orderDao.addOrderDetail(orderdetail);
    }

    @Override
    public int updategstore(Orderdetail orderdetail) {
        return goodstable.updategstore(orderdetail);
    }

    @Override
    public Integer getgstore(Integer goodstable_id) {
        return goodstable.getgstore(goodstable_id);
    }


    public void updateCart(Cart cart) {
        orderDao.updateCart(cart);
    }

    @Override
    public Goods getAGoodsInfo(Integer id) {
        return goodstable.selectAGoods(id);
    }
}
