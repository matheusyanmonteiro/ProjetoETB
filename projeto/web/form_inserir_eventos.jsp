<%-- 
    Document   : form_inserir_eventos
    Created on : 19/11/2016, 16:22:38
    Author     : marcos
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.BuffetDAO"%>
<%@page import="model.Salao"%>
<%@page import="model.Cliente"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.SalaoDAO"%>
<%@page import="model.Buffet"%>
<%@page import="model.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html> 
<%
    ArrayList<Buffet> lista = new ArrayList<Buffet>();
    try{
        BuffetDAO mDAO = new BuffetDAO();
        mDAO.conectar();
        lista = mDAO.listar();
        mDAO.desconectar();

    }catch(Exception e){
        out.print("Erro: "+e);
    }
    
ArrayList<Salao> lista1 = new ArrayList<Salao>();
    try{
        SalaoDAO mDAO = new SalaoDAO();
        mDAO.conectar();
        lista1 = mDAO.listar1();
        mDAO.desconectar();

    }catch(Exception e){
        out.print("Erro: "+e);
    }

  
    ArrayList<Cliente> lista2 = new ArrayList<Cliente>();
    try{
        ClienteDAO uDAO = new ClienteDAO();
        uDAO.conectar();
        lista2 = uDAO.listar2();
        uDAO.desconectar();

    }catch(Exception e){
        out.print("Erro: "+e);
    }

        ArrayList<Usuario> lista3 = new ArrayList<Usuario>();
    try{
        UsuarioDAO uDAO = new UsuarioDAO();
        uDAO.conectar();
        lista3 = uDAO.listar3();
        uDAO.desconectar();

    }catch(Exception e){
        out.print("Erro: "+e);
    }
         

    %>
<html>
    <head>
        <meta charset="utf8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="inserir.css">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Inserir Eventos</title>
    </head>
    <body>
        <%@include file="banner.jsp" %> <%@include file="verifica_login.jsp" %>
        
        <div id="formulario">
            <h1>Novo Eventos</h1>
        <form method="post" action="inserir_eventos.do">
            <fieldset>
                <legend>Dados do Evento</legend>
                Tema: <input type="Text" name="tema"><br>
                Quantidade de Convidados: <input type="number" min="50" name="quantidadeDeConvidados"><br>
               
                Horario: <input type="text" name="horario"><br>
              
                Valor: <input type="text" name="valor"><br>
                 Data: <input type="date" name="data"><br>
                 Situação: <input type="text" name="situacao" list="situacao" required>
                 <datalist id="situacao">
                <option value="agendado" ></option>
                </datalist><br>
              
                Buffet: <input type="text" name="buffet_id" list="buffet" required>
                <datalist id="buffet">
                      <%
               for(Buffet m:lista){ %>
                <option value="<%=m.getId() %>"><%=m.getNome()%></option>
                <%
                }
                %>
                </datalist><br>
                Cliente: <input type="text" list="cliente" name="cliente_id" required>
                <datalist id="cliente"> 
                      <%
               for(Cliente m:lista2){ %>
                <option value="<%=m.getId() %>"><%=m.getNome()%></option>
                <%
                }
                %>
                </datalist><br>
                local: <input type="text" list="salao" name="salao_id" required>
                <datalist id="salao">
                      <%
               for(Salao m:lista1){ %>
                <option value="<%=m.getId() %>"><%=m.getNome()%></option>
                <%
                }
                %>
                </datalist><br>
 
 
 
                Usuario: <input type="text" list="usuario" name="usuario_id" required>
                <datalist id="usuario">
                      <%
               for(Usuario m:lista3){ %>
                <option value="<%=m.getId() %>"><%=m.getNome()%></option>
                <%
                }
                %>
                </datalist><br>
    <button type="submit">Continuar</button>&nbsp;&nbsp;<button type="reset">Limpar</button>
            </fieldset>
 
        </form>
                <br><br><br><br><br>
        </div>
                <div id="menu">
                    <h3 id="menu"> <a href="index.jsp">M<br>E<br>N<br>U<br>  </h3></a>     
                </div> 
        
    </body>
</html>
