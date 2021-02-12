<%-- 
    Document   : listar_gastos
    Created on : 21/11/2016, 05:01:01
    Author     : marcos
--%>

<%@page import="model.GastosDAO"%>
<%@page import="model.Gastos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Gastos> lista = new ArrayList<Gastos>();
    try{
        GastosDAO uDAO = new GastosDAO();
        uDAO.conectar();
        lista = uDAO.listar();
        uDAO.desconectar();

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
        <title>Listar Gastos</title>
    </head>
    <body>
          <div id="interface">
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
              <div id="tab">
                  
            <h2>Listar Gastos (<a href="form_inserir_gasto.jsp"><img src="imagens/novo.png" border="0">Novo</a>)</h2>
            <div class="submit-line"> 
            <form method="post" action="">
                
                <input type="text" id="pesquisar" name="pesquisar" placeholder="Procurar &#xF002;" value="" tabindex="1" autocomplete="off">
                     
            </form><br></div>
            <table><thead>
                <tr>
                    <td>ID</td>
                 
                    <td>DESCRIÇÃO</td>
                    <td>VALOR</td>
                    <td>OPÇÕES</td>
                </tr></thead><tbody>
            <%
               for(Gastos u:lista){ %>
               <tr>
                    <td><%=u.getId()%></td>
                   
                    <td><%=u.getDescricao()%></td>
                    <td><%=u.getValor()%></td>
                    <td align="center">
                        <a href="excluir_gastos.do?id=<%=u.getId() %>" ><img src="imagens/excluir.png" border="0"></a> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="form_alterar_gastos.jsp?id=<%=u.getId() %>"><img src="imagens/alterar.png" border="0"></a> 
                       
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


