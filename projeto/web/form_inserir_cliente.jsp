<%-- 
    Document   : form_inserir_cliente
    Created on : 18/11/2016, 02:37:01
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
        <title>Inserir Cliente</title>
    </head>
    <body>
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
        
        <div id="formulario">
            <h1>Novo Cliente</h1>
        <form method="post" action="inserir_cliente.do">
            <fieldset>
                <legend>Dados do Cliente</legend>
            <table>
                
                
                <tr><td>Nome: </td><td><input type="text" name="nome" required></td></tr>
                <tr><td>Rg: </td><td><input type="text" name="rg"  required></td></tr> 
                <tr><td>Data de nascimento: </td><td><input type="date" name="dataDeNascimento"  required></td></tr> 
                <tr><td>Cpf: </td><td><input type="text" name="cpf"  required></td></tr>
                <tr><td>Endereço: </td><td><input type="text" name="endereco"  required></td></tr>
                <tr><td>Cep: </td><td><input type="text" name="cep"  required></td></tr>
                <tr><td>Telefone: </td><td><input type="text" name="telefone"  required></td></tr>
                <tr><td>Email: </td><td><input type="text" name="email"  required></td></tr>
                <tr><td>Contato emergencial: </td><td><input type="text" name="telefoneEmergencial"  required></td></tr>
               
               
            
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
