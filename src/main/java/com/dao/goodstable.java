package com.dao;

import com.domain.Goods;
import com.domain.Orderdetail;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author hcy
 * @create 2020-09-30-15:57
 * @flag Keep on running
 */
@Repository
public interface goodstable {
    List<Goods> qureyGoods();
    int addGoods(Goods goods);

    int deleteGood(Integer id);

    Goods selectAGoods(Integer id);

    int updateGood(Goods goods);

    int getCount();

    String getImPath(Integer id);

    List<Goods> ByTypeshows(Integer goodstype_id);

    Integer getATypeCount(Integer goodstype_id);

    int updategstore(Orderdetail orderdetail);

    Integer getgstore(Integer goodstable_id);
}
