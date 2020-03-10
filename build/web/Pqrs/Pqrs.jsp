
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

    </head>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div id="contizacion" class="card-header">
                    Cotización      
                </div>
                <div class="card-body">
                    <table  id="example" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table col-md-12 table-condensed table-hover table-striped table-bordered text-center" style="width: 100%"">
                        <thead style="font-size: 1.1em">
                            <tr>                               
                                <th class="text-center">ID</th>
                                <th class="text-center">Nombress</th>
                                <th class="text-center">Gmail</th>
                                <th class="text-center">Mensaje</th>
                                <th class="text-center">Reponder </th>
                                <th class="text-center">Eliminar </th>
                            </tr>
                        </thead>

                        <tbody>

                        </tbody>                        
                    </table>
                </div>
            </div>
        </div>

        <!--modal respuesta-->
        <div class="modal fade" id="modalRespuesta" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-topp">
                                    <div class="myform-top-left">
                                        <br>
                                        <h3 id="registrarPQRSSSSS" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Respuesta PQRS.</h3>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form id="frm_correo" >
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label class="letra" id="nombreImpleementoIIRe"for="nombreImplentooo">PARA:</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" type="text" id="correoID"  class="form-control" name="para" placeholder="Para" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-12">
                                                        <label class="letra" id="nombreImpleementoIIRe"for="nombreImplentooo">Nombres:</label>
                                                        <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" readonly="readonly" type="text" id="nombreID"  class="form-control"  placeholder="Para" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" type="hidden" id="Cantidad" class="form-control" name="de"placeholder="Cantidad implemento" value="sistemarendimientodeportivo@gmail.com" >
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input style="border: 2px solid #000; border-radius: 10px ;font-weight: 600; font-size: 1em;font-family: sans-serif" type="hidden" id="cantidadDisponibleee" class="form-control" name="clave"  placeholder="Cantidad disponible" value="fm00000000">
                                                    </div>                                                
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <input style=" font-weight: 600; font-size: 1em;font-family: sans-serif" value="Respuesta PQRS" type="hidden" id="Garantia" class="form-control" name="asunto" placeholder="Garantía">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label id="estadoIIRe" class="letra" for="estado">Respuesta</label>
                                                        <textarea style=" font-weight: 600; font-size: 1em;font-family: sans-serif" rows="7" type="text" id="estado" class="form-control" name="mensaje" placeholder="Respuesta"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </center>

                                        <div class="modal-footer">
                                            <button id="cancelarIIRe" type="button" class="btn btn-outline-danger" data-dismiss="modal" id="guardarnuevo">
                                                Cancelar
                                            </button>
                                            <button id="btn_registrar" type="submit"class="btn btn-outline-success enviarPq" > 
                                                Enviar
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--    **********************  MODAL MENSAJE    ********************-->
        <div class="modal fade" id="mo0dalMensajee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg"  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-topp">
                                    <div class="myform-top-left">
                                        <br>
                                        <h3 id="registrarPQRSSSSS" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Mensaje PQRS.</h3>
                                    </div>
                                </div>
                                <center>
                                    <div class="card-body">

                                        <table style="width: 100%; float: center;width: 100%">                       
                                            <tr style="float: center">
                                                <td class="letraPr" id="mensajeJson" style="border: none!important;text-align: center;font-size: 1.5em" ></td>
                                            </tr>                        
                                        </table>  

                                        <br>
                                        <div class="modal-footer">
                                            <button id="CancelarModal" class="btn btn-outline-success" type="button" data-dismiss="modal">
                                                Aceptar
                                            </button>
                                        </div>
                                    </div> 
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
        <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
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

// **************   FUNCION AJAX PARA RESPONDER LOS MENSAJES VIA CORREO ELECTRONICO DEL PQRS ENVIADOS   **********************

            $(document).on('click', 'button#btn_registrar', function (e) {
                e.preventDefault();
                var datos = $('#frm_correo').serialize();
                $("#frm_correo")[0].reset();
                $("#modalRespuesta").modal("toggle");
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/CrtPqrs?accion=responderPqrs",
                    data: datos,
                    success: function (data) {
                        if (data == 1) {
                            Swal.fire({
                                type: 'success',
                                title: '¡ Mensaje enviado exitosamente ! ',
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
                                title: '¡Error, el mensaje no pudo enviarse! ',
                                text: 'Inténtelo de nuevo',
                                width: 500,
                                confirmButtonColor: '#11a621',
                                padding: '5em',
                                showConfirmButton: false,
                                timer: 8000 //el tiempo que dura el mensaje en ms
                            });
                            listar();
                        }
                    }
                });
            });

//************   FUNCION JQUERY PARA LLENAR LOS CAMPOS DE CORREO ELECTRONICO, NOMBRES Y APELLIDOS A QUIENES SE LES VA A RESPONDER LOS PQRS  *********
            $(document).on('click', 'a.btnEditar', function (e) {
                fila = $(this).closest("tr");
                var nombres = fila.find('td:eq(1)').text();
                var correo = fila.find('td:eq(2)').text();
                $('#nombreID').val(nombres);
                $('#correoID').val(correo);
            });
        </script>
        <script>
            $(document).ready(function () {
                listar();
            });
            $(document).on('click', 'a.btnMensajepqr', function (e) {
                var data = "";
                var idPqrs = $(this).parents("tr").find("td").eq(0).text();
                $.ajax({
                    url: "<%=request.getContextPath()%>/CrtPqrs?accion=ListarPQRSMensaje&mensajepqrss=" + idPqrs + "",
                    type: "POST",
                    data: data,
                    dataSrc: "datos",
                    dataType: "json",
                    success: function (data) {
                        $.each(data.datos, function (i, field) {
                            $('#mensajeJson').html(field.mensajee);
                        });
                    }
                });
            });

            var listar = function () {
                var table = $("#example").DataTable({
                    responsive: true,
                    order: [[0, "desc"]],
                    destroy: true,
                    ajax: {
                        method: "POST",
                        url: "<%=request.getContextPath()%>/CrtPqrs?accion=ListarPQRS",
                        dataSrc: "datos"
                    },
                    columns: [
                        {data: "idPQRS"},
                        {data: "nombre"},
                        {data: "Email"},
                        {data: "mensaje"},
                        {data: "Responder"},
                        {data: "Eliminar"}
                    ],
                    language: idiomaEsp
                });
            };

            $(document).on('click', 'a.btnEliminar', function (e) {
                var idpqrs = $(this).attr('id');
                var fila = $(this).parent().parent();
                e.preventDefault();
                var data = {idpqrs: idpqrs};
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons.fire({
                    title: '¿Desea eliminar el registro con el ID ' + idpqrs + ' ? ',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Si, Eliminar!',
                    cancelButtonText: 'No, Cancelar!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "<%=request.getContextPath()%>/CrtPqrs?accion=EliminarPQRS",
                            type: "POST",
                            data: data,
                            success: function (data) {
                                Swal.fire(
                                        'Eliminado!',
                                        'El registro se ha eliminado exitosamente.',
                                        'success'
                                        );
                                listar();
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

    </body>
</html>
