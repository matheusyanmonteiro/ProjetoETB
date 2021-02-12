<%-- 
    Document   : form_inserir_menu
    Created on : 25/08/2016, 15:36:34
    Author     : jotadf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="inserir.css">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Inserir Usuario</title>
    </head>
    <body>
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
        
        <div id="formulario">
            <h1>Novo Menu</h1>
        <form method="post" action="inserir_menu.do"> 
            <fieldset>
                <legend>Dados do menu</legend>
            <table>
                
                
                <tr><td>Titulo: </td><td><input type="text" name="titulo" required></td></tr>
                <tr><td>Link: </td><td><input type="text" name="link"  required></td></tr>
                <tr><td>Icone:</td><td><input type="text" name="icone"  required></td></tr>
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
