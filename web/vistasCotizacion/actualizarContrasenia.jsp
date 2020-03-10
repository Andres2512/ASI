<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>A$I - Ingrese</title>
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/A$I_png-logo.png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssLogin.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
     <%
        Object[] codigo = (Object[]) session.getAttribute("codigoSesion");
    %>
    <body>
        <nav style="background: #F09D1E" class="navbar scrolling-navbar stiky navbar-expand-lg navbar-dark ">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="<%=request.getContextPath()%>/img/A$I_png-nombre.png" alt="" width="35%" height="35%"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a id="paginaPrinci" class="nav-link logPrinc" data-scroll href="<%= request.getContextPath()%>/CtrGeneral?accion=Inicio">PÁGINA PRINCIPAL</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container my-3 card col-lg-3 sharp">
            <h5 class="card-header warning-color text-center py-4">
                <strong id="inicesioSes" style="color: black">Actualizar contraseña</strong>
            </h5>
            <div class="card-body col-md-12">
                <form action="<%= request.getContextPath()%>/RecuperarCuentaControlador" method="POST">
                    <div class="form-group text-center">
                        <img src="<%=request.getContextPath()%>/img/A$I_png-nombre.png" width="80"/>
                    </div>
                    <div class="form-group px-3">
                        <br>
                        <div class="md-form">
                            <input type="password" class="form-control focus" name="contrasenia" title="Introduzca una nueva contraseña" />
                            <label id="correo" class="gris">Nueva contraseña</label>
                        </div>
                        <div class="md-form">
                            <input type="password" class="form-control focus" name="repeatContrasenia" title="Vuelva a ingresar la contraseña"/>
                            <label id="contrasena" class="gris">Vuelva a ingresar la contraseña</label>
                            <input value="<%out.print(codigo[1]);%>" type="hidden" name="correo">
                            <br>
                        </div>
                        <div>
                            <input class="btn btn-warning btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit" id="validar" value="Actualizar" name="accion"/>
                        </div>
                        <br>
                        <center>
                            <button type="button" id="traductorLogin" class="btn btn-outline-info">ENG</button>
                            <button type="button" id="traductorEspLogin" class="btn btn-outline-primary">ESP</button>
                        </center>
                    </div>
                </form>
            </div>
        </div>                    
        
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>           
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.js"></script>
    </body>
</html>
