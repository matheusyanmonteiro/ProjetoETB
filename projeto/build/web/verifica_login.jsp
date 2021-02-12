<%@page import="model.Usuario"%>
<div id="log">
<%

    Usuario usuario = new Usuario();
    try {
        usuario = (Usuario) session.getAttribute("usuario");

         out.print("&nbsp;&nbsp; Bem-Vindo, " +usuario.getNome() + "&nbsp;&nbsp; <a class=\"sair\" href=\"sair.jsp\" >SAIR</a>"
                );
    } catch (Exception e) {
        response.sendRedirect("login.jsp");
    }


%>
</div>