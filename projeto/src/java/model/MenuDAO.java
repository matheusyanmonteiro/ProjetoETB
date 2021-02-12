/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Matheus
 */
public class MenuDAO extends DataBaseDAO {
    public void inserir(Menu m) throws Exception{
        String sql = "INSERT INTO menu (titulo,link,icone) VALUES(?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, m.getTitulo());
        pst.setString(2, m.getLink());
        pst.setString(3, m.getIcone());
        pst.execute();
    }
    public ArrayList<Menu> listar() throws Exception{
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            
            lista.add(m);
        }
        return lista;
    }
    public Menu listar(int id) throws Exception{
        Menu m = new Menu();
        String sql = "SELECT * FROM menu WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
        }
        return m;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM menu WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }
    public void alterar(Menu m) throws Exception{
        String sql = "UPDATE menu set titulo=?, link=?, icone=? WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, m.getTitulo());
        pst.setString(2, m.getLink());
        pst.setString(3, m.getIcone());
        pst.setInt(4, m.getId());
        pst.execute();
    }
    
}
