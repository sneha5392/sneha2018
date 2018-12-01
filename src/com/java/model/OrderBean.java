package com.java.model;

import sun.security.util.BigInt;

public class OrderBean {
	private int order_id;
	private String order_date;
	private String user_id;
	private long total_bill;
	private String proposed_delivery_date;
	private String actual_shipping_date;
	private String payment_mode_id;
	private String status_id;
	private String shipping_address;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public long getTotal_bill() {
		return total_bill;
	}
	public void setTotal_bill(long total_bill) {
		this.total_bill = total_bill;
	}
	public String getProposed_delivery_date() {
		return proposed_delivery_date;
	}
	public void setProposed_delivery_date(String proposed_delivery_date) {
		this.proposed_delivery_date = proposed_delivery_date;
	}
	public String getActual_shipping_date() {
		return actual_shipping_date;
	}
	public void setActual_shipping_date(String actual_shipping_date) {
		this.actual_shipping_date = actual_shipping_date;
	}
	public String getPayment_mode_id() {
		return payment_mode_id;
	}
	public void setPayment_mode_id(String payment_mode_id) {
		this.payment_mode_id = payment_mode_id;
	}
	public String getStatus_id() {
		return status_id;
	}
	public void setStatus_id(String status_id) {
		this.status_id = status_id;
	}
	public String getShipping_address() {
		return shipping_address;
	}
	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}
	
}
