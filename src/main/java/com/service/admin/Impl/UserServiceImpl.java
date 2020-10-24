package com.service.admin.Impl;

import com.dao.UserDao;
import com.domain.Buser;
import com.service.admin.UserServiceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-15:41
 * @flag Keep on running
 */
@Service
public class UserServiceImpl implements UserServiceDao {
    @Autowired
    private UserDao userDao;
    public List<Buser> queryUserAll() {
        return userDao.queryUserAll();
    }


    public int UserCount() {
        return userDao.getCount();
    }

    public Integer deleteUser(Integer id) {
        return userDao.deleteUser(id);
    }
}
