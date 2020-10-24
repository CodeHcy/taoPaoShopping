package com.dao;

import com.domain.Auser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author hcy
 * @create 2020-09-30-13:58
 * @flag Keep on running
 */
@Repository
public interface auserTable {
    List<Auser> selectAuser();

    List<Auser> selectAuserName();
}
