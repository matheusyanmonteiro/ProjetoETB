<%-- 
    Document   : listar_pagamento
    Created on : 24/11/2016, 00:36:56
    Author     : marcos
--%>

<%@page import="model.PagamentoDAO"%>
<%@page import="model.Pagamento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Pagamento> lista = new ArrayList<Pagamento>();
    try{
        PagamentoDAO uDAO = new PagamentoDAO();
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
        <style>
            div#tab1{
    position: absolute;
    top: 350px;
    left: 350px;
}
        </style>
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
        <title>Listar Pagamentos</title>
    </head>
    <body>
          <div id="interface">
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
              <div id="tab1">
                  
            <h2>Listar Pagamentos</h2>
            
               
                
            <div class="submit-line"> 
            <form method="post" action="">
                
                <input type="text" id="pesquisar" name="pesquisar" placeholder="Procurar &#xF002;" value="" tabindex="1" autocomplete="off">
                     
            </form><br></div>
            <table><thead>
                <tr>
                    <th>ID</th>
                    <th>DIVISAO</th>
                    <th>PARCELAS RESTANTES</th>
                    <th>DESCONTO</th>
                    <th>TOTAL A PAGAR</th>
                    <th>VALOR PARCELA</th>
                    
                    <th>OPÇÕES</th>
                </tr></thead><tbody>
    <%
               for(Pagamento u:lista){ %>
               <tr>
                    <td><%=u.getId() %></td>
                    <td><%=u.getDivisao()%></td>
                    <td><%=u.getQuantidadeParcela()%></td>
                    <td><%=u.getDesconto()%></td>
                    <td><%=u.pagamentoTotal()%></td>
                    <td><%=u.ValorParcela()%></td>
                    
                    <td align="center">
                        <a href="excluir_pagamento.do?id=<%=u.getId() %>" ><img src="imagens/excluir.png" border="0"></a> 
                        &nbsp;&nbsp;&nbsp;
                        <a href="form_alterar_pagamento.jsp?id=<%=u.getId() %>"><img src="imagens/alterar.png" border="0"></a> 
                       
                        &nbsp;&nbsp;&nbsp;
                        <a href="pagar_parcela.do?id=<%=u.getId() %>&quantidadeParcela=<%=u.PagarParcela()%>" ><img src="imagens/pagar.png" border="0"></a> 
                       
                    
                       
                    </td>
                </tr>
              
              <% }
                %>
                </tbody>
                </table>
           <br><br><br><br>
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
