/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;


/**
 *
 * @author Matheus
 */

public class Eventos {
    private int id;
    private String tema;
    private int quantidadeDeConvidados;
    private String horario;
    private double valor;
    private String situacao;
    private String data;
    private Buffet buffet;
    private Cliente cliente;
    private Salao salao;
    private Usuario usuario;
    private ArrayList<Item> itens;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public int getQuantidadeDeConvidados() {
        return quantidadeDeConvidados;
    }

    public void setQuantidadeDeConvidados(int quantidadeDeConvidados) {
        this.quantidadeDeConvidados = quantidadeDeConvidados;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Buffet getBuffet() {
        return buffet;
    }

    public void setBuffet(Buffet buffet) {
        this.buffet = buffet;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Salao getSalao() {
        return salao;
    }

    public void setSalao(Salao salao) {
        this.salao = salao;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    

    public double totalBuffet(){
        return Buffet.preco*quantidadeDeConvidados; 
    }
    
       public double totalFesta(){
         Item i = new Item();
          return totalBuffet()+  getSalao().getValorAluguel()                                                 + i.getValorAluguel()+ getValor();
      }

    public ArrayList<Item> getItens() {
        return itens;
    }

    public void setItens(ArrayList<Item> itens) {
        this.itens = itens;
    }


    
}
