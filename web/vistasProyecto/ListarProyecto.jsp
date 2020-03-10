<%@page import="modelo.DTOProyecto"%>
<%@page import="modeloDAO.DAOProyecto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css">
    </head>
    <style>
    </style>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    Proyecto      
                </div>
                <div class="card-body">   
                    <a class="btn btn-success" style="color: #fff" data-toggle="modal" data-target="#modalAgregar">Agregar Proyecto</a>
                    <a class="btn btn-success" style="color: #fff" href="<%= request.getContextPath()%>/PDF?accion=reporteProyecto">Reporte Proyecto</a>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table col-md-12 table-condensed  table-hover table-striped table-bordered text-center">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Nombre Proyecto</th>
                                <th class="text-center">Fecha incio</th>
                                <th class="text-center">Fecha fin</th>

                                <!--<th class="text-center">Costo</th>-->
                                <th class="text-center">Direccion</th>

                                <th class="text-center"> Asignacion Recursos</th>
                                <th class="text-center"> ciudades</th>
                                <th class="text-center"> novedades</th>
                                <th class="text-center"> estado proyecto</th>
                                <th class="text-center">Costo</th>
                                <th class="text-center">Cotización</th>
                                <th class="th-sm">Editar</th>
                                <th class="th-sm">Eliminar</th>
                            </tr>
                        </thead>
                        <%
                            DAOProyecto dao = new DAOProyecto();
                            List<DTOProyecto> list = dao.listar();
                            Iterator<DTOProyecto> iter = list.iterator();
                            DTOProyecto pro = null;
                            DTOProyecto proo = null;
                            while (iter.hasNext()) {
                                pro = iter.next();
                        %>
                        <tbody>
                            <tr>
                                <td class="text-center"><%= pro.getId_proyecto()%></td>
                                <td class="text-center"><%= pro.getNombre_proyecto()%></td>
                                <td class="text-center"><%= pro.getFecha_incio()%></td>
                                <td class="text-center"><%= pro.getFecha_fin()%></td>
                                <!--<td cl //ass="text-center"><%= pro.getCosto()%></td>-->
                                <td class="text-center"><%= pro.getDireccion()%></td>                                
                                <td>
                                    <a class="btn btn-dark btnMensajeAsignacion" style="color: #fff" data-toggle="modal" data-target="#modalMensajee" href="#"><i class="far fa-folder-open"></i></a>                                   
                                </td>
                                <td class="text-center"><%= pro.getNombre()%></td>
                                <td class="text-center"><%= pro.getNovedad()%></td>
                                <td class="text-center"><%= pro.getEstadoProyecto()%></td>

                                <td>
                                    <a class="btn btn-success btnCosto" style="color: #fff" data-toggle="modal" data-target="#modalCosto" href=""><i class="fas fa-dollar-sign"></i></a>                                   
                                </td>
                                <td>
                                    <a class="btn btn-primary " style="color: #fff" href="CtrGeneral?accion=ListarCoti&idCotizacion=<%= pro.getId_proyecto()%>"><i class="fas fa-bars"></i></a>                                   
                                </td>
                                <td>
                                    <a class="btn btn-warning" style="color: #fff" href="CrtProyecto?accion=editar&Id_proyecto=<%=pro.getId_proyecto()%>"><i class="fas fa-edit"></i></a>                                   
                                </td>
                                <td>
                                    <a onclick="alerta()" class="btn btn-danger" style="color: #fff" id="ejemplo" target=""><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        </tbody>

                        <% }%>
                    </table>
                    <button class="btn btn-outline-success" style="margin-bottom: 10px" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
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
                                        <h3 id="registrarPQRSSSSS">Asignación Recursos</h3>
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
        
        <!--    **********************   modalCosto    ********************-->
        <div class="modal fade" id="modalCosto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog "  role="document">
                <div class="modal-content" >
                    <div class="modal-body">
                        <div class="container">
                            <div class="card card-register mx-auto mt-4" style="border: none">
                                <div class="my-form-topp">
                                    <div class="myform-top-left">
                                        <br>
                                        <h3 style="border: none!important;text-align: center;font-size: 2em;" id="registrarPQRSSSSS">COSTO PROYECTO</h3>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <center>
                                        <table style="width: 100%; float: center;width: 100%">                       
                                            <tr style="float: center">
                                                <td class="letraPr" id="getValorFinalId" style="border: none!important;text-align: center;font-size: 1.8em; color: green" ></td>
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

        <!--  *********   modal Agregar  ********************* -->
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
                                            <h3 id="nuevorendimientorendire" style="font-size: 2.2em; font-weight: 600">Agregar Proyecto.</h3>
                                        </center>
                                    </div>
                                </div>
                                <div class="card-body">

                                    <form action="<%=request.getContextPath()%>/CrtProyecto">
                                        <center>
                                            <div class="form-group">
                                                <div class="form-row">                                                    
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">Costo:</label><br>
                                                        <input style="border: 1.4px solid #000;height: 45px" class="form-control" type="number" name="txtcos" placeholder="Costo" required><br>
                                                    </div>                                                   
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">Direccion:</label><br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="Direccion" class="form-control" type="text" name="txtdes" required><br>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">Fecha incio:</label> <br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="Fecha incio" class="form-control" type="date" name="txtfein" required><br>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">Fecha fin:</label> <br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="Fecha fin" class="form-control" type="date" name="txtfefin" required><br>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">ID Asignacion Recursos:</label><br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="ID Asignacion Recursos" class="form-control" type="number" name="txtaid" required><br>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">ID ciudades:</label><br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="ID ciudades" class="form-control" type="number" name="txtcid" required><br>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">ID novedades:</label><br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="ID novedades"  class="form-control" type="number" name="txtnid" required><br>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label style="font-size: 1.6em; font-weight: 500">ID estado proyecto:</label><br>
                                                        <input style="border: 1.4px solid #000;height: 45px" placeholder="ID estado proyecto"  class="form-control" type="number" name="txteid" required><br>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">                                               
                                                <div class="col-md-6">
                                                    <label style="font-size: 1.6em; font-weight: 500"> Nombre Proyecto:</label> <br>
                                                    <input style="border: 1.4px solid #000;height: 45px" placeholder=" Nombre Proyecto:" class="form-control" type="text" name="txtNombre_Proyecto" required><br>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="modal-footer">
                                                    <button id="limpiarrenidre"type="reset" class="btn btn-outline-info"  >
                                                        Limpiar
                                                    </button>
                                                    <button id="cancelarrendire"type="button" class="btn btn-outline-danger"  data-dismiss="modal" >
                                                        Cancelar
                                                    </button>
                                                    <input class="btn btn btn-outline-success" type="submit" name="accion" value="Agregar">
                                                </div>
                                        </center>
                                    </form>
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
<!--            <script>
                        $(document).on('click', 'a.btnMensajeAsignacion', function (e) {
                            var data = "";
                            var idCotizacion = <%=pro.getId_proyecto()%>;
                            alert(idCotizacion);
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
                        });
            </script>-->
            <script>
                $(document).on('click', 'a.btnCosto', function (e) {
                    var data = "";
                    var idCotizacion = $(this).parents("tr").find("td").eq(0).text();
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
                });
                $(document).on('click', 'a.btnMensajeAsignacion', function (e) {
                    var data = "";
                    var idPqrs = $(this).parents("tr").find("td").eq(0).text();
                    $.ajax({
                        url: "<%= request.getContextPath()%>/PedirCorreos?accion=ListarPQRSMensaje&mensajepqrss=" + idPqrs + "",
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
            </script>
            <script>
                function alerta()
                {
                    var mensaje;
                    var opcion = confirm("¿Esta seguro de remover el resgistro?");
                    if (opcion === true) {
                        location.href = "<%= request.getContextPath()%>/CrtProyecto?accion=Eliminar&Id_proyecto=<%=pro.getId_proyecto()%>";
                                } else {
                                    location.href = "<%= request.getContextPath()%>/CrtProyecto?accion=listar";
                                }
                                document.getElementById("ejemplo").innerHTML = mensaje;
                            }
            </script>
    </body>
</html>

