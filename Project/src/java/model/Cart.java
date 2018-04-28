/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Brightonter
 */
public class Cart {
    
    private int cart_id;
    private String member_user_username;
    private Date order_date;
    private float total_price;
    private String payment_status;
    private String transport_status;

    public Cart() {
    }

    public Cart(int cart_id, String member_user_username, Date order_date, float total_price, String payment_status, String transport_status) {
        this.cart_id = cart_id;
        this.member_user_username = member_user_username;
        this.order_date = order_date;
        this.total_price = total_price;
        this.payment_status = payment_status;
        this.transport_status = transport_status;
    }
    
    

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public String getMember_user_username() {
        return member_user_username;
    }

    public void setMember_user_username(String member_user_username) {
        this.member_user_username = member_user_username;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public float getTotal_price() {
        return total_price;
    }

    public void setTotal_price(float total_price) {
        this.total_price = total_price;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public String getTransport_status() {
        return transport_status;
    }

    public void setTransport_status(String transport_status) {
        this.transport_status = transport_status;
    }
    
    
}
