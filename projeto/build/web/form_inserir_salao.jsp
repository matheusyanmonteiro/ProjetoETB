<%-- 
    Document   : form_inserir_salao
    Created on : 18/11/2016, 02:10:30
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
        <title>Inserir Salão</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><%@include file="verifica_login.jsp" %>
        
        <div id="formulario">
            <h1>Novo Salao</h1>
        <form method="post" action="inserir_salao.do"> 
            <fieldset>
                <legend>Dados do Buffet</legend>
            <table>
                
          <tr><td>Nome : </td><td><input type="text" name="nome"  required></td></tr>
          <tr><td>Valor aluguel: </td><td><input type="text" name="valorAluguel" required></td></tr>
          <tr><td>Endereço: </td><td><input type="text" name="endereco" required></td></tr>
       
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
