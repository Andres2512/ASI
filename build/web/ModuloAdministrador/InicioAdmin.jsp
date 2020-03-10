<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession(true);
    Object correo = sesion.getAttribute("correo") == null ? null : sesion.getAttribute("correo");
    String rol = sesion.getAttribute("rol").toString();
    String Id_usuario = sesion.getAttribute("Id_usuario").toString();
    if (sesion != null) {
        if (correo != null) {
            if (!rol.equalsIgnoreCase("1")) {
                response.sendRedirect("../vistasLogin/login.jsp");
            }
        } else {
            response.sendRedirect("../vistasLogin/login.jsp");
        }
    } else {
        response.sendRedirect("../vistasLogin/login.jsp");
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>A$I - Administrador</title>
        <link rel="shortcut icon" href="<%= request.getContextPath()%>/img/A$I_png-logo.png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="<%=request.getContextPath()%>/css/cssAdmin.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <div class="wrapper">
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h4 style="font-size: 1.3em">ELIAZAR<br>CONSTRUCCIONES S.A.S</h4>
                </div>
                <ul style="font-size: 0.85em" class="list-unstyled components">
                    <p style="font-weight: bold; color: #F29F14" class="lead">Administrador</p>
                    <li>
                        <a href="#mSub1" data-toggle="collapse" aria-expanded="false" class="mt-5 dropdown-toggle">Cotización y Seguimiento</a>
                        <ul class="collapse list-unstyled" id="mSub1">
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=ListarProyecto" target="workSection">Proyecto</a>
                            </li>          
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=ListarCiudades" target="workSection">Ciudades</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=ListarTipo_Estado" target="workSection">Tipos de estados</a>
                            </li>
                        </ul> 
                    </li>
                    <li>
                        <a href="#mSub2" data-toggle="collapse" aria-expanded="false" class="mt-3 dropdown-toggle">Asignación de Recursos</a>
                        <ul class="collapse list-unstyled" id="mSub2">
                            <li>
                                <a href="<%=request.getContextPath()%>/CtrGeneral?accion=listarViaticos" target="workSection">Consultar viaticos</a>
                            </li>
                        </ul> 
                    </li>

                    <li>
                        <a href="#mSub3" data-toggle="collapse" aria-expanded="false" class="mt-3 dropdown-toggle">Materiales y Herramientas</a>
                        <ul class="collapse list-unstyled" id="mSub3">
                            <li>
                                <a href="<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarHta" target="workSection">Herramientas</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarMtl" target="workSection">Materiales</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarTipoHta" target="workSection">Tipos de herramientas</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarTipoMtl" target="workSection">Tipos de materiales</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarMrca" target="workSection">Marcas</a>
                            </li>
                        </ul> 
                    </li>
                    <li>
                        <a href="#mSub4" data-toggle="collapse" aria-expanded="false" class="mt-3 dropdown-toggle">Gestionar pqrs</a>
                        <ul class="collapse list-unstyled" id="mSub4">

                            <li>
                                <a href="<%=request.getContextPath()%>/redireccionamientoPqrs" target="workSection">Gestionar pqrs</a>
                            </li>
                        </ul> 
                    </li>
                </ul>

                <footer class="row align-items-end">
                    <ul class="list-unstyled CTAs">
                        <li>
                            <a href="<%= request.getContextPath()%>/CtrGeneral?accion=Inicio" class="btn-dark">Salir a la página Principal</a>
                        </li>
                    </ul>
                </footer>
            </nav>




            <!-- BUTTON SIDEBAR -->
            <div class="container-fluid">

                <!-- NAV -->      

                <nav class="px-2 navbar navbar-expand-lg navbar-light bg-light">
                    <button type="button" id="sidebarCollapse" class="btn btn-warning">
                        <i class="fas fa-caret-left"></i> I <i class="fas fa-caret-right"></i>
                    </button>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">

                        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                            <li class="nav-item active">
                                <a class="nav-link ml-4" href="<%= request.getContextPath()%>/ModuloAdministrador/InicioAdmin.jsp">INICIO<span class="sr-only">(current)</span></a>
                            </li>
                        </ul>

                        <div class="btn-group px-1">
                            <button type="button" class="btn btn-secondary" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right"><hr>
                                <a class="dropdown-item" data-toggle="modal" id="btnperfillll" data-target="#modalEditarPerfil"><i class="fas fa-user-cog"></i> Perfil</a>
                                <a href="<%=request.getContextPath()%>/CtrLogin?accion=Salir" class="dropdown-item"><i class="fas fa-power-off"></i> Salir</a>
                            </div>
                        </div>
                    </div>
                </nav>

                <!-- END NAV -->

                <!-- MAIN -->      
                <div style="margin-top: -38px" role="main" class="col-md-12 ml-sm-auto col-lg-12 px-2">
                    <section class="">
                        <iframe name="workSection" src="Bienvenido.jsp"></iframe>
                    </section> 
                </div>

            </div>
        </div>
        <!--   *************** MODAL PARA CAMBIAR LA CONTRASEÑA DEL USUARIO QUE INICIO SESIÓN  ********-->
        <div class="modal fade" id="modalcontrasenaIguales" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-md"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top">
                                    <h3 id="nuevorendimientorendire"style="font-family: cursive; font-weight: 600; font-size: 1.9em">Cambio contraseña</h3>
                                </div>
                                <div class="card-body">
                                    <form id="frm_clavesIguales"  method="POST">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">                                                    
                                                    <div class="col-md-12">
                                                        <label id="golesrendire"class="letra" for="lastName">Ingresar contraseña nueva</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="password" name="txtcontraseñaNueva" id="password" class="form-control" placeholder="Contraseña nueva" >
                                                    </div>  
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">                                                    
                                                    <div class="col-md-12">
                                                        <label id="golesrendire"class="letra" for="lastName">Repetir contraseña</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="password" name="txtrepetirContraseña"  class="form-control" placeholder="Repetir contraseña" >
                                                    </div>  
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button id="cancelarrendire"type="button" class="btn btn-outline-danger"  data-dismiss="modal" >
                                                    Cancelar
                                                </button>
                                                <button  class="btn btn-outline-success" id="btn_clavesIguales" >Cambiar Contrasena</button>
                                                <!--<button type="submit" id="btnEditarPerfilModal" class="btn btn-outline-success agregarrendimire">Actualizar datos</button>-->  
                                            </div>
                                        </center>
                                    </form>                            
                                </div>
                            </div>  
                        </div>
                    </div>          
                </div>
            </div>
        </div>

        <!--   ****************** MODAL PARA VALIDAR LA CONTRASEÑA DEL USUARIO QUE INICIO SESIÓN   **********-->
        <div class="modal fade" id="modalCambioConstraseñaUser" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-md"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top">
                                    <h3 id="nuevorendimientorendire"style="font-family: cursive; font-weight: 600; font-size: 1.9em">Cambio contraseña</h3>
                                </div>
                                <div class="card-body">
                                    <form id="frm_claveeeee"  method="POST">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">                                                    
                                                    <div class="col-md-12">
                                                        <label id="golesrendire"class="letra" for="lastName">Ingresar contraseña actual</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="password" name="txtvalidacionContrasenaaaa"  class="form-control" placeholder="Contraseña actual" >
                                                    </div>  
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button id="cancelarrendire"type="button" class="btn btn-outline-danger"  data-dismiss="modal" >
                                                    Cancelar
                                                </button>
                                                <button  id="btn_claveeeee" class="btn btn-outline-success" >Validar contraseña</button>
                                                <!--<button type="submit" id="btnEditarPerfilModal" class="btn btn-outline-success agregarrendimire">Actualizar datos</button>-->  
                                            </div>
                                        </center>
                                    </form>                            
                                </div>
                            </div>  
                        </div>
                    </div>          
                </div>
            </div>
        </div>

        <!-- ************* MODAL PARA ACTUALIZAR LOS DATOS DEL USUARIO QUE INICIO SESIÓN  ************-->
        <div class="modal fade" id="modalEditarPerfil" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top">
                                    <br>
                                    <h3 id="nuevorendimientorendire"style="font-family: cursive; font-weight: 600; font-size: 2.1em">Actualizar datos personales.</h3>
                                </div>
                                <div class="card-body">
                                    <form id="frm_EdiatarPerfil"  method="POST">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">                                                    
                                                    <div class="col-md-6">
                                                        <label id="golesrendire"class="letra" for="lastName">Nombres</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttPrimerNombre" id="primerNombreModal" class="form-control" placeholder="Nombres" >
                                                    </div>                                                   
                                                    <div class="col-md-6">
                                                        <label id="asistenciaremndire"class="letra" for="inputPassword">Apellidos</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttSegundoNombreee" id="segundoNombreModal" class="form-control" placeholder="Apellidos">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label id="tiempojugadorendire"class="letra" for="tiempojugado">Número celuar</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttPrimerApellidooo" id="primerApellidoModalll" class="form-control" placeholder="Número celuar">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label id="tiempojugadorendire"class="letra" for="tiempojugado">Número telefónico</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif"  type="text" name="txttSegundoApellido" id="segundoApellidoModal" class="form-control" placeholder="Número telefónico">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label class="letra" id="tarjetasrpojasrendire"for="tarjetasRojas">Correo</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttCulularrr" id="celularModal" class="form-control" placeholder="Correo">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="letra" tarjetasamarillasrendire for="tarjetasAmarillas">Dirección</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" name="txttTelefonoo" id="telefonoModal" class="form-control" placeholder="Dirección">
                                                    </div>
                                                </div>
                                            </div>

                                            <button id="claveeeeeeeeeeee" type="submit"  style="float: left" class="btn btn-dark">Cambiar contraseña</button>
                                            <div class="modal-footer">
                                                <button id="limpiarrenidre"type="reset" class="btn btn-outline-info"  >
                                                    Limpiar
                                                </button>
                                                <button id="cancelarrendire"type="button" class="btn btn-outline-danger"  data-dismiss="modal" >
                                                    Cancelar
                                                </button>
                                                <button type="submit" id="btnEditarPerfilModal" class="btn btn-outline-success agregarrendimire">Actualizar datos</button>  
                                            </div>
                                        </center>
                                    </form>                            
                                </div>
                            </div>  
                        </div>
                    </div>          
                </div>
            </div>
        </div>
        <!-- SCRPTS -->
        <script src="<%= request.getContextPath()%>/js/tableToExcel.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/js/ShowHide.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath()%>/js/swalDelete.js" type="text/javascript"></script>        
        <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script>
            //FUNCION PARA LLENAR EL MODAL DE ACTUALIZACION DEL USUARIO LOGEADO
            $(document).on('click', 'a#btnperfillll', function (e) {
                e.preventDefault();
                var numeroDocuemto = <%= Id_usuario%>;
                var data = {numeroDocuemto: numeroDocuemto};
                $.ajax({
                    url: "<%=request.getContextPath()%>/CrtPqrs?accion=modalEditarPerfil&numeroDocumentoModalEdit=" + numeroDocuemto + "",
                    type: "post",
                    data: data,
                    dataSrc: "datos",
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        $.each(data.datos, function (i, field) {
                            $('#idU').val(numeroDocuemto);
                            $('#primerNombreModal').val(field.primerNombreModal);
                            $('#segundoNombreModal').val(field.segundoNombreModal);
                            $('#primerApellidoModalll').val(field.primerApellidoModal);
                            $('#segundoApellidoModal').val(field.segundoApellidoModal);
                            $('#celularModal').val(field.celularModal);
                            $('#telefonoModal').val(field.telefonoModal);
                        });
                    }
                });
            });
        </script>
        <script>
            $(function () {
                // FUNCION AJAX PARA ACTUALIZAR LOS DATOS DEL USUARIO QUE INICIO SESIÓN
                $('#btnEditarPerfilModal').click(function (e) {
                    e.preventDefault();
                    var datos = $('#frm_EdiatarPerfil').serialize();
                    $("#modalEditarPerfil").modal("toggle");
                    var numeroDocumento = <%= Id_usuario%>;
                    $.ajax({
                        url: "<%=request.getContextPath()%>/CrtPqrs?accion=ActualizarDatosPerfil&numeroDocumnetoPerfil=" + numeroDocumento + "",
                        type: "POST",
                        data: datos,
                        success: function (data) {
                            if (data == 1) {
                                Swal.fire({
                                    type: 'success',
                                    title: '¡ Datos actualizados exitosamente ! ',
                                    width: 500,
                                    padding: '1em',
                                    confirmButtonColor: '#11a621',
                                    showConfirmButton: true,
                                    timer: 2500
                                });
                            } else if (data == 0) {
                                Swal.fire({
                                    type: 'error',
                                    title: '¡ Error al actualizar los datos ! ',
                                    text: 'Inténtelo de nuevo',
                                    width: 500,
                                    confirmButtonColor: '#11a621',
                                    padding: '1em',
                                    showConfirmButton: false,
                                    timer: 2500 //el tiempo que dura el mensaje en ms
                                });
                            } else {

                            }
                        }
                    });
                });
            });</script>

        <script>
            //FUNCCION JQUERY PARA ABRIR EL MODAL DE VALIDACION DE CONTRASEÑA
            $(document).on('click', 'button#claveeeeeeeeeeee', function (e) {
                e.preventDefault();
                $("#modalEditarPerfil").modal("toggle");
                $("#modalCambioConstraseñaUser").modal("show");
            });
            $(function () {
                // FUNCION AJAX PARA VALIDAR LA CONTRASEÑA DEL USUARIO QUE INICIO SESIÓN
                $('#btn_claveeeee').click(function (e) {
                    e.preventDefault();
                    var datos = $('#frm_claveeeee').serialize();
                    $("#frm_claveeeee")[0].reset();
                    var numeroDocumento = <%= Id_usuario%>;
                    $.ajax({
                        url: "<%=request.getContextPath()%>/CrtPqrs?accion=cambioContrasena&cedulaIngreso=" + numeroDocumento + "",
                        type: "POST",
                        data: datos,
                        success: function (data) {
                            if (data == 1) {
                                $("#modalCambioConstraseñaUser").modal("toggle");
                                $("#modalcontrasenaIguales").modal("show");
                            } else {
                                Swal.fire({
                                    type: 'error',
                                    title: '¡ Error, contraseña invalida ! ',
                                    text: 'Inténtelo de nuevo',
                                    width: 500,
                                    confirmButtonColor: '#11a621',
                                    padding: '1em',
                                    showConfirmButton: false,
                                    timer: 2500 //el tiempo que dura el mensaje en ms
                                });
                            }
                        }
                    });
                });
                // FUNCION AJAX PARA ACTUALIZAR CONTRASEÑA DEL USUARIO QUE INICIO SESIÓN
                $('#btn_clavesIguales').click(function (e) {
                    e.preventDefault();
                    var datos = $('#frm_clavesIguales').serialize();
                    $("#frm_clavesIguales")[0].reset();
                    $("#modalcontrasenaIguales").modal("toggle");
                    var numeroDocumento = <%=Id_usuario%>;
                    $.ajax({
                        url: "<%=request.getContextPath()%>/CrtPqrs?accion=nuevaContrasena&cedulaIngresoooo=" + numeroDocumento + "",
                        type: "POST",
                        data: datos,
                        success: function (data) {
                            if (data == 1) {
                                Swal.fire({
                                    type: 'success',
                                    title: '¡ Contraseña actualizada exitosamente ! ',
                                    width: 500,
                                    padding: '1em',
                                    confirmButtonColor: '#11a621',
                                    showConfirmButton: true,
                                    timer: 2500
                                });
                            } else {
                                Swal.fire({
                                    type: 'error',
                                    title: '¡ Error, no se cambio la contraseña ! ',
                                    text: 'Inténtelo de nuevo',
                                    width: 500,
                                    confirmButtonColor: '#11a621',
                                    padding: '1em',
                                    showConfirmButton: false,
                                    timer: 2500 //el tiempo que dura el mensaje en ms
                                });
                            }
                        }
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                });
            });
        </script>
    </body>
</html>
