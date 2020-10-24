package com.service.admin.Impl;

import com.dao.GoodsTypeTable;
import com.dao.goodstable;
import com.domain.Goods;
import com.domain.GoodsType;
import com.service.admin.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hcy
 * @create 2020-09-30-16:05
 * @flag Keep on running
 */
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private goodstable goodstable;
    @Autowired
    private GoodsTypeTable goodsTypeTable;
    public List<Goods> doQureyGoods() {
        return goodstable.qureyGoods();
    }


    @Override
    public int delectGood(Integer id) {
        return goodstable.deleteGood(id);
    }

    @Override
    public int getCount() {
        return goodstable.getCount();
    }


    public int typeCount() {
        return goodsTypeTable.typeCount();
    }

    public List<GoodsType> queryType() {
        return goodsTypeTable.queryType();
    }

    public int updateGoods(Goods goods) {
        return goodstable.updateGood(goods);
    }

    @Override
    public int deleteType(Integer id) {
        return goodsTypeTable.deleteType(id);
    }

    public int addType(GoodsType goodsType) {
        return  goodsTypeTable.addType(goodsType);
    }

    @Override
    public List<Goods> loadType() {
        return goodsTypeTable.loadType();
    }

    @Override
    public String getImPath(Integer id) {
        return goodstable.getImPath(id);
    }

    public Goods selectAGoods(Integer id) {
        return goodstable.selectAGoods(id);
    }

    public int addGoods(Goods goods) {
        return goodstable.addGoods(goods);
    }
}
