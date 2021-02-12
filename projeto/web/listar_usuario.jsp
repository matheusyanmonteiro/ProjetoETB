<%-- 
    Document   : listar_usuario
    Created on : 01/09/2016, 14:51:06
    Author     : jotadf
--%>

<%@page import="model.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Usuario> lista = new ArrayList<Usuario>();
    try{
        UsuarioDAO uDAO = new UsuarioDAO();
        uDAO.conectar();
        lista = uDAO.listar();
        uDAO.desconectar();

    }catch(Exception e){
        out.print("Erro: "+e);
    }

    %>
<html>
    <head>
       <meta charset="UTF-8">
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
        <title>Listar Usuario</title>
    </head>
    <body>
          <div id="interface">
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
              <div id="tab">
                  
            <h2>Listar Usuario (<a href="form_inserir_usuario.jsp"><img src="imagens/novo.png" border="0">Novo</a>)</h2>
            <div class="submit-line"> 
            <form method="post" action="">
                
                <input type="text" id="pesquisar" name="pesquisar" placeholder="Procurar &#xF002;" value="" tabindex="1" autocomplete="off">
                     
            </form><br></div>
            <table><thead>
                <tr>
                    <td>ID</td>
                    <td>NOME</td>
                    <td>LOGIN</td>
                    <td>TELEFONE</td>
                    <td>PERFIL</td>
                    <td>OPÇÕES</td>
                </tr></thead><tbody>
            <%
               for(Usuario u:lista){ %>
               <tr>
                    <td><%=u.getId() %></td>
                    <td><%=u.getNome() %></td>
                    <td><%=u.getLogin() %></td>
                    <td><%=u.getTelefone()%></td>
                    <td><%=u.getPerfil().getPerfil() %></td>
                    <td align="center">
                        <a href="excluir_usuario.do?id=<%=u.getId() %>" ><img src="imagens/excluir.png"></a> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="form_alterar_usuario.jsp?id=<%=u.getId() %>"><img src="imagens/alterar.png" ></a> 
                       
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
        </div>
    </body>
</html>
