package com.service.admin;

import com.domain.Goods;
import com.domain.GoodsType;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hcy
 * @create 2020-09-30-16:03
 * @flag Keep on running
 */

public interface GoodsService {

    List<Goods> doQureyGoods();
    int addGoods(Goods goods);

    int delectGood(Integer id);

    Goods selectAGoods(Integer id);

    int updateGoods(Goods goods);

    int getCount();

    List<GoodsType> queryType();

    int typeCount();

    int deleteType(Integer id);

    int addType(GoodsType typename);


    String getImPath(Integer id);

    List<Goods> loadType();
}
