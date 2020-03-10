<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.DTOTipo_estado"%>
<%@page import="modeloDAO.DAOTipo_estado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css" >
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
                    Tipos Estados      
                </div>
                <div class="card-body">
                    <a class="btn btn-success" style="color: #fff" data-toggle="modal" data-target="#modalAgregar">Agregar tipo de Estado</a>
                    <center>
                        <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table col-md-12 table-condensed  table-hover table-striped table-bordered text-center">
                            <thead style="text-align: center">
                                <tr>
                                    <th class="text-center">Estado</th>
                                    <th class="text-center">Observacion</th>
                                    <th class="th-sm">Editar</th>
                                    <th class="th-sm">Eliminar</th>
                                </tr>
                            </thead>
                            <%
                                DAOTipo_estado dao = new DAOTipo_estado();
                                List<DTOTipo_estado> list = dao.listar();
                                Iterator<DTOTipo_estado> iter = list.iterator();
                                DTOTipo_estado te = null;
                                while (iter.hasNext()) {
                                    te = iter.next();
                            %>
                            <tbody style="text-align: center">
                                <tr>
                                    <td class="text-center"><%=te.getEstado()%></td>
                                    <td class="text-center"><%=te.getObservacion()%></td>
                                    <td>
                                        <a class="btn btn-warning" style="color: #fff" href="CtrTipo_estado?accion=editar&Id_tipo_estado=<%=te.getId_tipo_estado()%>"><i class="fas fa-edit"></i></a> 
                                    </td>
                                    <td>
                                        <a onclick="alerta()" class="btn btn-danger" style="color: #fff" id="ejemplo" target=""><i class="fas fa-trash-alt"></i></a> 
                                    </td>
                                </tr>
                            </tbody>
                            <% }%>
                        </table>
                    </center>
                    <button class="btn btn-outline-success" style="margin-bottom: 10px" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
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
                                            <h3 id="nuevorendimientorendire" style="font-size: 2.2em; font-weight: 600">Agregar Tipo estado.</h3>
                                        </center>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form action="<%=request.getContextPath()%>/CtrTipo_estado">                                        
                                        <div class="form-group">
                                            <div class="form-row">                                                    
                                                <div class="col-md-6">
                                                    <label style="font-size: 1.6em; font-weight: 500">Estado</label><br>
                                                    <input style="border: 1.4px solid #000;height: 45px" class="form-control" type="text" name="txtestado" placeholder="Estado" required><br>
                                                </div>                             
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-row">                                                    
                                                <div class="col-md-6">
                                                    <label style="font-size: 1.6em; font-weight: 500">Observación</label><br>
                                                    <input style="border: 1.4px solid #000;height: 45px" class="form-control" type="text" name="txtobservacion" placeholder="Observación" required><br>
                                                </div>                             
                                            </div>
                                        </div>
                                </div>
                                <div class="modal-footer">
                                    <button id="limpiarrenidre"type="reset" class="btn btn-outline-info"  >
                                        Limpiar
                                    </button>
                                    <button id="cancelarrendire"type="button" class="btn btn-outline-danger"  data-dismiss="modal" >
                                        Cancelar
                                    </button>
                                    <input class="btn btn btn-outline-success" type="submit" name="accion" value="Agregar">
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>          
            </div>
        </div>     
        <script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/tableToExcel.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
            function alerta()
            {
                var mensaje;
                var opcion = confirm("¿Esta seguro de remover el resgistro?");
                if (opcion === true) {
                    location.href = "<%= request.getContextPath()%>/CtrTipo_estado?accion=Eliminar&Id_tipo_estado=<%=te.getId_tipo_estado()%>";
                            } else {
                                location.href = "<%= request.getContextPath()%>/CtrTipo_estado?accion=listar";
                            }
                            document.getElementById("ejemplo").innerHTML = mensaje;
                        }
        </script>
    </body>
</html>

