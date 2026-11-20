<%-- 
    Document   : prod_alt
    Created on : 2 de set. de 2026, 21:03:29
    Author     : pedro, nathalye, geovanna, guilherme
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
        <h2>Controle de Produtos (CRTL) - Alterar</h2>
        <%
            request.setCharacterEncoding("UTF-8"); //Encoding "UTF-8"
        
            // Instância obj. / Entrada, origem: do form de alteração
            Produtos prod = new Produtos(
                    Integer.parseInt( request.getParameter("id")), 
                    request.getParameter("prod"), 
                    request.getParameter("desc"), 
                    Float.parseFloat( request.getParameter("prc") ), 
                    Integer.parseInt( request.getParameter("qtd")) );      
        
            //SALVAR - GRAVAR a alteração
            ProdutosDAO prodDAO = new ProdutosDAO();
            
            if (prodDAO.alterar(prod) == true){
                out.println("<br> <b>Produto alterado com sucesso!!!</b> ");
            }else{
                out.println("<br> <b>Produto NÃO alterado!</b> ");
            }
            
            // Saída / Processamento
            out.println("<br> <b>Identificador.....:</b> " + prod.getId());
            out.println("<br> <b>Nome do Produto...:</b> " + prod.getNome_prod());
            out.println("<br> <b>Valor do Produto..:</b> " + prod.getPreco());
            out.println("<br> <b>Quantidade........:</b> " + prod.getQuantidade());
            out.println("<br> <b>Status............:</b> " + prod.getStatus());
            out.println("<br><br> <b>Valor Total.......:</b> " + (prod.getPreco() * prod.getQuantidade()) );            
        %>
    </body>
</html>
