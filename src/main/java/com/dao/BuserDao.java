package com.dao;

import com.domain.Buser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-06-18:49
 * @flag Keep on running
 */
@Repository
public interface BuserDao {

    List<Buser> testBuser();

    int addBuser(Buser buser);

    Integer getId(String userEmail);
}
