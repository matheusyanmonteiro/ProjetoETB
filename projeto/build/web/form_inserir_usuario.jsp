<%-- 
    Document   : form_inserir_usuario
    Created on : 25/08/2016, 15:36:34
    Author     : jotadf
--%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Perfil> lista = new ArrayList<Perfil>();
    try{
        PerfilDAO pDAO = new PerfilDAO();
        pDAO.conectar();
        lista = pDAO.listar();
        pDAO.desconectar();

    }catch(Exception e){
        out.print("Erro: "+e);
    }

    %>
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
            <h1>Novo Usuario</h1>
        <form method="post" action="inserir_usuario.do">
            <fieldset>
                <legend>Dados do usuario</legend>
            <table>
                
                
                <tr><td>Nome: </td><td><input type="text" name="nome" required></td></tr>
                <tr><td>Idade: </td><td><input type="number" name="idade" min="18"  required></td></tr>
                <tr><td>Telefone: </td><td><input type="text" name="telefone"  required></td></tr>
                <tr><td>Email: </td><td><input type="text" name="email"  required></td></tr>
                <tr><td>Cpf: </td><td><input type="text" name="cpf"  required></td></tr>
                <tr><td>Salario: </td><td><input type="text" name="salario"  required></td></tr>
                <tr><td>Rg: </td><td><input type="text" name="rg"  required></td></tr>
                
                <tr><td>Endereço: </td><td><input type="text" name="endereco"  required></td></tr>
                <tr><td>Cep: </td><td><input type="text" name="cep"  required></td></tr>
                <tr><td>Data de nascimento: </td><td><input type="date" name="dataDeNascimento"  required></td></tr>
                <tr><td>Carteira de Trabalho: </td><td><input type="text" name="carteiraDeTrabalho"  required></td></tr>
               
                <tr><td>Login: </td><td><input type="text" name="login"  required></td></tr>
                <tr><td>senha: </td><td><input type="password" name="senha"  required></td></tr>
                
               
                <tr><td>Perfil: </td><td>
            <select name="perfil_id" size="1" required>
                <option value="">Escolha</option>
                <% for(Perfil p:lista){ %>
                        <option value="<%=p.getId() %>"><%=p.getPerfil() %></option>
                <%  } %>
            </select></td></tr>
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
