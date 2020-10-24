package com.domain;

import org.springframework.stereotype.Component;

/**
 * @author hcy
 * @create 2020-10-14-22:13
 * @flag Keep on running
 */
@Component
public class Cart {
    private Integer id;
    private Integer goodstable_id;
    private Integer busertable_id;
    private Integer shoppingnum;

    public Cart() {
    }

    public Cart( Integer goodstable_id, Integer busertable_id, Integer shoppingnum) {

        this.goodstable_id = goodstable_id;
        this.busertable_id = busertable_id;
        this.shoppingnum = shoppingnum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodstable_id() {
        return goodstable_id;
    }

    public void setGoodstable_id(Integer goodstable_id) {
        this.goodstable_id = goodstable_id;
    }

    public Integer getBusertable_id() {
        return busertable_id;
    }

    public void setBusertable_id(Integer busertable_id) {
        this.busertable_id = busertable_id;
    }

    public Integer getShoppingnum() {
        return shoppingnum;
    }

    public void setShoppingnum(Integer shoppingnum) {
        this.shoppingnum = shoppingnum;
    }
}
