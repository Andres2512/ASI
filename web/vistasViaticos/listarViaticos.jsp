<%@page import="modeloDAO.DAOViaticos"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.DTOViaticos"%>
<%@page import="java.util.List"%>
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
                    Viáticos     
                </div>
                <div class="card-body">
                    <a class="btn btn-success" href="<%= request.getContextPath()%>/CtrViaticos?accion=addv">agregar viaticos</a>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="th-sm">Id_viaticos</th>
                                <th class="th-sm">Descripcion viaticos</th>
                                <th class="th-sm">Tipo viaticos </th>
                                <th class="th-sm">Nombres_trabajador</th>
                                
                                <th class="th-sm">valor_viatico</th>
                                <th class="th-sm">Insertar_evidencia</th>
                                <th class="th-sm">Editar</th>
                                <th class="th-sm">Eliminar</th>
                            </tr> 
                        </thead>
                        <%
                            DAOViaticos dao = new DAOViaticos();
                            List<DTOViaticos> listre = dao.listar();
                            Iterator<DTOViaticos> iter = listre.iterator();
                            DTOViaticos via = null;
                            while (iter.hasNext()) {
                                via = iter.next();
                        %>
                        
                        <tbody>
                            <tr>
                                <td><%=via.getId_viaticos() %></td>
                                <td><%=via.getDescripcion_viatico() %></td>
                                <td><%=via.getTipo_viatico() %></td>
                                <td><%=via.getNombres_trabajador() %></td>
                                
                                <td><%=via.getValor_viatico() %></td>
                                <td><%=via.getInsertar_evidencia() %></td>
                                
                                <td>
                                    <a href="CtrViaticos?accion=Editar&Id_viaticos=<%=via.getId_viaticos()%>" class="btn btn-warning" style="color: #fff"><i class="fas fa-edit"></i></a>
                                </td>
                                <td>
                                    <a onclick="alerta()" class="btn btn-danger" id="ejemplo" target=""><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        <script>
                             function alerta()
                            {
                                var mensaje;
                                var opcion = confirm("¿Esta seguro de remover el resgistro?");
                                if (opcion === true) {
                                    location.href = "<%= request.getContextPath()%>/CtrViaticos?accion=eliminar&id_viaticos=<%= via.getId_viaticos()%>";
                                            } else {
                                                location.href = "<%= request.getContextPath()%>/CtrViaticos?accion=listar";
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
