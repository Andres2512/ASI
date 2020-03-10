<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DTOHerramientas"%>
<%@page import="modeloDAO.DAOHerramientas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Consultar Herramientas</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.19/css/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css"/>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.12.0/css/alertify.min.css"/>

    </head>

    <body>
        <div class="lead" style="font-size: 15px;">
            <small>
                <a href="">Inicio</a> > <a href="">Materiales y Herramientas</a> > <a href="">Consultar Herramientas</a>
                <hr style="background-color: gold; width: 100%">
            </small>
        </div>
        <div class="container-fluid">
            <h1 class="h2 text-center my-5" style="font-family: Microsoft YaHei Light">CONSULTAR HERRAMIENTAS</h1>
            <hr>
            <a class="btn btn-success" style="color: #fff" data-toggle="modal" data-target="#modalAgregar">Agregar Nuevo</a>
            <hr>
            <table id="example" class="table col-md-12 table-condensed  table-hover table-striped table-bordered text-center">
                <thead class="thead-dark">
                    <tr>
                        <th style="display:none;">ID</th>
                        <th>Herramienta</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Tipo de Herramienta</th>
                        <th class="th-sm">Añadir/Quitar</th>
                        <th class="th-sm">Editar</th>
                        <th class="th-sm">Eliminar</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            <button class="btn btn-outline-success" style="margin-bottom: 10px" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><i class="fas fa-file-excel"></i> Exportar Excel</button>


        </div>	

        <div class="modal fade" id="modalAgregar" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-xl"  role="document">
                <!--desde aqui se modifica el tamaño del modal--> 
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top" style="background: orange; height: 90px; border-radius: 20px 20px 0px 0px">
                                    <div class="myform-top-left ">
                                        <br><center>
                                            <h3 id="nuevorendimientorendire" style="font-size: 2.2em; font-weight: 600">Agregar herramientas</h3>
                                        </center>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form id="frm_Nuevo">
                                        <center>
                                            <div class="form-group">
                                                <label for="" class="control-label">Herramienta</label>
                                                <input type="text" pattern="[A-Za-z]{1,30}" maxlength="30" class="form-control" name="txtNombre" placeholder="Herramienta" required>
                                            </div>    

                                            <div class="form-group"> 
                                                <label for="" class="control-label">Descripción</label>
                                                <input type="text" maxlength="70" class="form-control" name="txtDescripcionHta" placeholder="Descripción" required>
                                            </div>

                                            <div class="form-group"> 
                                                <label for="" class="control-label">Precio</label>
                                                <input type="text" pattern="[0-9]{3,7}" minlength="3" maxlength="7" class="form-control" name="txtPrecio" placeholder="Precio" required>
                                            </div>

                                            <div class="form-group"> 
                                                <label for="" class="control-label">Cantidad</label>
                                                <input type="text" pattern="[0-9]{1,3}" class="form-control" name="txtCantidad" placeholder="Cantidad" required>
                                            </div>

                                            <div class="form-group"> 
                                                <label for="" class="control-label">Tipo de Herramienta</label>
                                                <input type="text" class="form-control" name="txtTipo_herramientas_Id_tipo_herramientas" placeholder="Tipo de Herramienta" required>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="limpiarrenidre"type="reset" class="btn btn-outline-info"  >
                                                    Limpiar
                                                </button>
                                                <button id="cancelarrendire"type="button" class="btn btn-outline-danger"  data-dismiss="modal" >
                                                    Cancelar
                                                </button>
                                                <input class="btn btn btn-outline-success" type="submit" id="btn_registrar" value="Agregar">
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

        <!--  *********************************  MODAL EDITAR  ***********************************-->
        <div class="modal fade" id="modalEditar" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-xl"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-top" style="background: orange; height: 90px; border-radius: 20px 20px 0px 0px">
                                    <div class="myform-top-left ">
                                        <br><center>
                                            <h3 id="nuevorendimientorendire" style="font-size: 2.2em; font-weight: 600">Actualizar Cotización</h3>
                                        </center>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form id="frm_Actualizar">
                                        <center>
                                            <div class="form-group">
                                                <label for="" class="control-label">ID</label>
                                                <input type="number" readonly="readonly" id="IdHerramienras" style="background:rgba(0,0,0,0.1)" class="form-control" name="txtId_herramientas"  placeholder="Id">    
                                            </div>

                                            <div class="form-group">
                                                <label for="" class="control-label">Herramienta</label>
                                                <input type="text" class="form-control" id="herramientas" name="txtNombre" placeholder="Herramienta">
                                            </div>    

                                            <div class="form-group"> 
                                                <label for="" class="control-label">Descripción</label>
                                                <input type="text" class="form-control" id="descripcion" name="txtDescripcionHta" placeholder="Descripción">
                                            </div>
                                            <div class="form-group"> 
                                                <label for="" class="control-label">Precio</label>
                                                <input type="text" id="precio" pattern="[0-9]{3,7}" class="form-control" name="txtPrecio"  placeholder="Precio">
                                            </div>

                                            <div class="form-group"> 
                                                <label for="" class="control-label">Cantidad</label>
                                                <input type="text" id="cantidad"pattern="[0-9]{1,3}" class="form-control" name="txtCantidad"  placeholder="Cantidad">
                                            </div>

                                            <div class="form-group"> 
                                                <label for="" class="control-label">Tipo de Herramienta</label>
                                                <input type="text" id="tipoHerramienta"class="form-control" name="txtTipo_herramientas_Id_tipo_herramientas"  placeholder="Tipo de Herramienta">
                                            </div>
                                            <br>                          
                                            <div class="modal-footer">
                                                <button id="limpiarrenidre"type="reset" class="btn btn-outline-info"  >
                                                    Limpiar
                                                </button>
                                                <button id="cancelarrendire"type="button" class="btn btn-outline-danger"  data-dismiss="modal" >
                                                    Cancelar
                                                </button>
                                                <input class="btn btn btn-outline-success" type="submit" id="btn_Actualizar" value="Actualizar">
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
        <!--***** **************      MODAL AÑADIR IMPLEMENTO  ******************************-->
        <div class="modal fade" id="modalAñadirImplemento" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-md"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-topp">
                                    <div class="myform-top-left">
                                        <br>
                                        <h3 id="registrarinventarioIIRe" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Añadir implementos.</h3>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <form id="frm_SumarImplementooo" >
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label class="letra" id="nombreImpleementoIIRe"for="nombreImplentooo">¿Cuantos implementos desea ingresar?</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text" id="nombreImplentooo" class="form-control" name="txtSumarImplemento"placeholder="Cantidad implemento(s)" >
                                                    </div>
                                                </div>
                                            </div>                                   
                                        </center>

                                        <div class="modal-footer">
                                            <button id="cancelarIIRe" type="button" class="btn btn-outline-danger" data-dismiss="modal" id="guardarnuevo">
                                                Cancelar
                                            </button>
                                            <a id="anadirSumaaaaaa" href="#"  type="submit" class="btn btn-outline-success anadirSumaaaaaaa" > 
                                                Agregar
                                            </a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--***** **************      MODAL QUITAR IMPLEMENTO  ******************************-->
        <div class="modal fade" id="modalQuitarImplemento" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-md"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-topp">
                                    <div class="myform-top-left">   
                                        <br>
                                        <h3 id="registrarinventarioIIRe" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Disminuir implementos.</h3>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <form id="frm_QuitarImplemento" method="POST">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label class="letra" id="nombreImpleementoIIRe"for="nombreImplentooo">¿Cuantos implementos desea Disminuir?</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" type="text"  class="form-control" name="txtRestaImplemento"placeholder="Cantidad implemento(s)" >
                                                    </div>
                                                </div>
                                            </div>                                   
                                        </center>

                                        <div class="modal-footer">
                                            <button id="cancelarIIRe" type="button" class="btn btn-outline-danger" data-dismiss="modal" id="guardarnuevo">
                                                Cancelar
                                            </button>
                                            <a id="QuitarImplement" href="#" type="submit" class="btn btn-outline-success agregarIIEE" > 
                                                Disminuir
                                            </a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .ajs-message.ajs-custom {
                color: #31708f;  
                background-color: #d9edf7;
                border-color: #31708f; 
            }
            .ajs-message.ajs-customm {
                color: #31708f;  
                background-color: #faefbe;
                border-color: #31708f; 
            }
        </style>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/traducirModulo.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.19/js/dataTables.bootstrap4.min.js"></script>
        <link href="<%= request.getContextPath()%>/js/sweetAlert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="<%= request.getContextPath()%>/js/sweetAlert2/sweetalert2.all.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.12.0/alertify.min.js"></script>

    </body>
    <script>
                $(document).ready(function () {
                    listar();
                    cantidad();
                });
                var cantidad = function () {
                    var data = "";
                    $.ajax({
                        url: "<%=request.getContextPath()%>/Administrador?accion=alertaImpelentoEscososHerra",
                        type: "POST",
                        data: data,
                        dataSrc: "datos",
                        dataType: "json",
                        success: function (data) {
                            if (data == 1) {
                                alertify.notify('Estos implementos están escasos ', 'customm', 9, function () {
                                    console.log('dismissed');
                                });
                            }
                        }
                    });
                    var data = "";
                    $.ajax({
                        url: "<%=request.getContextPath()%>/Administrador?accion=ListarImplementosEscasosHerra",
                        type: "POST",
                        data: data,
                        dataSrc: "datos",
                        dataType: "json",
                        success: function (data) {
                            $.each(data.datos, function (i, field) {
                                var nombre = field.nombreImplementoEscaso;
                                var cantidad = field.cantidadImplementoEscaso;
                                alertify.notify(i + 1 + ". " + nombre + ":  cantidad " + " " + cantidad, 'custom', 8, function () {
                                    console.log('dismissed');
                                });


                            });
                        }
                    });
                };
                var listar = function () {
                    var table = $("#example").DataTable({
                        responsive: true,
                        order: [[0, "desc"]],
                        destroy: true,
                        ajax: {
                            method: "POST",
                            url: "<%=request.getContextPath()%>/Administrador?accion=ListarHerramienta",
                            dataSrc: "datos"
                        },
                        columns: [
                            //{data: "getId_herramientas"},
                            {data: "getNombre"},
                            {data: "getDescripcion"},
                            {data: "getPrecio"},
                            {data: "getCantidad"},
                            {data: "getTipo_herramientas_Id_tipo_herramientas"},
                            {data: "sumarCantidad"},
                            {data: "Editar"},
                            {data: "Eliminar"}
                        ],
                        language: idiomaEsp
                    });
                };
    </script>
    <script>

//            $(function () {
////********  FUNCCION AJAX PARA REGISTRAR    ******************************************************************************************
        $('#btn_registrar').click(function (e) {
            e.preventDefault();//para que sea asincrono
            var datos = $('#frm_Nuevo').serialize();
            $("#frm_Nuevo")[0].reset();
            $("#modalAgregar").modal("toggle");
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/Administrador?accion=AgregarHerramientas",
                data: datos,
                success: function (data) {//La respuesta que se da desde el controlador
                    if (data == 1) {//funciona con el pout.print("1") del controlado Administrador
                        Swal.fire({
                            type: 'success',
                            title: '¡ Registro creado exitosamente ! ',
                            width: 500,
                            padding: '1em',
                            confirmButtonColor: '#11a621',
                            showConfirmButton: true,
                            timer: 2500
                        });
                        listar();
                    } else {
                        Swal.fire({
                            type: 'error',
                            title: '¡Error, el implemento ya esta registrado ',
                            text: 'Agrege la cantidad al implemento ',
                            width: 500,
                            confirmButtonColor: '#11a621',
                            padding: '5em',
                            showConfirmButton: false,
                            timer: 4000 //el tiempo que dura el mensaje en ms
                        });
                        listar();
                    }
                }
            });
        });
//});
//
////********  FUNCCION AJAX PARA ACTUALIZAR  ******************************************************************************************
        $('#btn_Actualizar').click(function (e) {
            e.preventDefault();
            var datos = $('#frm_Actualizar').serialize();
            $("#frm_Actualizar")[0].reset();
            $("#modalEditar").modal("toggle");
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/Administrador?accion=btnActualizarHta",
                data: datos,
                success: function (r) {
                    if (r == 1) {
                        Swal.fire({
                            type: 'success',
                            title: '¡ Registro creado exitosamente ! ',
                            width: 500,
                            padding: '1em',
                            confirmButtonColor: '#11a621',
                            showConfirmButton: true,
                            timer: 2500
                        });
                        listar();
                        listarValorFinalId();
                    } else {
                        Swal.fire({
                            type: 'error',
                            title: '¡Error, el implemento ya esta registrado ',
                            text: 'Agrege la cantidad al implemento ',
                            width: 500,
                            confirmButtonColor: '#11a621',
                            padding: '5em',
                            showConfirmButton: false,
                            timer: 4000 //el tiempo que dura el mensaje en ms
                        });
                        listar();
                    }
                }
            });
        });
        $(document).on('click', 'a.btnEditar', function (e) {
            fila = $(this).closest("tr");
            var correo = fila.find('td:eq(2)').text();
            $('#IdHerramienras').val(fila.find('td:eq(0)').text());
            $('#herramientas').val(fila.find('td:eq(1)').text());
            $('#descripcion').val(fila.find('td:eq(2)').text());
            $('#precio').val(fila.find('td:eq(3)').text());
            $('#cantidad').val(fila.find('td:eq(4)').text());
            $('#tipoHerramienta').val(fila.find('td:eq(5)').text());
        });

        $(document).on('click', 'a.btnEliminar', function (e) {
            var Id_herramientas = $(this).attr('id');
            var fila = $(this).parent().parent();
            e.preventDefault();
            var data = {Id_herramientas: Id_herramientas};
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: false
            });
            swalWithBootstrapButtons.fire({
                title: '¿Desea eliminar el registro con el ID ' + Id_herramientas + ' ? ',
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Si, Eliminar!',
                cancelButtonText: 'No, Cancelar!',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/Administrador?accion=eliminarHerramientas",
                        type: "POST",
                        data: data,
                        success: function (data) {
                            if (data == 1) {
                                Swal.fire(
                                        'Eliminado!',
                                        'El registro se ha eliminado exitosamente.',
                                        'success'
                                        );
                                listar();
                            } else {
                                Swal.fire({
                                    type: 'error',
                                    title: '¡Error al eliminar! ',
                                    text: 'Inténtelo de nuevo',
                                    width: 500,
                                    confirmButtonColor: '#11a621',
                                    padding: '5em',
                                    showConfirmButton: false,
                                    timer: 4000 //el tiempo que dura el mensaje en ms
                                });
                            }
                        }
                    });
                } else if (
                        /* Read more about handling dismissals below */
                        result.dismiss === Swal.DismissReason.cancel
                        )
                {
                    swalWithBootstrapButtons.fire(
                            'Cancelado',
                            'El registro no se ha eliminado.',
                            'error'
                            );
                }
            });
        });


        $(document).on('click', 'a.anadirSumaaaaaa', function (e) {
            e.preventDefault();
            var idMaterial = $(this).attr('id');
            $('#anadirSumaaaaaa').click(function () {
                $("#modalAñadirImplemento").modal("toggle");
                var datoss = $('#frm_SumarImplementooo').serialize();
                $("#frm_SumarImplementooo")[0].reset();
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/Administrador?accion=sumarImplementosHerra&idMaterial=" + idMaterial + "",
                    data: datoss,
                    success: function (data) {
                        if (data == 1) {
                            setTimeout(function () {
                                window.location = "<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarMtl";
                            }, 2000);
                            Swal.fire({
                                type: 'success',
                                title: '¡ Implementos agregados exitosamente ! ',
                                width: 500,
                                padding: '1em',
                                confirmButtonColor: '#11a621',
                                showConfirmButton: false,
                                timer: 4000
                            });
                        } else {
                            setTimeout(function () {
                                window.location = "<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarMtl";
                            }, 2000);
                            Swal.fire({
                                type: 'error',
                                title: '¡ Error al agregar implemento ! ',
                                text: 'Inténtelo de nuevo',
                                width: 500,
                                confirmButtonColor: '#11a621',
                                padding: '1em',
                                showConfirmButton: false,
                                timer: 4000 //el tiempo que dura el mensaje en ms
                            });
                        }
                    }
                });
            });
        });

////*******  FUNCCION AJAX PARA QUITAR LOS IMPLEMENTO.      *************************************************************************************
        $(document).on('click', 'a.btn_QuitarImpl', function (e) {
            e.preventDefault();
            var idMaterial = $(this).attr('id');
            $('#QuitarImplement').click(function () {
                $("#modalQuitarImplemento").modal("toggle");
                var datoss = $('#frm_QuitarImplemento').serialize();
                $("#frm_QuitarImplemento")[0].reset();
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/Administrador?accion=restarImplementoHerra&idMaterial=" + idMaterial + "",
                    data: datoss,
                    success: function (data) {
                        if (data == 1) {
                            setTimeout(function () {
                                window.location = "<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarMtl";
                            }, 2000);
                            Swal.fire({
                                type: 'success',
                                title: '¡ Implementos disminuidos exitosamente ! ',
                                width: 500,
                                padding: '1em',
                                confirmButtonColor: '#11a621',
                                showConfirmButton: false,
                                timer: 4000
                            });
                        } else {
                            setTimeout(function () {
                                window.location = "<%=request.getContextPath()%>/CtrGeneral?accion=ConsultarMtl";
                            }, 2000);
                            Swal.fire({
                                type: 'error',
                                title: '¡ Error, no hay tantos implementos ! ',
                                text: 'Inténtelo de nuevo',
                                width: 500,
                                confirmButtonColor: '#11a621',
                                padding: '1em',
                                showConfirmButton: false,
                                timer: 4000 //el tiempo que dura el mensaje en ms
                            });
                        }
                    }
                });
            });
        });

    </script>


    <script>
        var idiomaEsp = {
            "decimal": "",
            "emptyTable": "No hay datos",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
            "infoEmpty": "Mostrando 0 a 0 de 0 registros",
            "infoFiltered": "(Filtro de _MAX_ total registros)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ registros",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "No se encontraron coincidencias",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Próximo",
                "previous": "Anterior"
            },
            "aria": {
                "sortAscending": ": Activar orden de columna ascendente",
                "sortDescending": ": Activar orden de columna desendente"
            }
        };
    </script>
</html>
</body>
</html>