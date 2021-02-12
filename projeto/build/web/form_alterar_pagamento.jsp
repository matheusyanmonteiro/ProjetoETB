<%-- 
    Document   : form_alterar_pagamento
    Created on : 24/11/2016, 04:30:39
    Author     : marcos
--%>

<%@page import="model.PagamentoDAO"%>
<%@page import="model.Pagamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Pagamento m = new Pagamento();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        PagamentoDAO mDAO = new PagamentoDAO();
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
        <title>Alterar Pagamento</title>

    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Alterar Pagamento</h1>
        <fieldset>
            <legend>Alterar Pagamento</legend>
        <form method="post" action="alterar_pagamento.do">
            
            <table>
                <tr><td>ID: </td><td><%=m.getId() %><input type="hidden" value="<%=m.getId() %>" name="id"></td></tr>
          <tr><td>Quantidade de parcelas: </td><td><input type="text" name="divisao" value="<%=m.getDivisao()%>"required></td></tr>
                <tr><td>Desconto: </td><td><input type="text" name="desconto"value="<%=m.getDesconto()%>"  required></td></tr> 
                
          <tr><td> </td><td> <input type="submit" value="Salvar"></td></tr>
            
            </table>
            </fieldset>
        </form>
          <br><br><br><br><br>
         <p>   &COPY;  2016 AQUARELLA EVENTOS | TODOS OS DIREITOS RESERVADOS    </p>
            </div>
          <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
           <%@include file="verifica_login.jsp" %>
    </body>
</html>
