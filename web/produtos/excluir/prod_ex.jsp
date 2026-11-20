<%-- 
    Document   : prod_ex
    Created on : 20 de nov. de 2026, 22:54:21
    Author     : pedro, geovanna, guilherme, nathalye
--%>

<%@page import="model.DAO.ProdutosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web App Kero-Kero</title>
    </head>
    <body>
        <h2>Controle de Produtos (CRTL) - Excluir Id</h2>
        <%
            request.setCharacterEncoding("UTF-8"); //Encoding "UTF-8"
            // Entrada
            int id = Integer.parseInt( request.getParameter("id") );

            //Instanciar o ProdDAO
            ProdutosDAO prodDAO = new ProdutosDAO();
                
              //Excluir
            if (prodDAO.excluir(id) == true){
                out.println("<br> Produto Excluído com sucesso! ");
            }else{
                out.println("<br> <b>Produto Não foi excluído com sucesso!!!</b> ");                                
            }
        %>
    </body>
</html>
