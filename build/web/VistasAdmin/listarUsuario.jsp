<%-- 
    Document   : listarUsuario
    Created on : 24/07/2019, 02:47:40 PM
    Author     : Vannesa
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.DAOListarusuario"%>
<%@page import="modelo.DTOListarusuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">        <link rel="stylesheet" src="">

        <title>JSP Page</title>
    </head>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    Usuario
                </div>
                <div class="card-body">
                    <a href="CrtUsuario?accion=add">Agregar nuevo</a>
                    <button  id="agregarNuevoII"class="btn btn-outline-success " data-toggle="modal" data-target="#modalCarga" >  Cargar datos   <i class="fas fa-database"></i></button> 
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="th-sm">Id_usuario</th>
                                <th class="th-sm">Nombres</th>
                                <th class="th-sm">Apellidos</th>
                                <th class="th-sm">Numero_celular</th>
                                <th class="th-sm">Numero_telefono</th>
                                <th class="th-sm">Correo</th>
                                <th class="th-sm">Dirección</th>
                                <th class="th-sm">Rol</th>
                                <th class="th-sm">Ciudad</th>
                                <th class="th-sm">Id proyecto</th>
                                <th class="th-sm">Acciones</th>
                            </tr>
                        </thead>
                        <%
                            DAOListarusuario dao = new DAOListarusuario();
                            List<DTOListarusuario> listUs = dao.listar();
                            Iterator<DTOListarusuario> iter = listUs.iterator();
                            DTOListarusuario lst = null;
                            while (iter.hasNext()) {
                                lst = iter.next();


                        %>
                        <tbody>
                            <tr>
                                <td><%= lst.getId_usuario()%></td>
                                <td><%=lst.getNombre()%></td>
                                <td><%=lst.getApellido()%></td>
                                <td><%=lst.getCelular()%></td>
                                <td><%=lst.getTelefono()%></td>
                                <td><%=lst.getCorreo()%></td>
                                <td><%=lst.getDireccion()%></td>
                                <td><%=lst.getRol()%></td>
                                <td><%=lst.getCiudad()%></td>
                                <td><%=lst.getId_proyecto()%></td>

                                <td>
                                    <a href="CrtUsuario?accion=Editar&Id_usuario=<%=lst.getId_usuario()%>">Editar</a>
                                    <a  onclick="alerta()" class="btn btn-danger" id="ejemplo" target="">Remover</a> 


                                </td>

                            </tr>
                        </tbody>
                        <%}%>
                    </table>
                    <div>
                        <input type="button" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Exportar">
                    </div>
                </div>
            </div>
        </div>

        <script>
            function alerta()
            {
                var mensaje;
                var opcion = confirm("¿Esta seguro de remover el resgistro?");
                if (opcion === true) {
                    location.href = "<%= request.getContextPath()%>/CrtUsuario?accion=Eliminar&Id_usuario=<%= lst.getId_usuario()%>";
                            } else {
                                location.href = "<%= request.getContextPath()%>/CrtUsuario?accion=listar";
                            }
                            document.getElementById("ejemplo").innerHTML = mensaje;
                        }
        </script>
        <script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="../js/tableToExcel.js" type="text/javascript"></script>
    </body>
</html>
