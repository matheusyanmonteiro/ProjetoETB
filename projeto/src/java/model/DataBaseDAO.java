/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Matheus
 */
public class DataBaseDAO {
    Connection conn;
    public DataBaseDAO(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            System.out.println("Erro para encontrar o Driver do banco."+e);
        }
    }
    
    public void conectar(){
        try {
            String url = "jdbc:mysql://localhost/tccsal";
            String usuario = "root";
            String senha="";
            conn = DriverManager.getConnection(url, usuario, senha);
        } catch (Exception e) {
            System.out.println("Erro ao conectar ao banco."+e);
        }
    }
    
    public void desconectar(){
        try {
            conn.close();
        } catch (Exception e) {
            System.out.println("Erro ao desconectar do banco."+e);
        }
    
    }
    
}
