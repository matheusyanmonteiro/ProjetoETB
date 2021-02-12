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
public class PagamentoDAO extends DataBaseDAO {
    public void inserir(Pagamento p) throws Exception{
        String sql = "INSERT INTO pagamento (divisao,quantidadeParcela,desconto,eventos_id) VALUES(?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, p.getDivisao());
        pst.setInt(2, p.getQuantidadeParcela());
        pst.setDouble(3, p.getDesconto());
        pst.setInt(4, p.getEventos().getId());
        pst.execute();
    }
    public ArrayList<Pagamento> listar() throws Exception{
        ArrayList<Pagamento> lista = new ArrayList<Pagamento>();
        String sql = "SELECT * FROM pagamento";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Pagamento p = new Pagamento();
            p.setId(rs.getInt("id"));
            p.setDivisao(rs.getInt("divisao"));
            p.setQuantidadeParcela(rs.getInt("quantidadeParcela"));
            p.setDesconto(rs.getDouble("desconto"));
            
            EventosDAO eDAO = new EventosDAO();
            eDAO.conectar();
            p.setEventos(eDAO.listar(rs.getInt("eventos_id")));
            eDAO.desconectar();

            
            lista.add(p);
        }
        return lista;
    }
    public Pagamento listar(int id) throws Exception{
        Pagamento p = new Pagamento();
        String sql = "SELECT * FROM pagamento WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
          p.setId(rs.getInt("id"));
            p.setDivisao(rs.getInt("divisao"));
            p.setQuantidadeParcela(rs.getInt("quantidadeParcela"));
            p.setDesconto(rs.getDouble("desconto"));
            
            EventosDAO eDAO = new EventosDAO();
            eDAO.conectar();
            p.setEventos(eDAO.listar(rs.getInt("eventos_id")));
            eDAO.desconectar();
        }
        return p;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM pagamento WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
    }
    public void alterar(Pagamento p) throws Exception{
        String sql = "UPDATE pagamento set divisao=? ,quantidadeParcela=? ,desconto=? WHERE id=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, p.getDivisao());
        pst.setInt(2, p.getQuantidadeParcela());
        pst.setDouble(3, p.getDesconto());
        pst.setInt(4, p.getId());
        pst.execute();
    }
    
   public void PagarParcela(Pagamento p) throws Exception{
        String sql = "UPDATE pagamento SET quantidadeParcela = ? WHERE pagamento.id = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, p.getQuantidadeParcela());
        pst.setInt(2, p.getId());
        pst.execute();
    }
    
    
}
