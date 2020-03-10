<%@page import="config.Conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DTOMarca"%>
<%@page import="modeloDAO.DAOMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Consultar Marca</title>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css"/>
    </head>

    <body>
        <div class="lead" style="font-size: 15px;">
            <small>
                <a href="">Inicio</a> > <a href="">Materiales y Herramientas</a> > <a href="">Consultar Marca</a>
                <hr style="background-color: gold; width: 100%">
            </small>
        </div>
        <div class="container-fluid">
            <h1 class="h2 text-center my-5" style="font-family: Microsoft YaHei Light">CONSULTAR MARCAS</h1>
            <hr>
            <a class="btn btn-success" href="<%= request.getContextPath()%>/CtrMarca?accion=agregarMarca">Agregar nueva marca</a>
            <button  id="agregarNuevoII"class="btn btn-success " data-toggle="modal" data-target="#modalCarga" >Cargar datos <i class="fas fa-database"></i></button> 
            <hr>
            <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table col-md-12 table-condensed  table-hover table-striped table-bordered text-center">
                <thead class="thead-dark">
                    <tr>
                        <th>Marca</th>
                        <th class="th-sm">Editar</th>
                        <th class="th-sm">Eliminar</th>
                    </tr>
                </thead>
                <%
                    DAOMarca mrcaDAO = new DAOMarca();
                    List<DTOMarca> list = mrcaDAO.listar();
                    Iterator<DTOMarca> iter = list.iterator();
                    DTOMarca mrca = null;
                    while (iter.hasNext()) {
                        mrca = iter.next();

                %>
                <tbody>
                    <tr>
                        <td><%= mrca.getNombre()%></td>
                        <td>
                            <a class="btn btn-outline-info" href="<%= request.getContextPath()%>/CtrMarca?accion=editarMarca&Id_marca=<%= mrca.getId_marca()%>"><i class="fas fa-edit"></i></a>
                        </td>
                        <td>
                            <!-- <a onclick="swaldelete()" class="btn btn-outline-danger"><i class="fas fa-trash-alt"></i></a> -->
                            <a class="btn btn-outline-danger" href="<%= request.getContextPath()%>/CtrMarca?accion=eliminarMarca&Id_marca=<%= mrca.getId_marca()%>"><i class="fas fa-trash-alt"></i></a>
                        </td>                            
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <button class="btn btn-outline-success" style="margin-bottom: 10px" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><i class="fas fa-file-excel"></i> Exportar Excel</button>
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
                                        <h3 id="registrarinventarioIIRe" style=" font-size: 2.1em">Cargar datos.</h3>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <form id="frm_cargaDatos"  enctype="multipart/form-data" method="post">
                                        <center>
                                            <div class="field">
                                                <label class="letra" >Adjuntar archivo</label>
                                                <div class="inputs">
                                                    <input type="hidden" name="marca" value="upload">
                                                    <input class="btn btn-success" style="background: #fff; color: #000; width: 100%; border: 1px solid #000" type="file" name="fichero" size="70" accept="text/plain;image/jpeg">
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
        
        <!-- SCRPTS -->
        <script src="<%= request.getContextPath()%>/js/tableToExcel.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <!--<script>
            function swaldelete() {
                swal({
                    title: "¿Está seguro de Eliminarlo?", text: "Esta operación es irreversible", icon: "warning", buttons: {cancel: "Cancelar", confirm: "Eliminar",
                    }, dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                location.href = "<%= request.getContextPath()%>/CtrMarca?accion=eliminarMarca&Id_marca=<%= mrca.getId_marca()%>";
                                                    } else {
                                                        swal("Operación Cancelada");
                                                    }
                                                }
                                                );
                                    }
        </script>-->
        <script>
                //********  FUNCIÓN AJAX PARA CARGA MASIVA DE DATOS.   ******************************************************************************************
                $('#btn_cargaDatos').click(function (e) {//                
                    e.preventDefault();
                    var datos = new FormData($('#frm_cargaDatos')[0]);
                    $("#frm_cargaDatos")[0].reset();
                    $("#modalCarga").modal("toggle");
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/CtrCargaMasivaDatos",
                        data: datos,
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            if (data == 1) {
                                setTimeout(function () {
                                    window.location = "<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarMrca";
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
    <!-- FIN DEL CUERPO -->
</html>
</body>
</html>