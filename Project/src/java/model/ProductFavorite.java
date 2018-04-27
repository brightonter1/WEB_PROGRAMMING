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
public class ProductFavorite {
    private int user_id;
    private int product_p_id;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_p_id() {
        return product_p_id;
    }

    public void setProduct_p_id(int product_p_id) {
        this.product_p_id = product_p_id;
    }
}
