/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Matheus
 */
public class Gastos {
    private int id;
    private String descricao;
    private double valor;
    private Usuario usuario;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
  
  /**  
      public double gastoTotalEmpresa(){
      return getUsuario().EfetuaPagamento()+ getValor();
   }
     public double GastosTotal(){
         return gastoTotalEmpresa()+ getEventos().totalFesta();
     }
**/

    
    
    
}
