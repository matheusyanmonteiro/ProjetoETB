
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Index</title>
          <style>
              p{
               position:absolute;
               width:95%;
               top: 1000px;
               text-align: center;    
              }
    </style>
    </head>
    <body>
       
        <div id="interface">
        <%@include file="banner.jsp" %>
         <%@include file="verifica_login.jsp" %>
        <%@include file="menu.jsp" %>
        
        <br><br><br><br><br>
         <p>   &COPY;  2016 AQUARELLA EVENTOS | TODOS OS DIREITOS RESERVADOS    </p>
        </div>
        
       
    </body>
</html>
