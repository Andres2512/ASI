
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.19/css/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css"/>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body>
        <a class="btn btn-success" style="color: #fff" href="<%= request.getContextPath()%>/CtrGeneral?accion=ListarProyecto">Proyectos</a>

        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div id="contizacion" class="card-header">
                    Cotización      
                </div>
                <div class="card-body">
                    <a class="btn btn-success" style="color: #fff" data-toggle="modal" data-target="#modalAgregar">Agregar Cotizacion</a>
                    <hr/>
                    <center>
                        <table id="example" border="1" class="table table-striped table-bordered table-sm">
                            <thead>
                                <tr>                               
                                    <th class="text-center">Id cotización</th>
                                    <th class="text-center">Nombre material</th>                                
                                    <th class="text-center">Cantidad</th>
                                    <th class="text-center">Valor unitario</th>
                                    <th class="text-center">Valor total</th>
                                    <th class="text-center">Fecha cotización</th>
                                    <th class="text-center">Descripción</th>
                                    <th class="th-sm">Editar</th>
                                    <th class="th-sm">Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                            <tfoot style="float: right">
                                <br>
                                <th>Total</th> <td id="getValorFinalId"></td>
                            </tfoot>
                        </table>
                    </center>
                    <button class="btn btn-outline-success" style="margin-bottom: 10px" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
                </div>
            </div>
        </div>
        <% int idCotizacion = Integer.parseInt(request.getParameter("idCotizacion"));%>
        <!--  *********************************  MODAL AGREGAR  ***********************************-->
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
                                            <h3 id="nuevorendimientorendire" style="font-size: 2.2em; font-weight: 600">Agregar Cotización</h3>
                                        </center>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form id="frm_Nuevo">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">  
                                                    <div class="col-md-12">
                                                        <label style="font-size: 1.6em; font-weight: 500">Nombre material</label><br>
                                                        <select style="width: 100%;height: 45px; border: 1px solid #000; border-radius: 5px" id="nombreMaterial" name="txtnombre">                                 
                                                            <option value="" disabled=""  selected=""> ---------------------------------------------------------------------------   --------------------------------------------------------------------------- </option>
                                                        </select>
                                                    </div> 
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">Cantidad</label> <br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="Descripcion" class="form-control" type="number" name="txtCantidad" required><br>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">Valor unitario</label> <br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="Valor total" class="form-control" type="number" name="txtvaltorUnitario" required><br>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label style="font-size: 1.6em; font-weight: 500">Descripción</label> <br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="Descripcion" class="form-control" type="text" name="txtdes" required><br>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input style="border: 1.4px solid #000;height: 45px; visibility: hidden" placeholder="Valor total" value="<%=idCotizacion%>" class="form-control" type="number" name="txtpidp" required><br>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="margin-top: -70px"class="modal-footer">
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
                                            <div style="visibility: hidden"class="form-group">
                                                <div class="form-row">                                                    
                                                    <div class="col-md-12">
                                                        <label style="font-size: 1.6em; font-weight: 500">Id cotización</label><br>
                                                        <input style="border: 1.4px solid #000;height: 45px" readonly="" id="" class="form-control getId_cotizacion" type="number" name="txtidcoti"  placeholder="Fecha cotización" required><br>
                                                    </div> 
                                                </div>
                                            </div>

                                            <div style="margin-top: -100px" class="form-group">
                                                <div class="form-row">  
                                                    <div class="col-md-12">
                                                        <label style="font-size: 1.6em; font-weight: 500">Nombre material</label><br>
                                                        <select style="width: 100%;height: 45px; border: 1px solid #000; border-radius: 5px" id="nombreMaterialEdit" name="txtnombre">                                 
                                                            <option value="" disabled=""  selected=""> ---------------------------------------------------------------------------   --------------------------------------------------------------------------- </option>
                                                        </select>
                                                    </div> 
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">Cantidad</label> <br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="Descripcion" class="form-control getCantidad" type="number" name="txtCantidad" required><br>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">Valor unitario</label> <br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="Valor total" class="form-control getValorUnitario" type="number" name="txtvaltorUnitario" required><br>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label style="font-size: 1.6em; font-weight: 500">Descripción</label> <br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="Descripcion" class="form-control getDescripcion" type="text" name="txtdes" required><br>
                                                    </div>
                                                </div>                            
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

        <!--    **********************  MODAL MENSAJE    ********************-->
        <div class="modal fade" id="modalMensajee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-topp">
                                    <div class="myform-top-left">
                                        <br>
                                        <h3 id="registrarPQRSSSSS">Descripción</h3>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <center>
                                        <table style="width: 100%; float: center;width: 100%">                       
                                            <tr style="float: center">
                                                <td class="letraPr" id="mensajeJson" style="border: none!important;text-align: center;font-size: 1.5em" ></td>
                                            </tr>                        
                                        </table>  
                                    </center>
                                    <br>
                                    <div class="modal-footer">
                                        <button id="CancelarModal" class="btn btn-outline-success" type="button" data-dismiss="modal">
                                            Aceptar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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


        <script>
                        $(document).ready(function () {
                            listar();
                            listarValorFinalId();
                            listarMateriales();
                        });
                        var listarMateriales = function () {
                            var data = "";
                            $.ajax({
                                url: "<%= request.getContextPath()%>/Administrador?accion=ListarMateriales",
                                type: "POST",
                                data: data,
                                dataSrc: "datos",
                                dataType: "json",
                                success: function (data) {
                                    $.each(data.datos, function (i, field) {
                                        $('#nombreMaterial').append('<option value="' + field.getNombre + '">' + field.getNombre + '</option>');
                                        $('#nombreMaterialEdit').append('<option value="' + field.getNombre + '">' + field.getNombre + '</option>');
                                    });
                                }
                            });
                        };

                        var listarValorFinalId = function () {
                            var data = "";
                            var idCotizacion = <%=idCotizacion%>;
                            $.ajax({
                                url: "<%= request.getContextPath()%>/C_Cotizacion?accion=valorFinalId&valorFinalId=" + idCotizacion + "",
                                type: "POST",
                                data: data,
                                dataSrc: "datos",
                                dataType: "json",
                                success: function (data) {
                                    $.each(data.datos, function (i, field) {
                                        $('#getValorFinalId').html(field.getValorFinalId);
                                    });
                                }
                            });
                        };


                        var listar = function () {
                            var idCotizacion = <%=idCotizacion%>;
                            var table = $("#example").DataTable({
                                responsive: true,
                                order: [[0, "desc"]],
                                destroy: true,
                                ajax: {
                                    method: "POST",
                                    url: "<%=request.getContextPath()%>/C_Cotizacion?accion=ListarCotizacion&idCotizacion=" + idCotizacion + "",
                                    dataSrc: "datos"
                                },
                                columns: [
                                    {data: "getId_cotizacion"},
                                    {data: "getNombreMaterial"},
                                    {data: "getCantidad"},
                                    {data: "getValorUnitario"},
                                    {data: "getValor_total"},
                                    {data: "getFecha_cotizacion"},
                                    {data: "Descripcion"},
                                    {data: "Editar"},
                                    {data: "Eliminar"}
                                ],
                                language: idiomaEsp
                            });
                        };
        </script>

        <script>
            $(document).on('click', 'a.btnMensajeAsignacion', function (e) {
                var data = "";
                var idPqrs = $(this).parents("tr").find("td").eq(0).text();
                $.ajax({
                    url: "<%= request.getContextPath()%>/PedirCorreos?accion=ListarDescripcionCotiz&mensajepqrss=" + idPqrs + "",
                    type: "POST",
                    data: data,
                    dataSrc: "datos",
                    dataType: "json",
                    success: function (data) {
                        $.each(data.datos, function (i, field) {
                            $('#mensajeJson').html(field.mensajeeee);
                        });
                    }
                });
            });
        </script>
        <script>

//            $(function () {
////********  FUNCCION AJAX PARA REGISTRAR    ******************************************************************************************
            $('#btn_registrar').click(function (e) {
                e.preventDefault();
                var datos = $('#frm_Nuevo').serialize();
                $("#modalAgregar").modal("toggle");
                $("#frm_Nuevo")[0].reset();
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/C_Cotizacion?accion=Agregar",
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
                                title: '¡Error al Crear! ',
                                text: 'Inténtelo de nuevo',
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
                    url: "<%=request.getContextPath()%>/C_Cotizacion?accion=Actualizar",
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
                                title: '¡Error al Crear! ',
                                text: 'Inténtelo de nuevo',
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

        </script>
        <script>
            $(document).on('click', 'a.btnEditar', function (e) {
                e.preventDefault();
                var idCotizacionModal = $(this).attr('id');
                var data = {idCotizacionModal: idCotizacionModal};
                $.ajax({
                    url: "<%=request.getContextPath()%>/C_Cotizacion?accion=editarCotizacionModal",
                    type: "POST",
                    data: data,
                    dataSrc: "datos",
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        $.each(data.datos, function (i, field) {
                            $('.getId_cotizacion').val(field.getId_cotizacion);
                            $('#nombreMaterialEdit').val(field.getNombreMaterial);
                            $('.getCantidad').val(field.getCantidad);
                            $('.getValorUnitario').val(field.getValorUnitario);
                            $('.getValor_total').val(field.getValor_total);
                            $('.getFecha_cotizacion').val(field.getFecha_cotizacion);
                            $('.getDescripcion').val(field.getDescripcion);
                        });
                    }
                });
            });


            $(document).on('click', 'a.btnEliminar', function (e) {
                var idCotizacion = $(this).attr('id');
                var fila = $(this).parent().parent();
                e.preventDefault();
                var data = {idCotizacion: idCotizacion};
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons.fire({
                    title: '¿Desea eliminar el registro con el ID ' + idCotizacion + ' ? ',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Si, Eliminar!',
                    cancelButtonText: 'No, Cancelar!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "<%=request.getContextPath()%>/C_Cotizacion?accion=EliminarCotizacion",
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
                                    listarValorFinalId();
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
        </script>
        <script>
            var idiomaEsp = {
                "decimal": "",
                "emptyTable": "No hay datos",
                "info": "Mostrando _START_ de _END_ registros",
                "infoEmpty": "Mostrando 0 de 0 registros",
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


    </body>
</html>
