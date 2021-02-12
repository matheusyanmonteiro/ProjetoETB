<%-- 
    Document   : form_inserir_gasto
    Created on : 21/11/2016, 05:04:25
    Author     : marcos
--%>

<%@page import="model.EventosDAO"%>
<%@page import="model.Eventos"%>
<%@page import="model.UsuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Usuario> lista3 = new ArrayList<Usuario>();
    try{
        UsuarioDAO uDAO = new UsuarioDAO();
        uDAO.conectar();
        lista3 = uDAO.listar3();
        uDAO.desconectar();

    }catch(Exception e){
        out.print("Erro: "+e);
    }
         

    %>
  
    <head>
        <meta charset="utf8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="inserir.css">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Gasto</title>
    </head>
    <body>
      <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
        
        <div id="formulario">
            <h1>Novo Item</h1>
        <form method="post" action="inserir_gastos.do">
            <fieldset>
                <legend>Dados do Gasto</legend>
            <table>
                
                
               
                <tr><td>Descrição: </td><td><input type="text" name="descricao" required></td></tr>
                <tr><td>Valor: </td><td><input type="text" name="valor"  required></td></tr>
              
                <tr><td>  Usuario: </td><td><input type="text" list="usuario" name="usuario_id" required>
                <datalist id="usuario">
                      <%
               for(Usuario m:lista3){ %>
                <option value="<%=m.getId() %>"><%=m.getNome()%></option>
                <%
                }
                %>
                </datalist></td></tr>
               
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
