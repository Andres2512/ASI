<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>A$I - Registrese</title>
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/A$I_png-logo.png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssRegistro.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
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
                            <a id="paginaPrinci" class="nav-link logPrinc prba" data-scroll href="<%= request.getContextPath()%>/CtrGeneral?accion=Inicio">PÁGINA PRINCIPAL</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container my-3 card col-lg-3 col-md-6 col-sm-6 sharp">
            <h5 class="card-header warning-color text-center py-4">
                <strong id="inicesioSes" style="color: black">Registrar</strong>
            </h5>
            <div class="card-body col-md-12">
                <form action="<%=request.getContextPath()%>/CrtUsuario">
                    <div class="form-group text-center">
                        <img src="<%=request.getContextPath()%>/img/A$I_png-nombre.png" width="80"/>
                    </div>
                    <div class="form-group px-3">
                        <br>
                        <div class="md-form">
                            <input type="text" class="form-control focus" name="txtNombre" maxlength="54" pattern="[a-zA-Z]" title="Introduce tu nombre" placeholder="Nombre" required/>
                            <label class="gris">Nombre(s)</label>
                        </div>
                        <br>
                        <div class="md-form">
                            <input type="text" class="form-control focus" name="txtApellidos" maxlength="54" pattern="[a-zA-Z]" title="Introduce tus apellidos" placeholder="Apellidos" required/>
                            <label class="gris">Apellidos</label>
                        </div>
                        <br>
                        <div class="md-form">
                            <input type="text" class="form-control focus" name="txttxtCelular" maxlength="15" pattern="[0-9]" title="Introduce un Celular Valido" placeholder="ejemplo: 3175985234" required/>
                            <label class="gris">Celular</label>
                        </div>
                        <br>
                        <div class="md-form">
                            <input type="email" class="form-control focus" name="txtTelefono" maxlength="15" pattern="[0-9]" title="Introduce un Telefono Valido" placeholder="ejemplo: 7044729" required/>
                            <label class="gris">Telefono</label>
                        </div>
                        <br>
                        <div class="md-form">
                            <input type="email" class="form-control focus" name="txtCorreo" maxlength="254" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" title="Introduce un Correo Valido" placeholder="example@asi.com" required/>
                            <label class="gris">Correo</label>
                        </div>
                        <br>
                        <div class="md-form">
                            <input type="text" class="form-control focus" name="txtDireccion" maxlength="100" pattern="[a-zA-Z0-9]{5,100}" title="Introduce una Dirección" placeholder="Calle 0 # 0-0" required/>
                            <label class="gris">Dirección</label>
                        </div>
                        <br>
                        <div class="md-form">
                            <input type="text" class="form-control focus" name="txtProyecto" maxlength="2" pattern="[0-9]" title="Introduce Id del Proyecto" placeholder="Id del Proyecto" required/>
                            <label class="gris">Proyecto</label>
                        </div>
                        <br>
                        <div class="md-form">
                            <input type="password" class="form-control focus" name="txtContrasenia" pattern="[A-Z-a-z0-9!?-]{8,15}" title="Ingrese su Contraseña" placeholder="****" required/>
                            <label class="gris">Contraseña</label>
                        </div>
                        <div class="md-form">
                            <input type="text" style="visibility: hidden" class="form-control focus" name="txtRol" value="2" maxlength="2" pattern="[0-9]" required/>
                            <label class="gris">Rol: <i>Cliente</i></label>
                            <p style="font-size: 10px; color: black">Si su registro es como Contratista o Administrador, comuniquese con nosotros.</p>
                        </div>
                        <div class="md-form">
                            <input type="text" style="visibility: hidden" class="form-control focus" name="txtCiudad" value="1" maxlength="2" pattern="[0-9]" required/>
                        </div>
                        <div>
                            <a class="text-primary" href="<%=request.getContextPath()%>/vistasLogin/login.jsp" id="olvidoCont">¿Ya tiene una cuenta?</a>
                        </div>
                        <div>
                            <input class="btn btn-warning btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit" id="btn_ingresar" name="accion" value="AgregarLogin"/>
                        </div>
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
