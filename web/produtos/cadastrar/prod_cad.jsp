<%-- 
    Document   : prod_cad
    Created on : 20 de nov. de 2026, 21:03:29
    Author     : pedro. geovanna, nathalye e guilherme
--%>

<%@page import="model.Produtos"%>
<%@page import="model.DAO.ProdutosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web App Kero-Kero</title>
        
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <link href="../style/geral.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
        <h2>Controle de Produtos (CRTL)</h2>
        <%
            request.setCharacterEncoding("UTF-8"); //Encoding "UTF-8"
        
            // Instância obj. / Entrada
            Produtos prod = new Produtos(
                    0, 
                    request.getParameter("prod"),
                    request.getParameter("desc"),
                    Float.parseFloat( request.getParameter("prc") ), 
                    Integer.parseInt( request.getParameter("qtd")) );      
        
            //SALVAR - GRAVAR
            ProdutosDAO prodDAO = new ProdutosDAO();
            
            if (prodDAO.cadastrar(prod) == true){
                out.println("<br> <b>Produto cadastrado com sucesso!!!</b> ");
            }else{
                out.println("<br> <b>Produto NÃO foi cadastrado!</b> ");
            }
            
            // Saída / Processamento
            out.println("<br> <b>Identificador.....:</b> " + prod.getId());
            out.println("<br> <b>Nome do Produto...:</b> " + prod.getNome_prod());
            out.println("<br> <b>Valor do Produto..:</b> " + prod.getPreco());
            out.println("<br> <b>Quantidade........:</b> " + prod.getQuantidade());
            out.println("<br> <b>Status............:</b> " + prod.getStatus());
            out.println("<br><br> <b>Valor Total.......:</b> " + (prod.getPreco() * prod.getQuantidade()) );           
        %>
        </div>
    </body>
</html>
