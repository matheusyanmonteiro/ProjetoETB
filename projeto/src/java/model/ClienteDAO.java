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
public class ClienteDAO extends DataBaseDAO {
       public void inserir(Cliente c) throws Exception{
        String sql = "INSERT INTO cliente (nome,rg,dataDeNascimento,cpf,endereco,cep,telefone,email,telefoneEmergencial) VALUES(?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
         pst.setString(1, c.getNome());
         pst.setString(2, c.getRg());
         pst.setString(3, c.getDataDeNascimento());
         pst.setString(4, c.getCpf());
         pst.setString(5, c.getEndereco());
         pst.setString(6, c.getCep());
         pst.setString(7, c.getTelefone());
         pst.setString(8, c.getEmail());
         pst.setString(9, c.getTelefoneEmergencial());
         
        pst.execute();
    }
    public ArrayList<Cliente> listar() throws Exception{
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setRg(rs.getString("rg"));
            c.setDataDeNascimento(rs.getString("dataDeNascimento"));
            c.setCpf(rs.getString("cpf"));
            c.setEndereco(rs.getString("endereco"));
            c.setCep(rs.getString("cep"));
            c.setTelefone(rs.getString("telefone"));
            c.setEmail(rs.getString("email"));
            c.setTelefoneEmergencial(rs.getString("telefoneEmergencial"));
            
            
            lista.add(c);
        }
        return lista;
    }
    public Cliente listar(int id) throws Exception{
        Cliente c= new Cliente();
        String sql = "SELECT * FROM cliente WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
             c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setRg(rs.getString("rg"));
            c.setDataDeNascimento(rs.getString("dataDeNascimento"));
            c.setCpf(rs.getString("cpf"));
            c.setEndereco(rs.getString("endereco"));
            c.setCep(rs.getString("cep"));
            c.setTelefone(rs.getString("telefone"));
            c.setEmail(rs.getString("email"));
            c.setTelefoneEmergencial(rs.getString("telefoneEmergencial"));
        }
        return c;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM cliente WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }
    public void alterar(Cliente c) throws Exception{
        String sql = "UPDATE cliente set nome = ?,rg = ? ,dataDeNascimento = ? ,cpf = ?,endereco = ?,cep = ?,telefone = ?,email = ? ,telefoneEmergencial = ? WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
         pst.setString(1, c.getNome());
         pst.setString(2, c.getRg());
         pst.setString(3, c.getDataDeNascimento());
         pst.setString(4, c.getCpf());
         pst.setString(5, c.getEndereco());
         pst.setString(6, c.getCep());
         pst.setString(7, c.getTelefone());
         pst.setString(8, c.getEmail());
         pst.setString(9, c.getTelefoneEmergencial());
        pst.setInt(10, c.getId());
        pst.execute();
    }
    public ArrayList<Cliente> listar2() throws Exception{
        ArrayList<Cliente> lista2 = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setRg(rs.getString("rg"));
            c.setDataDeNascimento(rs.getString("dataDeNascimento"));
            c.setCpf(rs.getString("cpf"));
            c.setEndereco(rs.getString("endereco"));
            c.setCep(rs.getString("cep"));
            c.setTelefone(rs.getString("telefone"));
            c.setEmail(rs.getString("email"));
            c.setTelefoneEmergencial(rs.getString("telefoneEmergencial"));
            
            
            lista2.add(c);
        }
        return lista2;
    }
}
