package controller;


import com.mysql.jdbc.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Web application lifecycle listener.
 *
 * @author Brightonter
 */
public class init implements ServletContextListener {
    private Connection conn;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            try {
                conn = (Connection) getDb().getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(init.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (NamingException ex) {
            Logger.getLogger(init.class.getName()).log(Level.SEVERE, null, ex);
        }
        sce.getServletContext().setAttribute("connection", conn);
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }

    private DataSource getDb() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/db");
    }
    
}
