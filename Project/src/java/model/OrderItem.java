/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Brightonter
 */
public class OrderItem implements java.io.Serializable{
    
    private int cart_id;
    private int p_id;
    private int product_color_id;
    private int pso_id;
    private int quantity;

    public OrderItem() {
    }

    public OrderItem(int cart_id, int p_id, int product_color_id, int pso_id, int quantity) {
        this.cart_id = cart_id;
        this.p_id = p_id;
        this.product_color_id = product_color_id;
        this.pso_id = pso_id;
        this.quantity = quantity;
    }
    
    

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public int getProduct_color_id() {
        return product_color_id;
    }

    public void setProduct_color_id(int product_color_id) {
        this.product_color_id = product_color_id;
    }

    public int getPso_id() {
        return pso_id;
    }

    public void setPso_id(int pso_id) {
        this.pso_id = pso_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
    
    
}
