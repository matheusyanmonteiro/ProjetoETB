<%-- 
    Document   : form_inserir_pagamento
    Created on : 24/11/2016, 00:16:44
    Author     : marcos
--%>

<%@page import="model.EventosDAO"%>
<%@page import="model.Eventos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Eventos m = new Eventos();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        EventosDAO mDAO = new EventosDAO();
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
        <link rel="stylesheet" type="text/css" href="inserir.css">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Inserir Pagamento</title>
    </head>
    <body>
        
     <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
        
        <div id="formulario">
            <h1>Novo pagamento </h1>
        <form method="post" action="inserir_pagamento.do"> 
            <fieldset>
                <legend>Dados do pagamento</legend>
            <table>
                
                <tr><td>Evento: <%=m.getId() %></td><td><input type="hidden" value="<%=m.getId() %>" name="eventos_id"  required></td></tr>
                <tr><td>Quantidade de parcelas: </td><td><input type="text" name="divisao" required></td></tr>
                <tr><td>Desconto: </td><td><input type="text" name="desconto"  required></td></tr>
                <tr><td></td><td> <input type="submit" value="Salvar"></td></tr>
                
                
                
            </table>
            </fieldset>
        </form>
        </div>
                <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
                </div>
    </body>
</html>
