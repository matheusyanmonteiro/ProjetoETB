<%-- 
    Document   : form_gerenciar_item_evento
    Created on : 21/11/2016, 05:56:18
    Author     : marcos
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Item"%>
<%@page import="model.EventosDAO"%>
<%@page import="model.Eventos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 Eventos p = new Eventos();
    ArrayList<Item> naoVinculados = new ArrayList<Item>();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        EventosDAO pDAO = new EventosDAO();
        pDAO.conectar();
        p = pDAO.listar(id);
        naoVinculados = pDAO.itensNaoVinculados(id);
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
        <title>Items Por Eventos</title>
    </head>
    <body>
       <div id="formulario">
            <fieldset>
        <h1>ADD Itens a Evento</h1>
        <form method="post" action="gerenciar_item_evento.do">
            <input type="hidden" value="vincular" name="op">
            ID:<%=p.getId() %><input type="hidden" value="<%=p.getId() %>" name="eventos_id">
             Itens:<%=p.getItens()%><br>
             Item:<select size="1" name="item_id" required>
                 <option value="">Selecione...</option>
                 <%
                     for(Item m:naoVinculados){
                         %>
                         <option value="<%=m.getId()%>"><%=m.getNome()%></option>
                         <%
                     }
                     %>
                     
             </select>
            <input type="submit" value="Vincular">
           
           
        </form>
            <br/>
            <br/>
            <br/>
            <table>
              
                  <h2>Items Vinculados</h2>
                    <td>ID</td>
                    <td>DESCRÇÃO</td>
                    <td>DESVINCULAR</td>
                </tr>
                <%
                    for(Item m:p.getItens()){
                 %>   
                <tr>
                    <td><%=m.getId() %></td>
                    <td><%=m.getNome()%></td>
                    <td><a href="gerenciar_item_evento.do?id_menu=<%=m.getId() %>&id_perfil=<%=m.getId() %>&op=desvincular"><img src="imagens/excluir.png"></a></td>
                </tr>   
                        
                 <%   }
                    %>
                    
                     </fieldset>
                 
            </table>
            <br><br>
         
            </div>
             <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
            <%@include file="banner.jsp" %>
         <%@include file="verifica_login.jsp" %>
    </body>
</html>
