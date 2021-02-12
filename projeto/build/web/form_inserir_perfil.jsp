<%-- 
    Document   : form_inserir_perfil
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
        <title>Inserir Perfil</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><%@include file="verifica_login.jsp" %>
        
        <div id="formulario">
            <h1>Novo Menu</h1>
        <form method="post" action="inserir_perfil.do"> 
            <fieldset>
                <legend>Dados do menu</legend>
            <table>
       
            Perfil:<input type="text" name="perfil"  required><br>
            <input type="submit" value="Salvar">
        </table>
            </fieldset>
        </form>
        </div>
                <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
                
             
    </body>
</html>
