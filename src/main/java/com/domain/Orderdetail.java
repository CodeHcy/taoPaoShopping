package com.domain;

/**
 * @author hcy
 * @create 2020-10-04-16:35
 * @flag Keep on running
 */
public class Orderdetail {
    private  Integer id;
    private  Integer orderbasetable_id;
    private  Integer goodstable_id;
    private  Integer shoppingnum;

    public Orderdetail(Integer orderbasetable_id, Integer goodstable_id, Integer shoppingnum) {
        this.orderbasetable_id = orderbasetable_id;
        this.goodstable_id = goodstable_id;
        this.shoppingnum = shoppingnum;
    }

    public Orderdetail() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderbasetable_id() {
        return orderbasetable_id;
    }

    public void setOrderbasetable_id(Integer orderbasetable_id) {
        this.orderbasetable_id = orderbasetable_id;
    }

    public Integer getGoodstable_id() {
        return goodstable_id;
    }

    public void setGoodstable_id(Integer goodstable_id) {
        this.goodstable_id = goodstable_id;
    }

    public Integer getShoppingnum() {
        return shoppingnum;
    }

    public void setShoppingnum(Integer shoppingnum) {
        this.shoppingnum = shoppingnum;
    }
}
