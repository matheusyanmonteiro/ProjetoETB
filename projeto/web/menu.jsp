
<%@page import="model.MenuDAO"%>
<%@page import="model.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Menu"%>
<%@page import="model.Perfil"%>

<%
    ArrayList<Menu> lista = new ArrayList<Menu>();
    try{
        MenuDAO mDAO = new MenuDAO();
        mDAO.conectar();
        lista = mDAO.listar();
        mDAO.desconectar();

    }catch(Exception e){
        out.print("Erro: "+e);
    }

    %>
  
 <nav id="menu">
           
                <%
               for(Menu m:lista){ %>
                         <dl>
                             <p>  <dd><a href="<%=m.getLink() %>"><img src="<%=m.getIcone() %>">  </dd><br>
                                     <dd class="titulo"> <%=m.getTitulo() %></p></a>  </dd></dl>
         <% } %>
        </nav>