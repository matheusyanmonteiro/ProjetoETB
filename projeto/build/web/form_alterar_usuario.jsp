<%-- 
    Document   : form_inserir_usuario
    Created on : 25/08/2016, 15:36:34
    Author     : jotadf
--%>
<%@page import="model.Usuario"%>
<%@page import="model.UsuarioDAO"%>
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

    int id = Integer.parseInt(request.getParameter("id"));
    Usuario u = new Usuario();
    try{
        UsuarioDAO uDAO = new UsuarioDAO();
        uDAO.conectar();
        u = uDAO.listar(id);
        uDAO.desconectar();

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
           <link rel="stylesheet" type="text/css" href="estilo.css">
        <link rel="stylesheet" type="text/css" href="alterar.css">
       
        <title>Alterar Usuario</title>
    </head>
    <body>
          <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Novo Usuario</h1>
        <form method="post" action="alterar_usuario.do">
        <fieldset>
            <legend>Alterar usuario</legend>

            <table>
              
            <tr><td> ID: </td><td><%=u.getId() %><input  name="id" type="hidden" value="<%=u.getId() %>"></td></tr>
           <tr><td>  Nome: </td><td><input type="text" name="nome" value="<%=u.getNome() %>" required></td></tr>
           <tr><td>  Idade: </td><td><input type="number" name="idade" value="<%=u.getIdade()%>" min="18" required></td></tr>
           <tr><td>  Telefone: </td><td><input type="text" name="telefone" value="<%=u.getTelefone()%>" required></td></tr>
           <tr><td>  Email: </td><td><input type="text" name="email" value="<%=u.getEmail()%>" required></td></tr>
           <tr><td>  Cpf: </td><td><input type="text" name="cpf" value="<%=u.getCpf()%>" required></td></tr>
           <tr><td>  Rg: </td><td><input type="text" name="rg" value="<%=u.getRg()%>" required></td></tr>
           <tr><td>  Salario: </td><td><input type="text" name="salario" value="<%=u.getSalario()%>" required></td></tr>
           <tr><td>  Endereço: </td><td><input type="text" name="endereco" value="<%=u.getEndereco()%>" required></td></tr>
           <tr><td>  Cep: </td><td><input type="text" name="cep" value="<%=u.getCep()%>" required></td></tr>
           <tr><td>  Carteira de trabalho: </td><td><input type="text" name="carteiraDeTrabalho" value="<%=u.getCarteiraDeTrabalho()%>" required></td></tr>
           <tr><td>  Data de nascimento: </td><td><input type="text" name="dataDeNascimento" value="<%=u.getDataDeNascimento()%>" required></td></tr>
          
           <tr><td>  Login: </td><td><input type="text" name="login" value="<%=u.getLogin() %>"   required></td></tr>
           <tr><td>  Senha: </td><td><input type="password" name="senha" value="<%=u.getSenha() %>" required></td></tr>
           <tr><td>  Perfil:
            <select name="perfil_id" size="1" required>
                <option value="">Escolha</option>
                <% for(Perfil p:lista){
                %>
                        <option value="<%=p.getId() %>" ><%=p.getPerfil() %></option>
                <%  } %>
            </select></td></tr>
            <br>
           <tr><td> </td><td><input type="submit" value="Salvar">
           </form></table>
             </div>
           <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
    </div>  
           <%@include file="verifica_login.jsp" %>    
    </body>
</html>
