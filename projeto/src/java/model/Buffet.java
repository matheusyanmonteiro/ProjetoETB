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
public class Buffet {
    private int id;
    private String nome;
    protected static double preco;
    private String tipo;
    private int quantidadeComida;
    private int quantidadeBebida;
    private int tamanhoBolo;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getQuantidadeComida() {
        return quantidadeComida;
    }

    public void setQuantidadeComida(int quantidadeComida) {
        this.quantidadeComida = quantidadeComida;
    }

    public int getQuantidadeBebida() {
        return quantidadeBebida;
    }

    public void setQuantidadeBebida(int quantidadeBebida) {
        this.quantidadeBebida = quantidadeBebida;
    }

    public int getTamanhoBolo() {
        return tamanhoBolo;
    }

    public void setTamanhoBolo(int tamanhoBolo) {
        this.tamanhoBolo = tamanhoBolo;
    }

   
    
}
