<%-- 
    Document   : form_inserir_perfil
    Created on : 25/08/2016, 15:36:34
    Author     : jotadf
--%>

<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Perfil p = new Perfil();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        pDAO.conectar();
        p = pDAO.listar(id);
        pDAO.desconectar();
        
    }catch(Exception e){
    
    }
%>

<html>
    <head>
        <meta charset="utf8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="estilo.css">
        <link rel="stylesheet" type="text/css" href="alterar.css">
        <title>Alterar Perfil</title>
    </head>
    <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Novo Menu</h1>
        <fieldset>
            <legend>Alterar Perfil</legend>
        <form method="post" action="alterar_perfil.do">
             
            <table>
            
            <tr><td>  ID: </td><td><%=p.getId() %><input type="hidden" value="<%=p.getId()%>" name="id"></td></tr>
            <tr><td>  Perfil: </td><td><input type="text" value="<%=p.getPerfil()%>" name="perfil" required><br></td></tr>
            <tr><td> </td><td>  <input type="submit" value="Salvar"></td></tr>
       
              </table>
            </fieldset>
        </form>
            </div>
          <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
                
               <%@include file="verifica_login.jsp" %>
    </body>
</html>
