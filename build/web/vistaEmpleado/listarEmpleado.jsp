<%@page import="java.util.Iterator"%>
<%@page import="modelo.DTOUsuario"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.DAOUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 ">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    Empleados
                </div>
                <div class="card-body" style="margin-left: -30px;">
                    <a class="btn btn-success" href="<%= request.getContextPath()%>/CrtUsuario?accion=addEmpleado">Agregar Empleado</a>
                    <button  id="agregarNuevoII"class="btn btn-success " data-toggle="modal" data-target="#modalCarga" >  Cargar datos   <i class="fas fa-database"></i></button> 
                    <table border="1" class="table table-striped table-bordered table-sm" >
                        <thead>
                            <tr>
                                <th class="th-sm">Nombres</th>
                                <th class="th-sm">Apellidos</th>
                                <th class="th-sm">Celular</th> 
                                <th class="th-sm">Teléfono</th>
                                <th class="th-sm">Correo electrónico</th>
                                <th class="th-sm">Dirección</th>
                                <th class="th-sm">Ciudad</th>
                                <th class="th-sm">Código Proyecto</th>
                                <th class="th-sm">Contraseña</th>  
                                <th class="th-sm">Editar</th>
                                <th class="th-sm">Eliminar</th>
                            </tr>
                        </thead>


                        <%
                            DAOUsuario dao = new DAOUsuario();
                            List<DTOUsuario> list = dao.listar();
                            Iterator<DTOUsuario> iter = list.iterator();
                            DTOUsuario usu = null;
                            while (iter.hasNext()) {
                                usu = iter.next();


                        %>
                        <tbody>
                            <tr>

                                <td><%=usu.getNombres()%></td>
                                <td><%=usu.getApellidos()%></td>
                                <td><%=usu.getNumero_celular()%></td>
                                <td><%=usu.getNumero_telefono()%></td>
                                <td><%=usu.getCorreo()%></td>
                                <td><%=usu.getDireccion()%></td>
                                <td><%=usu.getRoles_Id_roles()%></td>
                                <td><%=usu.getCiudades_Id_ciudades()%></td>
                                <td><%=usu.getProyecto_Id_proyecto()%></td>
                                <td>
                                    <a class="btn btn-warning" href="CrtUsuario?accion=Editar&Id_usuario=<%=usu.getId_usuario()%>" style="margin-bottom: 10px;"><i class="fas fa-edit"></i></a>
                                </td>   
                                <td> 
                                    <a  onclick="alerta()" class="btn btn-danger" id="ejemplo" target=""><i class="fas fa-trash-alt"></i></a> 
                                </td>

                            </tr>
                        <script>
                            function alerta()
                            {
                                var mensaje;
                                var opcion = confirm("¿Está seguro de remover el registro?");
                                if (opcion === true) {
                                    location.href = "<%= request.getContextPath()%>/CrtUsuario?accion=Eliminar&Id_usuario=<%= usu.getId_usuario()%>";
                                            } else {
                                                location.href = "<%= request.getContextPath()%>/CrtUsuario?accion=listar";
                                            }
                                            document.getElementById("ejemplo").innerHTML = mensaje;
                                        }
                        </script>
                        </tbody>
                        <% }%>
                    </table>
                    <div>
                        <button class="btn btn-outline-success" style="margin-bottom: 10px" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal cargar datos-->
        <div class="modal fade" id="modalCarga" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-md"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-topp">
                                    <div class="myform-top-left">
                                        <br>
                                        <h3 id="registrarinventarioIIRe" style="font-size: 2.1em">Cargar datos.</h3>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <form id="frm_cargaDatos"  enctype="multipart/form-data" method="post">
                                        <center>
                                            <div class="field">
                                                <label class="letra" >Adjuntar archivo</label>
                                                <div class="inputs">
                                                    <input type="hidden" name="marca" value="upload">
                                                    <input style="background: #fff; color: #000; width: 100%; border: 1px solid #000" class="btn btn-success" type="file" name="fichero" size="70" accept="text/plain;image/jpeg">
                                                </div>
                                            </div>  
                                            <div class="modal-footer">
                                                <button id="cancelarIIRe" type="button" class="btn btn-outline-danger" data-dismiss="modal" id="guardarnuevo">
                                                    Cancelar
                                                </button>
                                                <input type="submit" id="btn_cargaDatos" class="btn btn-outline-success" value="cargar Datos">
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
                            //********  FUNCCION AJAX PARA CARGA MASIVA DE DATOS.   ******************************************************************************************
                            $('#btn_cargaDatos').click(function (e) {//                
                                e.preventDefault();
                                var datos = new FormData($('#frm_cargaDatos')[0]);
                                $("#frm_cargaDatos")[0].reset();
                                $("#modalCarga").modal("toggle");
                                $.ajax({
                                    type: "POST",
                                    url: "<%=request.getContextPath()%>/CtrCargaMasivaUsuario",
                                    data: datos,
                                    contentType: false,
                                    processData: false,
                                    success: function (data) {
                                        if (data == 1) {
                                            setTimeout(function () {
                                                window.location = "<%=request.getContextPath()%>/CtrGeneral?accion=ListarTrabajador";
                                            }, 2500);
                                            Swal.fire({
                                                type: 'success',
                                                title: '¡Carga masiva de datos exitosa! ',
                                                width: 500,
                                                padding: '5em',
                                                showConfirmButton: false,
                                                timer: 3000 //el tiempo que dura el mensaje en ms
                                            });
                                            listar();
                                        } else if (data == 2) {
                                            Swal.fire({
                                                type: 'error',
                                                title: '¡Error, revise los datos a subir! ',
                                                text: 'Inténtelo de nuevo',
                                                width: 500,
                                                padding: '5em',
                                                showConfirmButton: false,
                                                timer: 4000 //el tiempo que dura el mensaje en ms
                                            });
                                        } else {
                                            Swal.fire({
                                                type: 'error',
                                                title: '¡Error, no se pudo cargar los datos! ',
                                                text: 'Inténtelo de nuevo',
                                                width: 500,
                                                padding: '5em',
                                                showConfirmButton: false,
                                                timer: 4000 //el tiempo que dura el mensaje en ms
                                            });
                                        }
                                    }
                                });

                            });
        </script>
    </body>
</html>