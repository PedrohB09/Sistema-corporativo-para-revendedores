/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;
import java.sql.*;

/**
 *
 * @author pedro, nathalye, guilherme e geovanna
 */
public class ConectaBanco {
    public static Connection conectar() throws ClassNotFoundException{
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kerokero","root","");
        } catch (Exception ex) {
            System.out.println("Erro - SQL: " + ex);
        }        
        return conn;
    }
}
