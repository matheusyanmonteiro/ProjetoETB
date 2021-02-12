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
public class BuffetDAO extends DataBaseDAO {
     public void inserir(Buffet b) throws Exception {
        String sql = "INSERT INTO buffet (nome, preco, tipo, quantidadeComida, quantidadeBebida, tamanhoBolo,) VALUES(?,?,?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, b.getNome());
        pst.setDouble(2, b.getPreco());
        pst.setString(3, b.getTipo());
        pst.setInt(4, b.getQuantidadeComida());
        pst.setInt(5, b.getQuantidadeBebida());
        pst.setInt(6, b.getTamanhoBolo());

        pst.execute();
    }

    public ArrayList<Buffet> listar() throws Exception {
        ArrayList<Buffet> lista = new ArrayList<Buffet>();
        String sql = "SELECT * FROM buffet";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Buffet b = new Buffet();
            b.setId(rs.getInt("id"));
            b.setNome(rs.getString("nome"));
            b.setPreco(rs.getDouble("preco"));
            b.setTipo(rs.getString("tipo"));
            b.setQuantidadeComida(rs.getInt("quantidadeComida"));
            b.setQuantidadeBebida(rs.getInt("quantidadeBebida"));
            b.setTamanhoBolo(rs.getInt("tamanhoBolo"));

            lista.add(b);
        }
        return lista;
    }

    public Buffet listar(int id) throws Exception {
        Buffet b = new Buffet();
        String sql = "SELECT * FROM buffet WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);

        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            b.setId(rs.getInt("id"));
            b.setNome(rs.getString("nome"));
            b.setPreco(rs.getDouble("preco"));
            b.setTipo(rs.getString("tipo"));
            b.setQuantidadeComida(rs.getInt("quantidadeComida"));
            b.setQuantidadeBebida(rs.getInt("quantidadeBebida"));
            b.setTamanhoBolo(rs.getInt("tamanhoBolo"));
        }
        return b;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM buffet WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }

    public void alterar(Buffet b) throws Exception {
        String sql = "UPDATE buffet set nome = ?, preco = ?, tipo = ?, quantidadeComida = ?, quantidadeBebida = ?, tamanhoBolo = ?, WHERE id=? ";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, b.getNome());
        pst.setDouble(2, b.getPreco());
        pst.setString(3, b.getTipo());
        pst.setInt(4, b.getQuantidadeComida());
        pst.setInt(5, b.getQuantidadeBebida());
        pst.setInt(6, b.getTamanhoBolo());
        pst.setInt(7, b.getId());
        pst.execute();
    }

    
}
