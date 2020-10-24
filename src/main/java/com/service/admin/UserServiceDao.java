package com.service.admin;

import com.domain.Buser;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-15:39
 * @flag Keep on running
 */
public interface UserServiceDao {
    List<Buser> queryUserAll();

    int UserCount();

    Integer deleteUser(Integer id);
}
