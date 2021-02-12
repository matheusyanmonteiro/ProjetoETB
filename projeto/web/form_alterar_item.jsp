<%-- 
    Document   : form_alterar_item
    Created on : 18/11/2016, 01:00:21
    Author     : marcos
--%>

<%@page import="model.ItemDAO"%>
<%@page import="model.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Item m = new Item();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        ItemDAO mDAO = new ItemDAO();
        mDAO.conectar();
        m = mDAO.listar(id);
        mDAO.desconectar();
        
    }catch(Exception e){
    
    }
%>

<html>
    <head>
        <meta charset="utf8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <link rel="stylesheet" type="text/css" href="alterar.css">
        <title>Alterar Item</title>

    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Novo Item</h1>
        <fieldset>
            <legend>Alterar Item</legend>
        <form method="post" action="alterar_item.do">
            
            <table>
          <tr><td>  ID: </td><td><%=m.getId() %><input type="hidden" value="<%=m.getId() %>" name="id"></td></tr>
         
          <tr><td>Nome : </td><td><input type="text" value="<%=m.getNome()%>" name="nome" required></td></tr>
          <tr><td>Valor : </td><td><input type="text" value="<%=m.getValorAluguel()%>" name="valorAluguel" required></td></tr>
          <tr><td> </td><td> <input type="submit" value="Salvar"></td></tr>
            
            </table>
            </fieldset>
        </form>
            </div>
          <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
           <%@include file="verifica_login.jsp" %>
    </body>
</html>
