<%-- 
    Document   : listar_perfil
    Created on : 01/09/2016, 14:51:06
    Author     : jotadf
--%>

<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<html>
    <head>
        <meta charset="utf8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="estilo.css">
        <link rel="stylesheet" type="text/css" href="lista.css">
        <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css' type='text/css'>
    <script src="jquery.tablesorter.min.js"></script>
    <script src="jquery.tablesorter.pager.js"></script>
        <script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   $('table tbody tr:odd').addClass('zebraUm');
   $('table tbody tr:even').addClass('zebraDois');
});
</script>
        <title>Listar Perfil</title>
    </head>
    <body>
          <div id="interface">
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
              <div id="tab">
                 
            <h2>Listar Perfil (<a href="form_inserir_perfil.jsp"><img src="imagens/novo.png" border="0">Novo</a>)</h2>
            <div class="submit-line"> 
            <form method="post" action="">
                
                <input type="text" id="pesquisar" name="pesquisar" placeholder="Procurar &#xF002;" value="" tabindex="1" autocomplete="off">
                     
            </form><br></div>
            <table id="tab">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>PERFIL</th>
                    <th>OPÇÕES</th>
                </tr></thead><tbody>
            <%
               for(Perfil p:lista){ %>
                <tr>
                    <td><%=p.getId() %></td>
                    <td><%=p.getPerfil() %></td>
                    <td align="center">
                        <a href="excluir_perfil.do?id=<%=p.getId() %>"><img src="imagens/excluir.png" border="0"></a> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="form_alterar_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/alterar.png" border="0"></a> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="form_gerenciar_menu_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/menu1.png" border="0"></a> 
                        
                    </td>
                </tr>
               
              <% }
                %>
                </tbody>    
                </table>
              
        </div>
          
                <br>
                <br>
                <%@include file="pesquisa_tabela.jsp" %>
                
                <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
                
               
                </div>
    </body>
</html>
