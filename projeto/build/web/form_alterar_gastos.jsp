<%-- 
    Document   : form_alterar_gastos
    Created on : 21/11/2016, 05:41:54
    Author     : marcos
--%>

<%@page import="model.GastosDAO"%>
<%@page import="model.Gastos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Gastos m = new Gastos();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        GastosDAO mDAO = new GastosDAO();
        mDAO.conectar();
        m = mDAO.listar(id);
        mDAO.desconectar();
        
    }catch(Exception e){
    
    }
%>
<html>
    <head>
        <meta charset="utf8">
         <link rel="stylesheet" type="text/css" href="estilo.css">
        <link rel="stylesheet" type="text/css" href="alterar.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
         <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Novo Gastos</h1>
        <fieldset>
            <legend>Alterar Gastos</legend>
        <form method="post" action="alterar_item.do">
            
            <table>
          <tr><td>  ID: </td><td><%=m.getId() %><input type="hidden" value="<%=m.getId() %>" name="id"></td></tr>
          <tr><td>Descriçao : </td><td><input type="text" value="<%=m.getDescricao()%>" name="descricao" required></td></tr>
          <tr><td>Valor : </td><td><input type="text" value="<%=m.getValor()%>" name="valor" required></td></tr>
          <tr><td>Usuario : </td><td><input type="text" value="<%=m.getUsuario()%>" name="usuario_id" required></td></tr>
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
