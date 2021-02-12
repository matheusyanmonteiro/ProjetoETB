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
public class EventosDAO extends DataBaseDAO {
    public void inserir(Eventos e) throws Exception {
        String sql = "INSERT INTO eventos (tema,quantidadeDeConvidados,horario,valor,situacao,data,buffet_id,cliente_id,salao_id,usuario_id) VALUES(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, e.getTema());
        pst.setInt(2, e.getQuantidadeDeConvidados());
        pst.setString(3, e.getHorario());
        pst.setDouble(4, e.getValor());
        pst.setString(5, e.getSituacao());
        pst.setString(6, e.getData());
        pst.setInt(7, e.getBuffet().getId());
        pst.setInt(8, e.getCliente().getId());
        pst.setInt(9, e.getSalao().getId());
        pst.setInt(10, e.getUsuario().getId());

        pst.execute();
    }
    public ArrayList<Eventos> listar() throws Exception{
        ArrayList<Eventos> lista = new ArrayList<Eventos>();
        String sql = "SELECT * FROM eventos";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Eventos e = new Eventos();
            e.setId(rs.getInt("id"));
            e.setTema(rs.getString("tema"));
            e.setQuantidadeDeConvidados(rs.getInt("quantidadeDeConvidados"));
            e.setHorario(rs.getString("horario"));
            e.setValor(rs.getDouble("valor"));
            e.setSituacao(rs.getString("situacao"));
            e.setData(rs.getString("data"));
            
            BuffetDAO bDAO = new BuffetDAO();
            bDAO.conectar();
            e.setBuffet(bDAO.listar(rs.getInt("buffet_id")));
            bDAO.desconectar();
            
            ClienteDAO cDAO = new ClienteDAO();
            cDAO.conectar();
            e.setCliente(cDAO.listar(rs.getInt("cliente_id")));
            cDAO.desconectar();
            
            SalaoDAO sDAO = new SalaoDAO();
            sDAO.conectar();
            e.setSalao(sDAO.listar(rs.getInt("salao_id")));
            sDAO.desconectar();
            
            UsuarioDAO uDAO = new UsuarioDAO();
            uDAO.conectar();
            e.setUsuario(uDAO.listar(rs.getInt("usuario_id")));
            uDAO.desconectar();
            
          
            
            
            
            lista.add(e);
        }
        return lista;
    }
    public Eventos listar(int id) throws Exception{
        Eventos e= new Eventos();
        String sql = "SELECT * FROM eventos WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
             e.setId(rs.getInt("id"));
            e.setTema(rs.getString("tema"));
            e.setQuantidadeDeConvidados(rs.getInt("quantidadeDeConvidados"));
            e.setHorario(rs.getString("horario"));
            e.setValor(rs.getDouble("valor"));
            e.setSituacao(rs.getString("situacao"));
            e.setData(rs.getString("data"));
            
            BuffetDAO bDAO = new BuffetDAO();
            bDAO.conectar();
            e.setBuffet(bDAO.listar(rs.getInt("buffet_id")));
            bDAO.desconectar();
            
            ClienteDAO cDAO = new ClienteDAO();
            cDAO.conectar();
            e.setCliente(cDAO.listar(rs.getInt("cliente_id")));
            cDAO.desconectar();
            
            SalaoDAO sDAO = new SalaoDAO();
            sDAO.conectar();
            e.setSalao(sDAO.listar(rs.getInt("salao_id")));
            sDAO.desconectar();
            
            UsuarioDAO uDAO = new UsuarioDAO();
            uDAO.conectar();
            e.setUsuario(uDAO.listar(rs.getInt("usuario_id")));
            uDAO.desconectar();
        }
        return e;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM eventos WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }
    public void alterar(Eventos e) throws Exception{
        String sql = "UPDATE eventos set tema=?, quantidadeDeConvidados=?, horario=?, valor=?, situacao=?, data=? WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, e.getTema());
        pst.setInt(2, e.getQuantidadeDeConvidados());
        pst.setString(3, e.getHorario());
        pst.setDouble(4, e.getValor());
        pst.setString(5, e.getSituacao());
        pst.setString(6, e.getData());
       
        pst.setInt(7, e.getId());
        pst.execute();
    }
    public ArrayList<Eventos> listarAgendado() throws Exception{
        ArrayList<Eventos> lista = new ArrayList<Eventos>();
        String sql = "SELECT * FROM eventos where situacao='agendado'";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Eventos e = new Eventos();
            e.setId(rs.getInt("id"));
            e.setTema(rs.getString("tema"));
            e.setQuantidadeDeConvidados(rs.getInt("quantidadeDeConvidados"));
            e.setHorario(rs.getString("horario"));
            e.setValor(rs.getDouble("valor"));
            e.setSituacao(rs.getString("situacao"));
            e.setData(rs.getString("data"));
            
            BuffetDAO bDAO = new BuffetDAO();
            bDAO.conectar();
            e.setBuffet(bDAO.listar(rs.getInt("buffet_id")));
            bDAO.desconectar();
            
            ClienteDAO cDAO = new ClienteDAO();
            cDAO.conectar();
            e.setCliente(cDAO.listar(rs.getInt("cliente_id")));
            cDAO.desconectar();
            
            SalaoDAO sDAO = new SalaoDAO();
            sDAO.conectar();
            e.setSalao(sDAO.listar(rs.getInt("salao_id")));
            sDAO.desconectar();
            
            UsuarioDAO uDAO = new UsuarioDAO();
            uDAO.conectar();
            e.setUsuario(uDAO.listar(rs.getInt("usuario_id")));
            uDAO.desconectar();
            
          
            
            
            
            lista.add(e);
        }
        return lista;
    }
    
    public ArrayList<Item> itensVinculados(int eventos_id) throws Exception{
        ArrayList<Item> lista = new ArrayList<Item>();
        String sql= "select i.* FROM item as i, eventos_item as ei WHERE i.id = ei. eventos_item AND ei.eventos_id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        pst.setInt(1, eventos_id);
        while (rs.next()){
            Item i = new Item();
            i.setId(rs.getInt("id"));
            i.setNome(rs.getString("nome"));
            i.setValorAluguel(rs.getDouble("valorAluguel"));
            
            lista.add(i);
        }
        return lista;
    }
    public ArrayList<Item> itensNaoVinculados(int eventos_id) throws Exception{
           ArrayList<Item> lista = new ArrayList<Item>();
           String sql = "select * FROM item WHERE id NOT IN (SELECT i.id FROM item as i, eventos_item as ei WHERE i.id = ei.item_id AND ei.eventos = ?)";
           PreparedStatement pst = conn.prepareStatement(sql);
           pst.setInt(1,eventos_id);
           ResultSet rs = pst.executeQuery();
           while (rs.next()){
              Item i = new Item();
              i.setId(rs.getInt("id"));
              i.setNome(rs.getString("nome"));
              i.setValorAluguel(rs.getDouble("valorAluguel"));
              
              lista.add(i);
           }
          return lista;
    }
    
    public void vincularItem(int item_id, int eventos_id) throws Exception{
        String sql = "INSERT INTO eventos_item (item_id,eventos_id) VALUES(?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, item_id);
        pst.setInt(1, eventos_id);
        pst.execute();
    }
    public void desvincularItem(int item_id, int eventos_id) throws Exception{
        String sql = "DELETE FROM eventos_item WHERE item_id=? AND eventos_id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, item_id);
        pst.setInt(2, eventos_id);
        pst.execute();
    }
    public ArrayList<Item> LisaItensVinculados(int id) throws Exception{
        ArrayList<Item> lista = new ArrayList<Item>();
        String sql = "SELECT i.* FROM item as i, eventos_item as ei WHERE i.id = ei.item_id AND ei.evento_id=?";
         PreparedStatement pst = conn.prepareStatement(sql);
           pst.setInt(1,id);
           ResultSet rs = pst.executeQuery();
           while (rs.next()){
              Item i = new Item();
              i.setId(rs.getInt("id"));
              i.setNome(rs.getString("nome"));
              i.setValorAluguel(rs.getDouble("valorAluguel"));
              
              lista.add(i);
           }
          return lista;
    }
    
}
