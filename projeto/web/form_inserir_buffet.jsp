<%-- 
    Document   : form_inserir_item
    Created on : 18/11/2016, 00:50:03
    Author     : marcos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="inserir.css">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Inserir Buffet</title>
    </head>
    <body>
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
        
        <div id="formulario">
            <h1>Novo Buffet</h1>
        <form method="post" action="inserir_buffet.do">
            <fieldset>
                <legend>Dados do Buffet</legend>
            <table>
                
          <tr><td>Nome : </td><td><input type="text" name="nome"  required></td></tr>
          <tr><td>Preço: </td><td><input type="text" name="preco" required></td></tr>
          <tr><td>Tipo: </td><td><input type="text" name="tipo" required></td></tr>
          <tr><td>Quantidade de comida: </td><td><input type="text" name="quantidadeComida" required></td></tr>
          <tr><td>Quantidade de bebida: </td><td><input type="text" name="quantidadeBebida" required></td></tr>
          <tr><td>Tamanho do bolo: </td><td><input type="text" name="tamanhoBolo" required></td></tr>
         
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
