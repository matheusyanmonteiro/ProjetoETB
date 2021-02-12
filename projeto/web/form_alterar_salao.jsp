<%-- 
    Document   : form_alterar_salao
    Created on : 18/11/2016, 02:23:15
    Author     : marcos
--%>

<%@page import="model.SalaoDAO"%>
<%@page import="model.Salao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Salao m = new Salao();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        SalaoDAO mDAO = new SalaoDAO();
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
        <title>Alterar Salao</title>

    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Novo Salao</h1>
        <fieldset>
            <legend>Alterar Salao</legend>
        <form method="post" action="alterar_salao.do">
            
            <table>
          <tr><td>ID: </td><td><%=m.getId() %><input type="hidden" value="<%=m.getId() %>" name="id"></td></tr>
          <tr><td>Nome : </td><td><input type="text" value="<%=m.getNome()%>" name="nome"  required></td></tr>
          <tr><td>Valor Aluguel: </td><td><input type="text" value="<%=m.getValorAluguel()%>" name="valorAluguel" required></td></tr>
          <tr><td>Endereço: </td><td><input type="text" value="<%=m.getEndereco()%>" name="endereco" required></td></tr>
 
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
