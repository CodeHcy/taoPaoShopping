package com.service.before.Impl;

import com.dao.BuserDao;
import com.dao.OrderDao;
import com.domain.Cart;
import com.domain.Order;
import com.domain.Orderdetail;
import com.service.before.UserCenterServiceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-14-14:18
 * @flag Keep on running
 */
@Service
public class UserCenterServiceImpl implements UserCenterServiceDao {
    @Autowired
    private BuserDao buserDao;
    @Autowired
    private OrderDao orderDao;
    @Override
    public Integer getBuserId(String userEmail) {
        return buserDao.getId(userEmail);
    }

    @Override
    public List<Order> getUserOrder(Integer userid) {
        return orderDao.getUserOrder(userid);
    }

    @Override
    public Order getAOrder(String id) {
        return orderDao.getAOreder(id);
    }

    @Override
    public void AddAgoodsCart(Cart cart) {
        orderDao.addAGoodsCart(cart);
    }

    @Override
    public int deleteACart(Integer id) {
        return orderDao.deleteACart(id);
    }

    @Override
    public List<Orderdetail> getOrderDetailList(Integer id) {
        return orderDao.getOrderDetailList(id);
    }

    @Override
    public List<Orderdetail> getAllOrderGoods(Integer id) {
        return orderDao.getOrderDetailList(id);
    }

    public List<Cart> qureyCart(Integer id) {
        return orderDao.getCart(id);
    }

    @Override
    public int updataOrder(Integer id) {
        return orderDao.updataOrder(id);
    }
}
