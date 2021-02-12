<%-- 
    Document   : listar_um
    Created on : 21/11/2016, 11:51:26
    Author     : marcos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.EventosDAO"%>
<%@page import="model.Eventos"%>
<%@page import="model.BuffetDAO"%>
<%@page import="model.Salao"%>
<%@page import="model.Cliente"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.SalaoDAO"%>
<%@page import="model.Buffet"%>
<%@page import="model.UsuarioDAO"%>
<%@page import="model.Usuario"%>
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
         <link rel="stylesheet" type="text/css" href="estilo.css">
        <link rel="stylesheet" type="text/css" href="alterar.css">
        <title>Evento</title>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Alterar Evento</h1>
        <fieldset>
            <legend>Dados do evento</legend>
       
            
            <table>
                <tr><th>ID:</th> <td><%=m.getId() %></td></tr>
                <tr><th>Tema: </th><td><%=m.getTema()%></td></tr> 
                <tr><th>Data: </th><td><%=m.getData()%></td></tr> 
                <tr><th>Horario: </th> <td><%=m.getHorario()%></td></tr>
                <tr><th>Quantidade de Convidados: </th><td><%=m.getQuantidadeDeConvidados()%></td></tr>
                <tr><th>Data: </th> <td><%=m.getData()%></td></tr>
                <tr><th>Situação: </th> <td><%=m.getSituacao()%></td></tr>
                <tr><th>Valor do buffet: </th> <td><%=m.totalBuffet()%></td></tr>
                <tr><th>Valor do total: </th> <td><%=m.totalFesta()%></td></tr>
               <tr><th>Cliente: </th> <td><%=m.getCliente()%></td></tr>
               <tr><th>local: </th> <td><%=m.getSalao()%></td></tr>
            </table>
            </fieldset>
            <br><br><br>
            </div>
          <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
           <%@include file="verifica_login.jsp" %>
    </body>
</html>
