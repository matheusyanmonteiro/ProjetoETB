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
public class SalaoDAO extends DataBaseDAO{
     public void inserir(Salao s) throws Exception{
        String sql = "INSERT INTO salao (nome,valorAluguel,endereco) VALUES(?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1,s.getNome());
        pst.setDouble(2, s.getValorAluguel());
        pst.setString(3,s.getEndereco());
        pst.execute();
    }
    public ArrayList<Salao> listar() throws Exception{
        ArrayList<Salao> lista = new ArrayList<Salao>();
        String sql = "SELECT * FROM salao";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Salao s = new Salao();
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            s.setValorAluguel(rs.getDouble("valorAluguel"));
            s.setEndereco(rs.getString("endereco"));
            
            lista.add(s);
        }
        return lista;
    }
    public Salao listar(int id) throws Exception{
        Salao s = new Salao();
        String sql = "SELECT * FROM salao WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
             s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            s.setValorAluguel(rs.getDouble("valorAluguel"));
            s.setEndereco(rs.getString("endereco"));
        }
        return s;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM salao WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }
    public void alterar(Salao s) throws Exception{
        String sql = "UPDATE salao set nome=?,valorAluguel=?, endereco = ? WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
         pst.setString(1,s.getNome());
        pst.setDouble(2, s.getValorAluguel());
        pst.setString(3,s.getEndereco());
        pst.setInt(4, s.getId());
        pst.execute();
    }
    
    public ArrayList<Salao> listar1() throws Exception{
        ArrayList<Salao> lista1 = new ArrayList<Salao>();
        String sql = "SELECT * FROM salao";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Salao s = new Salao();
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            s.setValorAluguel(rs.getDouble("valorAluguel"));
            s.setEndereco(rs.getString("endereco"));
            
            lista1.add(s);
        }
        return lista1;
    }
    
}
