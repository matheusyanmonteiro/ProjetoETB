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
public class GastosDAO extends DataBaseDAO {
     public void inserir(Gastos g) throws Exception{
        String sql = "INSERT INTO gastos (descricao,valor,usuario_id) VALUES(?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, g.getDescricao());
        pst.setDouble(2, g.getValor());
        pst.setInt(3, g.getUsuario().getId());
        pst.execute();
    }
    public ArrayList<Gastos> listar() throws Exception{
        ArrayList<Gastos> lista = new ArrayList<Gastos>();
        String sql = "SELECT * FROM gastos";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Gastos g = new Gastos();
            g.setId(rs.getInt("id"));
          
            g.setDescricao(rs.getString("descricao"));
            g.setValor(rs.getDouble("valor"));
            
            UsuarioDAO uDAO = new UsuarioDAO();
            uDAO.conectar();
            g.setUsuario(uDAO.listar(rs.getInt("usuario_id")));
            uDAO.desconectar();

            
            lista.add(g);
        }
        return lista;
    }
    public Gastos listar(int id) throws Exception{
        Gastos g = new Gastos();
        String sql = "SELECT * FROM gastos WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
           g.setId(rs.getInt("id"));
          
            g.setDescricao(rs.getString("descricao"));
            g.setValor(rs.getDouble("valor"));
            
            UsuarioDAO uDAO = new UsuarioDAO();
            uDAO.conectar();
            g.setUsuario(uDAO.listar(rs.getInt("usuario_id")));
            uDAO.desconectar();
        }
        return g;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM gastos WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }
    public void alterar(Gastos g) throws Exception{
        String sql = "UPDATE gastos set descricao=?,valor=? ,usuario_id=? WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
      pst.setString(1, g.getDescricao());
        pst.setDouble(2, g.getValor());
        pst.setInt(3, g.getUsuario().getId());
        pst.setInt(4, g.getId());
        pst.execute();
    }
    
}
