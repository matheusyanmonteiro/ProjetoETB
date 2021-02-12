<%-- 
    Document   : newjspform_alterar_cliente
    Created on : 18/11/2016, 02:52:36
    Author     : marcos
--%>

<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Cliente m = new Cliente();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO mDAO = new ClienteDAO();
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
        <title>Alterar Cliente</title>

    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Novo Cliente</h1>
        <fieldset>
            <legend>Alterar Cliente</legend>
        <form method="post" action="alterar_cliente.do">
            
            <table>
                <tr><td>ID: </td><td><%=m.getId() %><input type="hidden" value="<%=m.getId() %>" name="id"></td></tr>
          <tr><td>Nome: </td><td><input type="text" name="nome" value="<%=m.getNome()%>"required></td></tr>
                <tr><td>Rg: </td><td><input type="text" name="rg"value="<%=m.getRg()%>"  required></td></tr> 
                <tr><td>Data de nascimento: </td><td><input type="date"value="<%=m.getDataDeNascimento()%>" name="dataDeNascimento"  required></td></tr> 
                <tr><td>Cpf: </td><td><input type="text" name="cpf" value="<%=m.getCpf()%>" required></td></tr>
                <tr><td>Endereço: </td><td><input type="text"value="<%=m.getEndereco()%>" name="endereco"  required></td></tr>
                <tr><td>Cep: </td><td><input type="text" name="cep"  value="<%=m.getCep()%>" required></td></tr>
                <tr><td>Telefone: </td><td><input type="text" name="telefone" value="<%=m.getTelefone()%>" required></td></tr>
                <tr><td>Email: </td><td><input type="text" name="email" value="<%=m.getEmail()%>" required></td></tr>
                <tr><td>Contato emergencial: </td><td><input type="text"value="<%=m.getTelefoneEmergencial()%>" name="telefoneEmergencial"  required></td></tr>
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
