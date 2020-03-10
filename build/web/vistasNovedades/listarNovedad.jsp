
<%@page import="java.util.Iterator"%>
<%@page import="modelo.DTONovedades"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.DAONovedades"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css" >
        <title>JSP Page</title>
    </head>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    Novedades      
                </div>
                <div class="card-body">
                    <a class="btn btn-success" href="<%= request.getContextPath()%>/CrtNovedades?accion=addN">Agregar novedad</a>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="th-sm">Id novedades</th>
                                <th class="th-sm">Fecha</th>
                                <th class="th-sm">Novedades</th>
                                <th class="th-sm">Observaciones</th>
                                <th class="th-sm">Tipo novedad</th>
                                <th class="th-sm">Editar</th>
                                <th class="th-sm">Eliminar</th>
                            </tr>
                        </thead>
                        <%
                            DAONovedades dao = new DAONovedades();
                            List<DTONovedades> listre = dao.listar();
                            Iterator<DTONovedades> iter = listre.iterator();
                            DTONovedades nov = null;
                            while (iter.hasNext()) {
                                nov = iter.next();
                        %>

                        <tbody>
                            <tr>
                                <td><%=nov.getId_novedades()%></td>
                                <td><%=nov.getFecha()%></td>
                                <td><%=nov.getNovedades()%></td>
                                <td><%=nov.getObservaciones()%></td>
                                <td><%=nov.getTipo_novedad_Id_tipo_novedad()%></td>

                                <td>
                                    <a href="CrtNovedades?accion=Editar&Id_novedades=<%=nov.getId_novedades()%>" class="btn btn-warning" style="color: #fff"><i class="fas fa-edit"></i></a>
                                </td>  
                                <td> 
                                    <a  onclick="alerta()" class="btn btn-danger" id="ejemplo" target=""><i class="fas fa-trash-alt"></i></a> 
                                </td>
                            </tr>

                        <script>
                            function alerta()
                            {
                                var mensaje;
                                var opcion = confirm("¿Esta seguro de remover el resgistro?");
                                if (opcion === true) {
                                    location.href = "<%= request.getContextPath()%>/CrtNovedades?accion=Eliminar&Id_novedades=<%= nov.getId_novedades()%>";
                                            } else {
                                                location.href = "<%= request.getContextPath()%>/CrtNovedades?accion=listar";
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
        <script src="<%= request.getContextPath()%>/js/tableToExcel.js" type="text/javascript"></script>
        <script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="../js/tableToExcel.js" type="text/javascript"></script>

    </body>
</html>
