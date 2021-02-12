<%--
Esta pagina lista os eventos q estão agendados 
--%>
<%@page import="model.EventosDAO"%>
<%@page import="model.Eventos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Eventos> lista = new ArrayList<Eventos>();
    try{
        EventosDAO uDAO = new EventosDAO();
        uDAO.conectar();
        lista = uDAO.listarAgendado();
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
    left: 200px;
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
        <title>Listar Eventos</title>
    </head>
    <body>
          <div id="interface">
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
              <div id="tab1">
                  
            <h2>Listar Eventos (<a href="form_inserir_eventos.jsp"><img src="imagens/novo.png" border="0">Novo</a>)</h2>
            <br><h4><a href="lista_agendados.jsp" style="color: blue;">Agendados</a> 
            <div class="submit-line"> 
            <form method="post" action="">
                
                <input type="text" id="pesquisar" name="pesquisar" placeholder="Procurar &#xF002;" value="" tabindex="1" autocomplete="off">
                     
            </form><br></div>
            <table><thead>
                <tr>
                    <th>ID</th>
                    <th>TEMA</th>
                    <th >DATA </th>
                    <th>HORA</th>
                    <th>VALOR TOTAL</th>
                    <th>SITUAÇÃO</th>
                    <th>QUANTIDADE DE CONVIDADOS</th>
                    <th>VALOR DO BUFFET</th>
                    <th>OPÇÕES</th>
                </tr></thead><tbody>
            <%
               for(Eventos u:lista){ %>
               <tr>
                    <td><%=u.getId() %></td>
                    <td><%=u.getTema()%></td>
                    <td><%=u.getData()%></td>
                    <td><%=u.getHorario()%></td>
                    <td><%=u.totalFesta()%></td>
                    <td><%=u.getSituacao()%></td>
                    <td><%=u.getQuantidadeDeConvidados()%></td>
                    <td><%=u.totalBuffet()%></td>
                    <td align="center">
                         <a href="excluir_eventos.do?id=<%=u.getId() %>" ><img src="imagens/excluir.png" border="0"></a> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="form_alterar_eventos.jsp?id=<%=u.getId() %>"><img src="imagens/alterar.png" border="0"></a> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="form_gerenciar_item_evento.jsp?id=<%=u.getId() %>"><img src="imagens/menu1.png" border="0"></a>
                    
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="listar_um.jsp?id=<%=u.getId() %>"><img src="imagens/ListarUm.png" border="0"></a>
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
