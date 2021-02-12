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
public class PerfilDAO extends DataBaseDAO {
     public void inserir(Perfil p) throws Exception{
        String sql = "INSERT INTO perfil (perfil) VALUES(?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, p.getPerfil());
        pst.execute();
    }
    public ArrayList<Perfil> listar() throws Exception{
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        String sql = "SELECT * FROM perfil";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setPerfil(rs.getString("perfil"));
            
            lista.add(p);
        }
        return lista;
    }
    public Perfil listar(int id) throws Exception{
        Perfil p = new Perfil();
        String sql = "SELECT * FROM perfil WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setPerfil(rs.getString("perfil"));
        }
        return p;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM perfil WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }
    public void alterar(Perfil p) throws Exception{
        String sql = "UPDATE perfil set perfil=? WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, p.getPerfil());
        pst.setInt(2, p.getId());
        pst.execute();
    }
    
     public ArrayList<Menu> menusVinculados(int perfil_id) throws Exception{
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT m.* FROM menu as m, menu_perfil as mp WHERE m.id = mp.menu_id AND mp.perfil_id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, perfil_id);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setIcone(rs.getString("icone"));
            m.setLink(rs.getString("link"));
            
            lista.add(m);
        }
        return lista;
    }
    
    public ArrayList<Menu> menusNaoVinculados(int perfil_id) throws Exception{
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu WHERE id NOT IN(SELECT m.id FROM menu as m, menu_perfil as mp WHERE m.id = mp.menu_id AND mp.perfil_id=?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, perfil_id);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setIcone(rs.getString("icone"));
            m.setLink(rs.getString("link"));
            
            lista.add(m);
        }
        return lista;
    }
    
    public void vincularMenu(int menu_id, int perfil_id) throws Exception{
        String sql = "INSERT INTO menu_perfil (menu_id,perfil_id) VALUES(?,?) ";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, menu_id);
        pst.setInt(2, perfil_id);
        pst.execute();
    }
    
    public void desvincularMenu(int menu_id, int perfil_id) throws Exception{
        String sql = "DELETE FROM menu_perfil WHERE menu_id=? AND perfil_id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, menu_id);
        pst.setInt(2, perfil_id);
        pst.execute();
    }
    
    public ArrayList<Menu> LitstaMenusVinculados(int id) throws Exception{
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT m.* FROM menu as m, menu_perfil as mp WHERE m.id = mp.menu_id AND mp.perfil_id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setIcone(rs.getString("icone"));
            m.setLink(rs.getString("link"));
            
            lista.add(m);
        }
        return lista;
    }
    
    
    
    
}
