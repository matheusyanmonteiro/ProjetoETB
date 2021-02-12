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
public class ItemDAO extends DataBaseDAO {
    public void inserir(Item i) throws Exception {
        String sql = "INSERT INTO item (nome,valorAluguel) VALUES(?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, i.getNome());
        pst.setDouble(2, i.getValorAluguel());
        pst.execute();
    }

    public ArrayList<Item> listar() throws Exception {
        ArrayList<Item> lista = new ArrayList<Item>();
        String sql = "SELECT * FROM item";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Item i = new Item();
            i.setId(rs.getInt("id"));
            i.setNome(rs.getString("nome"));
            i.setValorAluguel(rs.getDouble("valorAluguel"));
           

            lista.add(i);
        }
        return lista;
    }

    public Item listar(int id) throws Exception {
        Item i = new Item();
        String sql = "SELECT * FROM item WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);

        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
           i.setId(rs.getInt("id"));
            i.setNome(rs.getString("nome"));
            i.setValorAluguel(rs.getDouble("valorAluguel"));
              

        }
        return i;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM item WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }

    public void alterar(Item i) throws Exception {
        String sql = "UPDATE item set nome=? ,valorAluguel=? WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
         pst.setString(1, i.getNome());
        pst.setDouble(2, i.getValorAluguel());;
        pst.setInt(3, i.getId());
        pst.execute();
    }
    
}
