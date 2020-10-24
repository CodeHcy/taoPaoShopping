package com.dao;

import com.domain.Goods;
import com.domain.GoodsType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-11:25
 * @flag Keep on running
 */
@Repository
public interface GoodsTypeTable {

    List<GoodsType> queryType();

    int typeCount();

    int deleteType(Integer id);

    int addType(GoodsType goodsType);


    List<Goods> loadType();

    Integer changeType(String typename);
}
