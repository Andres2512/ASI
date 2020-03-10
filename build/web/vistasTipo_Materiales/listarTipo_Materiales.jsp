<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DTOTipo_Materiales"%>
<%@page import="modeloDAO.DAOTipo_Materiales"%>
<%@page import="config.Conexion"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Consultar Materiales</title>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css" >
    </head>

    <body>
        <div class="lead" style="font-size: 15px;">
            <small>
                <a href="">Inicio</a> > <a href="">Materiales y Herramientas</a> > <a href="">Consultar Tipo de Materiales</a>
                <hr style="background-color: gold; width: 100%">
            </small>
        </div>
        <div class="container-fluid">
            <h1 class="h2 text-center my-5" style="font-family: Microsoft YaHei Light">CONSULTAR TIPO DE MATERIALES</h1>
            <br>
            <a class="btn btn-success" href="<%= request.getContextPath()%>/CtrTipo_Materiales?accion=agregarTipo_Materiales">Agregar Nuevo Tipo de Material</a>            
            <hr>
            <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table col-md-12 table-condensed  table-hover table-striped table-bordered text-center">
                <thead class="thead-dark">
                    <tr>
                        <th>Tipo de Material</th>
                        <th>Descripci�n</th>
                        <th class="th-sm">Editar</th>
                        <th class="th-sm">Eliminar</th>
                    </tr>
                </thead>
                <%
                    DAOTipo_Materiales mtlDAO = new DAOTipo_Materiales();
                    List<DTOTipo_Materiales> list = mtlDAO.listar();
                    Iterator<DTOTipo_Materiales> iter = list.iterator();
                    DTOTipo_Materiales mtl = null;
                    while (iter.hasNext()) {
                        mtl = iter.next();

                %>
                <tbody>
                    <tr>
                        <td><%= mtl.getTipo_materiales()%></td>
                        <td><%= mtl.getDescripcion()%></td>
                        <td>
                            <a class="btn btn-outline-info btn-sm btn-block" href="<%= request.getContextPath()%>/CtrTipo_Materiales?accion=editarTipo_Materiales&Id_tipo_materiales=<%= mtl.getId_tipo_materiales()%>"><i class="fas fa-edit"></i></a>
                            </td> 
                            <td>
                            <a onclick="swaldelete()" class="btn btn-outline-danger btn-sm btn-block"><i class="fas fa-trash-alt"></i></a>
                        </td>                            
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <button class="btn btn-outline-success" style="margin-bottom: 10px" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><i class="fas fa-file-excel"></i> Exportar Excel</button>
        </div>		
        <!-- SCRPTS -->
        <script src="<%= request.getContextPath()%>/js/tableToExcel.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                function swaldelete() {
                    swal({
                        title: "�Est� seguro de Eliminarlo?", text: "Esta operaci�n es irreversible", icon: "warning", buttons: {cancel: "Cancelar", confirm: "Eliminar",
                        }, dangerMode: true,
                    })
                            .then((willDelete) => {
                                if (willDelete) {
                                    location.href = "<%= request.getContextPath()%>/CtrTipo_Materiales?accion=eliminarTipo_Materiales&Id_tipo_materiales=<%= mtl.getId_tipo_materiales()%>";
                                                        } else {
                                                            swal("Operaci�n Cancelada");}
                                                    });
                                        }
        </script>
    </body>
    <!-- FIN DEL CUERPO -->
</html>
</body>
</html>
