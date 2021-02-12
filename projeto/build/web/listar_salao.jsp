<%-- 
    Document   : listar_local
    Created on : 18/11/2016, 02:05:10
    Author     : marcos
--%>

<%@page import="model.SalaoDAO"%>
<%@page import="model.Salao"%>
<%@page import="model.Eventos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Salao> lista = new ArrayList<Salao>();
    try{
        SalaoDAO mDAO = new SalaoDAO();
        mDAO.conectar();
        lista = mDAO.listar();
        mDAO.desconectar();

    }catch(Exception e){
        out.print("Erro: "+e);
    }

    %>
    
   
<html>
    <head>
        <meta charset="utf8">
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Salao</title>
    </head>
    <body>
         <div id="interface">
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
              <div id="tab">
                 
            <h2>Listar Locais(<a href="form_inserir_salao.jsp"><img src="imagens/novo.png" border="0">Novo</a>)</h2>
            <div class="submit-line"> 
            <form method="post" action="">
                
                <input type="text" id="pesquisar" name="pesquisar" placeholder="Procurar &#xF002;" value="" tabindex="1" autocomplete="off">
                     
            </form><br></div>
            <table id="tab">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>NOME</th>
                    <th>VALOR</th>
                    <th>ENDEREÇO</th>
                    <th>OPÇÕES</th>
                </tr>
                </thead>
                <tbody>
            <%
               for(Salao m:lista){ %>
               <tr>
                   <td class="resultado"><%=m.getId() %></td>
                    <td class="resultado"><%=m.getNome()%></td>
                    <td class="resultado">R$ <%=m.getValorAluguel()%></td>
                    <td class="resultado"><%=m.getEndereco()%></td>
                    <td align="center">
                        <a href="excluir_salao.do?id=<%=m.getId() %>"> <img src="imagens/excluir.png" border="0"></a> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="form_alterar_salao.jsp?id=<%=m.getId() %>"><img src="imagens/alterar.png" border="0"></a> 
                        
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
                <br><br><br><br><br><br><br><br><br>
                <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div>
                </div>

    </body>
</html>
