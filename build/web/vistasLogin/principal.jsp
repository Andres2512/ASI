<%-- 
    Document   : principal
    Created on : 28/07/2019, 08:12:24 PM
    Author     : Vannesa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
    
        <nav class="navbar navbar-dark bg-dark">
            <a style="color: white" class="navbar-toggler"><span class="navbar-toggler-icon"></span> Home</a>
            <div class="dropdown"> 
                <a style="color: white" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar sesion</a> 
                <div class="dropdown-menu text-center">
                    <a><img  src="<%=request.getContextPath()%>/img/login.jpg" height="80" width="80" ></a><br> 
                    <a>${Correo}</a>
                   
                  <div class="dropdown-divider"></div>
                    <a href="<%=request.getContextPath()%>/CtrLogin?accion=Salir" class="dropdown-item">Salir</a>

                </div>

            </div>
        </nav>
        <div class="cantiner nt-4">
            <h1>Inicio de sesión...<strong>Usuario: ${Correo}</strong></h1>   
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
