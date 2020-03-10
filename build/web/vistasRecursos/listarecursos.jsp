<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.DAORecursos"%>
<%@page import="modelo.DTORecursos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css" >
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    recursos
                </div>
                <div class="card-body">
                    <a class="btn btn-success" href="CrtRecursos?accion=add">Agregar nuevo</a>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="th-sm">idAsignacion_Recursos</th>
                                <th class="th-sm">Fecha</th>
                                <th class="th-sm">Cantidad de dinero</th>
                                <th class="th-sm">Observaciones</th>
                                <th class="th-sm">Editar</th>
                                <th class="th-sm">Eliminar</th>
                            </tr>
                        </thead>
                        <%
                            DAORecursos dao = new DAORecursos();
                            List<DTORecursos> listre = dao.listar();
                            Iterator<DTORecursos> iter = listre.iterator();
                            DTORecursos rec = null;
                            while (iter.hasNext()) {
                                rec = iter.next();


                        %>
                        <tbody>
                            <tr>
                                <td><%=rec.getIdAsignacion_Recursos()%></td>
                                <td><%=rec.getFecha()%></td>
                                <td><%=rec.getCantidad()%></td>
                                <td><%=rec.getObservaciones()%></td>

                                <td>
                                    <a href="CrtRecursos?accion=Editar&idAsignacion_Recursos=<%=rec.getIdAsignacion_Recursos()%>" class="btn btn-warning" style="margin-bottom: 10px;"><i class="fas fa-edit"></i></a>
                                </td> 
                                <td>
                                    <a href="CrtRecursos?accion=eliminar&idAsignacion_Recursos=<%=rec.getIdAsignacion_Recursos()%>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        </tbody>
                        <% }%>
                    </table>
                    <div>
                        <button class="btn btn-outline-success" style="margin-bottom: 10px" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
                    </div>
                </div>
            </div>
        </div>
        <script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="../js/tableToExcel.js" type="text/javascript"></script>
        <script src="../js/tableToExcel.js" type="text/javascript"></script>
    </body>
</html>
