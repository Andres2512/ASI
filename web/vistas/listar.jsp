
<%@page import="java.util.Iterator"%>
<%@page import="modelo.DTORoles"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.DAORoles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            <h1>Roles</h1>
            <a class="btn btn-success" href="CrtRol?accion=add">Agregar Nuevo</a>
            <br>
            <br>
            <table class="table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Id_roles</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    DAORoles dao=new DAORoles ();
                    List<DTORoles>list=dao.listar();
                    Iterator<DTORoles>iter=list.iterator();
                    DTORoles rol=null;
                    while (iter.hasNext()) {
                            rol=iter.next();
                        
                %>

                <tbody>
                    <tr>
                        <td class="text-center"><%= rol.getId_roles()%></td>
                        <td class="text-center"><%= rol.getNombre()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="CrtRol?accion=editar&Id_roles=<%= rol.getId_roles()%>">Editar</a>
                            <a class="btn btn-danger" href="CrtRol?accion=eliminar&Id_roles=<%= rol.getId_roles()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
