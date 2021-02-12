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
public class UsuarioDAO extends DataBaseDAO {
    public void inserir(Usuario u) throws Exception{
        String sql = "INSERT INTO usuario (nome,idade,telefone,email,cpf,salario,rg,endereco,cep,dataDeNascimento,carteiraDeTrabalho,login,senha,perfil_id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, u.getNome());
        pst.setInt(2, u.getIdade());
        pst.setString(3, u.getTelefone());
        pst.setString(4, u.getEmail());
        pst.setString(5, u.getCpf());
        pst.setDouble(6, u.getSalario());
        pst.setString(7, u.getRg());
        pst.setString(8, u.getEndereco());
        pst.setString(9, u.getCep());
        pst.setString(10, u.getDataDeNascimento());
        pst.setInt(11, u.getCarteiraDeTrabalho());

        pst.setString(12, u.getLogin());
        pst.setString(13, u.getSenha());
        pst.setInt(14, u.getPerfil().getId());
        pst.execute();
    }
    public ArrayList<Usuario> listar() throws Exception{
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        String sql = "SELECT * FROM usuario";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setIdade(rs.getInt("idade"));
            u.setTelefone(rs.getString("telefone"));
            u.setEmail(rs.getString("email"));
            u.setCpf(rs.getString("cpf"));
            u.setSalario(rs.getDouble("salario"));
            u.setRg(rs.getString("rg"));
            u.setEndereco(rs.getString("endereco"));
            u.setCep(rs.getString("cep"));
            u.setDataDeNascimento(rs.getString("dataDeNascimento"));
            u.setCarteiraDeTrabalho(rs.getInt("carteiraDeTrabalho"));
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
           

            PerfilDAO pDAO = new PerfilDAO();
            pDAO.conectar();
            u.setPerfil(pDAO.listar(rs.getInt("perfil_id")));
            pDAO.desconectar();
            
            lista.add(u);
        }
        return lista;
    }
    public Usuario listar(int id) throws Exception{
        Usuario u = new Usuario();
        String sql = "SELECT * FROM usuario WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
           u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setIdade(rs.getInt("idade"));
            u.setTelefone(rs.getString("telefone"));
            u.setEmail(rs.getString("email"));
           
            u.setCpf(rs.getString("cpf"));
            u.setSalario(rs.getDouble("salario"));
            u.setRg(rs.getString("rg"));
            u.setEndereco(rs.getString("endereco"));
            u.setCep(rs.getString("cep"));
            u.setDataDeNascimento(rs.getString("dataDeNascimento"));
            u.setCarteiraDeTrabalho(rs.getInt("carteiraDeTrabalho"));
          
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
           

         
            PerfilDAO pDAO = new PerfilDAO();
            pDAO.conectar();
            u.setPerfil(pDAO.listar(rs.getInt("perfil_id")));
            pDAO.desconectar();
        }
        return u;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM usuario WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }
    public void alterar(Usuario u) throws Exception{
        String sql = "UPDATE usuario set nome=?,idade=?,telefone=?,email=?,cpf=?,salario=?,rg=?,endereco=?,cep=?,dataDeNascimento=?,carteiraDeTrabalho=?,login=?,senha=?,perfil_id=? WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, u.getNome());
        pst.setInt(2, u.getIdade());
        pst.setString(3, u.getTelefone());
        pst.setString(4, u.getEmail());
        pst.setString(5, u.getCpf());
        pst.setDouble(6, u.getSalario());
        pst.setString(7, u.getRg());
        pst.setString(8, u.getEndereco());
        pst.setString(9, u.getCep());
        pst.setString(10, u.getDataDeNascimento());
        pst.setInt(11, u.getCarteiraDeTrabalho());

        pst.setString(12, u.getLogin());
        pst.setString(13, u.getSenha());
        pst.setInt(14, u.getPerfil().getId());
        pst.setInt(15, u.getId());
        pst.execute();
    }
     public boolean loginExiste(String login) throws Exception{
        String sql = "SELECT * FROM usuario WHERE UPPER(login)=UPPER(?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, login);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            return true;
        }
        return false;
    }
    public boolean loginExiste(String login,int id) throws Exception{
        String sql = "SELECT * FROM usuario WHERE UPPER(login)=UPPER(?) AND id<>?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, login);
        pst.setInt(2, id);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            return true;
        }
        return false;
    }
    
    public Usuario validarLogin(String login,String senha) throws Exception{
        Usuario u = new Usuario();
        String sql = "SELECT * FROM usuario WHERE login=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, login);
        
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            if(rs.getString("senha").equals(senha)){
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setLogin(rs.getString("login"));
                u.setSenha(rs.getString("senha"));

                PerfilDAO pDAO = new PerfilDAO();
                pDAO.conectar();
                u.setPerfil(pDAO.listar(rs.getInt("perfil_id")));
                pDAO.desconectar();
            }
        }
        return u;
    }
    
    public ArrayList<Usuario> listar3() throws Exception{
        ArrayList<Usuario> lista3 = new ArrayList<Usuario>();
        String sql = "SELECT * FROM usuario";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setIdade(rs.getInt("idade"));
            u.setTelefone(rs.getString("telefone"));
            u.setEmail(rs.getString("email"));      
            u.setCpf(rs.getString("cpf"));
            u.setRg(rs.getString("rg"));
            u.setEndereco(rs.getString("endereco"));
            u.setCep(rs.getString("cep"));
            u.setCarteiraDeTrabalho(rs.getInt("carteiraDeTrabalho"));
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
            

            PerfilDAO pDAO = new PerfilDAO();
            pDAO.conectar();
            u.setPerfil(pDAO.listar(rs.getInt("perfil_id")));
            pDAO.desconectar();
            
            lista3.add(u);
        }
        return lista3;
    }
    
}
