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
public class Product implements java.io.Serializable{
    private int p_id;
    private int product_color_id;
    private int pso_id;
    private String title;
    private String description;
    private String cate_type;
    private String sex;
    private String color;
    private String image;
    private int quantity;
    private String size;
    private float price;

    public Product() {
    }

    public Product(int p_id, int product_color_id, int pso_id, String title, String description, String cate_type, String sex, String color, String image, int quantity, String size, float price) {
        this.p_id = p_id;
        this.product_color_id = product_color_id;
        this.pso_id = pso_id;
        this.title = title;
        this.description = description;
        this.cate_type = cate_type;
        this.sex = sex;
        this.color = color;
        this.image = image;
        this.quantity = quantity;
        this.size = size;
        this.price = price;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCate_type() {
        return cate_type;
    }

    public void setCate_type(String cate_type) {
        this.cate_type = cate_type;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
