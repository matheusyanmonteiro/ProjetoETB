<%-- 
    Document   : newjspform_alterar_cliente
    Created on : 18/11/2016, 02:52:36
    Author     : marcos
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.EventosDAO"%>
<%@page import="model.Eventos"%>
<%@page import="model.BuffetDAO"%>
<%@page import="model.Salao"%>
<%@page import="model.Cliente"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.SalaoDAO"%>
<%@page import="model.Buffet"%>
<%@page import="model.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Eventos m = new Eventos();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        EventosDAO mDAO = new EventosDAO();
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
        <title>Alterar Eventos</title>

    </head>
    <body>
        <%@include file="banner.jsp" %>
        <div id="formulario">
        <h1>Alterar Evento</h1>
        <fieldset>
            <legend>Alterar Eventos</legend>
        <form method="post" action="alterar_eventos.do">
            
            <table>
                ID: <%=m.getId() %><input type="hidden" value="<%=m.getId() %>" name="id"><br>
               Tema: <input type="Text" name="tema" value="<%=m.getTema()%>"><br>
                Quantidade de Convidados: <input value="<%=m.getQuantidadeDeConvidados()%>" type="number" min="50" name="quantidadeDeConvidados"><br>
                Valor: <input value="<%=m.getValor()%>" type="text"  name="valor"><br>
               
                Horario: <input type="text" value="<%=m.getHorario()%>" name="horario"><br>
                
                Data: <input type="text" value="<%=m.getData()%>" name="data"><br>
                Situação: <input type="text" value="<%=m.getSituacao()%>" name="situacao" list="situacao" required>
                 <datalist id="situacao">
                <option value="agendado"></option>
                <option value="cancelado"></option>
                <option value="concluido"></option>
                </datalist><br>
               
                <button type="submit">Continuar</button>&nbsp;&nbsp;
            
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
