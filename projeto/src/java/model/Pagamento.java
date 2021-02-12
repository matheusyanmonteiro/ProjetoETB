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
public class Pagamento {
    private int id;
    private double desconto;
    private int divisao ;
    private int quantidadeParcela = divisao;
    private Eventos eventos;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getDesconto() {
        return desconto;
    }

    public void setDesconto(double desconto) {
        this.desconto = desconto;
    }

    public int getQuantidadeParcela() {
        return quantidadeParcela;
    }

    public void setQuantidadeParcela(int quantidadeParcela) {
        this.quantidadeParcela = quantidadeParcela;
    }

    public int getDivisao() {
        return divisao;
    }

    public void setDivisao(int divisao) {
        this.divisao = divisao;
    }

    public Eventos getEventos() {
        return eventos;
    }

    public void setEventos(Eventos eventos) {
        this.eventos = eventos;
    }

 
    public double ValorParcela(){
        return getEventos().totalFesta()/getDivisao();
    }
    public int PagarParcela(){
        return getQuantidadeParcela()-1;
    }
    public  double pagamentoTotal(){
        return getEventos().totalFesta() - getDesconto() ;
    }

   public double restoApagar(){
      return ValorParcela() * quantidadeParcela;
   }

    
}
