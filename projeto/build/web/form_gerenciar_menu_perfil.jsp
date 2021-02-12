<%@page import="java.util.ArrayList"%>
<%@page import="model.Menu"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Perfil p = new Perfil();
    ArrayList<Menu> naoVinculados = new ArrayList<Menu>();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        pDAO.conectar();
        p = pDAO.listar(id);
        naoVinculados = pDAO.menusNaoVinculados(id);
        pDAO.desconectar();
        
    }catch(Exception e){
    
    }
%>

<html>
    <head>
        <meta charset="utf8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Novo Perfil</h1>
        <form method="post" action="gerenciar_menu_perfil.do">
            <input type="hidden" value="vincular" name="op">
            ID:<%=p.getId() %><input type="hidden" value="<%=p.getId() %>" name="perfil_id">
             Perfil:<%=p.getPerfil() %><br>
             Menu:<select size="1" name="menu_id" required>
                 <option value="">Selecione...</option>
                 <%
                     for(Menu m:naoVinculados){
                         %>
                         <option value="<%=m.getId() %>"><%=m.getTitulo() %></option>
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
                <tr>
                    <td>ID</td>
                    <td>MENU</td>
                    <td>DESVINCULAR</td>
                </tr>
                <%
                    for(Menu m:p.getMenus()){
                 %>   
                <tr>
                    <td><%=m.getId() %></td>
                    <td><%=m.getTitulo() %></td>
                    <td><a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId() %>&id_perfil=<%=p.getId() %>&op=desvincular"><img src="imagens/excluir.png"></a></td>
                </tr>   
     
                 <%   }
                    %>
            </table>
            
            
    </body>
</html>
