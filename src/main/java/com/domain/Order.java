package com.domain;

public class Order {
	private Integer id;
	private Integer busertable_id;
	private Double amount;
	private Integer status;
	private String orderdate;

	public Order(Integer busertable_id, Double amount, Integer status, String orderdate) {
		this.busertable_id = busertable_id;
		this.amount = amount;
		this.status = status;
		this.orderdate = orderdate;
	}

	public Order() {
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBusertable_id() {
		return busertable_id;
	}
	public void setBusertable_id(Integer busertable_id) {
		this.busertable_id = busertable_id;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
}
