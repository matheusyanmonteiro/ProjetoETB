<%-- 
    Document   : form_inserir_menu
    Created on : 25/08/2016, 15:36:34
    Author     : jotadf
--%>

<%@page import="model.MenuDAO"%>
<%@page import="model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Menu m = new Menu();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        MenuDAO mDAO = new MenuDAO();
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
        <title>Alterar Menu</title>

    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Novo Menu</h1>
        <fieldset>
            <legend>Alterar Menu</legend>
        <form method="post" action="alterar_menu.do">
            
            <table>
          <tr><td>  ID: </td><td><%=m.getId() %><input type="hidden" value="<%=m.getId() %>" name="id"></td></tr>
          <tr><td>  Titulo: </td><td><input type="text" value="<%=m.getTitulo() %>" name="titulo"  required></td></tr>
          <tr><td> Link: </td><td><input type="text" value="<%=m.getLink() %>" name="link" required></td></tr>
          <tr><td>  Icone: </td><td><input type="text" value="<%=m.getIcone() %>" name="icone" required></td></tr>
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
