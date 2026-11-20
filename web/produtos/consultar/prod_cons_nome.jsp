<%-- 
    Document   : prod_cons_nome
    Created on : 22 de nov. de 2026, 15:54:21
    Author     : pedro, nathalye, geovanna e guilherme
--%>

<%@page import="model.Produtos"%>
<%@page import="model.DAO.ProdutosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web App DELL</title>
    </head>
    <body>
        <h2>Controle de Produtos (CRTL) - Consultar Nome</h2>
        <%
            request.setCharacterEncoding("UTF-8"); //Encoding "UTF-8"
            
            // Entrada
            String nome = request.getParameter("prod_nome");

            //Consultar Id
            ProdutosDAO prodDAO = new ProdutosDAO();

            // Instância obj. 
            Produtos prod = new Produtos();      
            prod = prodDAO.consultarNome(nome);
                               
            if (prod.getId()==0){
                out.println("<br> <b>Produto Não encontrado!!!</b> ");
            }else{
                out.println("<br> Produto Localizado! ");                       
            // Saída / Processamento
            out.println("<br> <b>Identificador.....:</b> " + prod.getId());
            out.println("<br> <b>Nome do Produto...:</b> " + prod.getNome_prod());
            out.println("<br> <b>Valor do Produto..:</b> " + prod.getPreco());
            out.println("<br> <b>Quantidade........:</b> " + prod.getQuantidade());
            out.println("<br> <b>Status............:</b> " + prod.getStatus());
            out.println("<br><br> <b>Valor Total.......:</b> " + (prod.getPreco() * prod.getQuantidade()) );            
            }
        %>
    </body>
</html>
