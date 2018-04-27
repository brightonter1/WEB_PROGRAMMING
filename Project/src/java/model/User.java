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
public class User implements java.io.Serializable{
    private String username;
    private String dob;
    private String fname;
    private String lname;
    private String email;
    private String mobile;

    public User(){}
    
    public void setAll(String dob, String first_name, String last_name, String email, String mobile){
        this.dob = dob;
        this.fname = first_name;
        this.lname = last_name;
        this.email = email;
        this.mobile = mobile;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getfname() {
        return fname;
    }

    public void setfname(String first_name) {
        this.fname = first_name;
    }

    public String getlname() {
        return lname;
    }

    public void setlame(String last_name) {
        this.lname = last_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    
}
