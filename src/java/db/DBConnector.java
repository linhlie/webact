/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Lie
 */
public class DBConnector {
//    public static Connection getConnection() throws Exception {
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        String url = "jdbc:mysql://localhost:3306/webact?useSSL=false";
//        String user = "root";
//        String pass = "12345";
//        return DriverManager.getConnection(url, user, pass);
//    }
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://125.212.227.42:3336/web_act_NguyenKhacLinh?useSSL=false";
        String user = "root";
        String pass = "toor";
        return DriverManager.getConnection(url, user, pass);
    }
}
