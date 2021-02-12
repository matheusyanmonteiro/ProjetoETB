<%-- 
    Document   : login
    Created on : 13/10/2016, 14:57:08
    Author     : Pessoal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf8">
         <link rel="stylesheet" type="text/css" href="inserir.css">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
         <style>
            div#formulario1{
    position: absolute;
    top: 300px;
    left: 500px;
} 
        div#formulario1 h1{
    position:relative;
    text-align: center;
}
header#cabecalho1 img#icone1 {
	position: absolute;
	left: 450px ;
	top: 0px;
	}
    </style>
    </head>
    <body>
       <div id="banner1">
     <header id="cabecalho1">
    <img id="icone1" src="imagens/logo_aquarella2.png"/>
     </header>
</div>
         <div id="formulario1">
        <fieldset>
            <div id="img" align="center">
                <img src="imagens/login.png"><br> 
        
          
               <form method="post" action="valida_login.do">
                     <table>
            Login: <input type="text" name="login" required><br>
            Senha: <input type="password" name="senha" required><br>
           <br> <button type="submit" >Entrar</button>
            </table>
           
         </fieldset>  
        </form></div>
             
                   
           </div>  
         <p style="position: absolute; 
            top: 600px;
            left: 400px;">   &COPY;  2016 AQUARELLA EVENTOS | TODOS OS DIREITOS RESERVADOS    </p>
         
    </body>
</html>