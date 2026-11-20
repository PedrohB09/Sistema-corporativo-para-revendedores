<%-- 
    Document   : prod_cons_id_alt
    Created on : 2 de set. de 2026, 21:03:29
    Author     : pedro, guilherme, nathalye, geovanna
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
        <h2>Controle de Produtos (CRTL) - Consultar Id pasra Alterar</h2>
        <%
            request.setCharacterEncoding("UTF-8"); //Encoding "UTF-8"
            // Entrada
            int id = Integer.parseInt( request.getParameter("id") );

            //Consultar Id
            ProdutosDAO prodDAO = new ProdutosDAO();

            // Instância obj. 
            Produtos prod = new Produtos();      
            prod = prodDAO.consultarId(id);
                               
            if (prod.getId()==0){
                out.println("<br> <b>Produto Não encontrado!!!</b> ");
            }else{
                out.println("<br> Produto Localizado! ");                       
                // Saída / Processamento
        %>        
                <form method="post" action="prod_alt.jsp">
                    <p>Identificador <input type="number" name="id" value="<%=prod.getId()%>" readonly="true"> </p> 
                    <p>Nome do produto <input type="text" name="prod" value="<%=prod.getNome_prod()%>"> </p>
                    <p>Descrição <input type="text" name="desc" value="<%=prod.getDescricao()%>"> </p>
                    <p>Valor <input type="number" name="prc" step="0.01" min="0" placeholder="0.00" value="<%=prod.getPreco()%>"> </p>
                    <p>Quantidade <input type="number" name="qtd" value="<%=prod.getQuantidade()%>"> </p>
                    <p> <input type="submit" value="Alterar">
                        <input type="reset" value="Limpar">
                    </p>
                </form>                                   
        <%
            }
        %>
    </body>
</html>
