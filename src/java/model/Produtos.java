/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pedro, nathalye, geovanna e guilherme
 */
public class Produtos {
    
    private int id;
    private String nome_prod;
    private String descricao;
    private float preco;
    private int quantidade;
    
    

    //métodos construtores
    public Produtos(){
    }
    
    public Produtos(int id, String nome_prod,  String descricao, float preco, int quantidade){
        this.id = id;
        this.nome_prod = nome_prod;
        this.descricao = descricao;
        this.preco = preco;
        this.quantidade = quantidade;

    }

    
    public int getId() {
        return id;
    }

    public String getNome_prod() {
        return nome_prod;
    }

    public String getDescricao() {
        return descricao;
    }

    public float getPreco() {
        return preco;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome_prod(String nome_prod) {
        this.nome_prod = nome_prod;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public String getStatus() {
        if (this.quantidade > 0) {
            return "Disponível";
        }else{
            return "Indisponível";
        }
    }
    
}
