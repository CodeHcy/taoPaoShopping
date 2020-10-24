package com.dao;

import com.domain.Buser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-15:43
 * @flag Keep on running
 */
@Repository
public interface UserDao {
    List<Buser> queryUserAll();

    int getCount();

    Integer deleteUser(Integer id);
}
