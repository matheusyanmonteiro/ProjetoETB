<%-- 
    Document   : listar_buffet
    Created on : 18/11/2016, 01:18:48
    Author     : marcos
--%>

<%@page import="model.BuffetDAO"%>
<%@page import="model.Buffet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Buffet m = new Buffet();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        BuffetDAO mDAO = new BuffetDAO();
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
        <title>Alterar Buffet</title>

    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Novo Buffet</h1>
        <fieldset>
            <legend>Alterar Buffet</legend>
        <form method="post" action="alterar_buffet.do">
            
            <table>
          <tr><td>ID: </td><td><%=m.getId() %><input type="hidden" value="<%=m.getId() %>" name="id"></td></tr>
          <tr><td>Nome : </td><td><input type="text" value="<%=m.getNome()%>" name="nome"  required></td></tr>
          <tr><td>Preço: </td><td><input type="text" value="<%=m.getPreco()%>" name="preco" required></td></tr>
          <tr><td>Tipo: </td><td><input type="text" value="<%=m.getTipo()%>" name="tipo" required></td></tr>
          <tr><td>Quantidade de comida: </td><td><input type="text" value="<%=m.getQuantidadeComida()%>" name="quantidadeComida" required></td></tr>
          <tr><td>Quantidade de bebida: </td><td><input type="text" value="<%=m.getQuantidadeBebida()%>" name="quantidadeBebida" required></td></tr>
          <tr><td>Tamanho do bolo: </td><td><input type="text" value="<%=m.getTamanhoBolo()%>" name="tamanhoBolo" required></td></tr>
          
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
