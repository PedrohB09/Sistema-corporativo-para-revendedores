/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.DAO;
import model.Produtos;
import java.sql.*;
import config.ConectaBanco;
/**
 *
 * @author pedro, nathalye, geovanna e guilherme
 */
public class ProdutosDAO {
    
    public boolean cadastrar(Produtos p_prod) throws ClassNotFoundException{
        //INSERT INTO produtos (nome, descricao, qtd, preco) values('sovado', 'pão sovado', 5, 4.50)
        Connection conexao = null;
        
        try{
            conexao = ConectaBanco.conectar();//abre conexao
            String sql = "INSERT INTO produtos (nome, descricao, qtd, preco) VALUES(?, ?, ?, ?)";
            
            PreparedStatement pstm = conexao.prepareStatement(sql);
            pstm.setString(1, p_prod.getNome_prod());
            pstm.setString(2, p_prod.getDescricao());
            pstm.setInt(3, p_prod.getQuantidade());
            pstm.setFloat(4, p_prod.getPreco());
            pstm.executeUpdate();
            pstm.close();//fecha conexao
            
            return true;
        }
        catch(SQLException ex) {
            System.out.println("Erro - SQL: " + ex);
            
            return false;
        }        
    }
    
    public Produtos consultarNome(String p_nome_prd) throws ClassNotFoundException{
        //SELECT * FROM produtos WHERE pk_id = 1;
        Connection conexao=null;
        
        try{
            conexao = ConectaBanco.conectar();//abre conexao
            String sql = "SELECT * FROM produtos WHERE nome = ?";
            
            PreparedStatement pstm = conexao.prepareStatement(sql);
            pstm.setString(1, p_nome_prd);
            ResultSet rs = pstm.executeQuery();
            
            Produtos prod = new Produtos();
            if (rs.next()){
                prod.setId(Integer.parseInt(rs.getString("pk_id")));
                prod.setNome_prod(rs.getString("nome"));
                prod.setDescricao(rs.getString("descricao"));
                prod.setPreco(Float.parseFloat(rs.getString("preco")));
                prod.setQuantidade(Integer.parseInt(rs.getString("qtd")));
            }
            
            pstm.close();
            return prod;
        }
        catch(SQLException ex){
            System.out.println("Erro - SQL: " + ex);            
            return null;
        }
    }         
    
    
    public Produtos consultarId(int p_id) throws ClassNotFoundException{
        //SELECT * FROM produtos WHERE pk_id = 1;
        Connection conexao=null;
        
        try{
            conexao = ConectaBanco.conectar();//abre conexao
            String sql = "SELECT * FROM produtos WHERE pk_id = ?";
            
            PreparedStatement pstm = conexao.prepareStatement(sql);
            pstm.setInt(1, p_id);
            ResultSet rs = pstm.executeQuery();
            
            Produtos prod = new Produtos();
            if (rs.next()){
                prod.setId(Integer.parseInt(rs.getString("pk_id")));
                prod.setNome_prod(rs.getString("nome"));
                prod.setDescricao(rs.getString("descricao"));
                prod.setPreco(Float.parseFloat(rs.getString("preco")));
                prod.setQuantidade(Integer.parseInt(rs.getString("qtd")));
            }
            
            pstm.close();
            return prod;
        }
        catch(SQLException ex){
            System.out.println("Erro - SQL: " + ex);            
            return null;
        }
    }         
    
    public boolean excluir(int p_id) throws ClassNotFoundException{
        //DELETE FROM produtos WHERE nome = sovado
        Connection conexao=null;
        
        try{
            conexao = ConectaBanco.conectar();//abre conexao
            String sql = "DELETE FROM produtos WHERE pk_id = ?";
            
            PreparedStatement pstm = conexao.prepareStatement(sql);
            pstm.setInt(1, p_id);
            int result = pstm.executeUpdate();
            pstm.close();
            
            if (result==1) {
                return true;
            }else{
                return false;
            }
        }
        catch(SQLException ex){
            System.out.println("Erro - SQL: " + ex);
            
            return false;
        }
    }
    
    public boolean alterar(Produtos p_prod) throws ClassNotFoundException{
        //UPDATE produtos SET nome='Forma', descricao='Pão de forma', preco=5, qtd=50 WHERE pk_id=2;
        Connection conexao=null;
        
        try{
            conexao = ConectaBanco.conectar();//abre conexao
            String sql = "UPDATE produtos SET nome=?, descricao=?, preco=?, qtd=? WHERE pk_id=?;";
            
            PreparedStatement pstm = conexao.prepareStatement(sql);
            pstm.setString(1, p_prod.getNome_prod());
            pstm.setString(2, p_prod.getDescricao());
            pstm.setFloat(3, p_prod.getPreco());
            pstm.setInt(4, p_prod.getQuantidade());
            pstm.executeUpdate();
            pstm.close();
            
            return true;
        }
        catch(SQLException ex){
            System.out.println("Erro - SQL: " + ex);
            
           return false;
        }
    }
}
