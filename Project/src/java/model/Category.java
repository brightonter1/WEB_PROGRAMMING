/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.LinkedList;

/**
 *
 * @author Brightonter
 */
public class Category implements java.io.Serializable{
    
    private LinkedList<String> category;

    public Category() {
    }

    public Category(LinkedList<String> category) {
        this.category = category;
    }

    public LinkedList<String> getCategory() {
        return category;
    }

    public void setCategory(LinkedList<String> category) {
        this.category = category;
    }

    public void addCategory(String product){
        this.category.add(product);
    }
    
    
}
