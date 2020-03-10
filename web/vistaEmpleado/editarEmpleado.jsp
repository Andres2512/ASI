<%-- 
    Document   : editarEmpleado
    Created on : 5/08/2019, 08:54:03 PM
    Author     : Vannesa
--%>

<%@page import="modelo.DTOUsuario"%>
<%@page import="modeloDAO.DAOUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <%
                    DAOUsuario dao = new DAOUsuario();
                    int Id_Usuario=Integer.parseInt((String)request.getAttribute("Id_Usuario"));
                    DTOUsuario nov= (DTOUsuario)dao.list(Id_Usuario);
                    %>
                    
        <h1>Actualizar Novedades</h1>
        <form action="<%=request.getContextPath()%>/CrtUsuario">
            
            id:<br>
            <input class="form-control" type="number" value="<%= nov.getId_usuario()%>" name="txtId_usuario" readonly="" ><br>          
           
            Nombres :<br>
            <input class="form-control" type="text" value="<%= nov.getNombres()%>" name="txtNombres" required><br> 
            Apellidos : <br>
            <input class="form-control" type="text" value="<%= nov.getApellidos()%>" name="txtApellidos" required><br>
            Número_celular : <br>
            <input class="form-control" type="number" value="<%= nov.getNumero_celular()%>" name="txtNumero_celular" required><br>
            Número_telefono : <br>
            <input class="form-control" type="number" value="<%=nov.getNumero_telefono()%>" name="txtNumero_telefono" required>
            Correo : <br>
            <input class="form-control" type="email" value="<%=nov.getCorreo()%>" name="txtCorreo" required>
            Direccion : <br>
            <input class="form-control" type="text" value="<%=nov.getDireccion()%>" name="txtDireccion" required>
            Código rol : <br>
            <input class="form-control" type="number" value="<%=nov.getRoles_Id_roles()%>" name="txtRoles_Id_roles" required>
            Código ciudades : <br>
            <input class="form-control" type="number" value="<%=nov.getCiudades_Id_ciudades()%>" name="txtCiudades_Id_ciudades" required>
            Código proyecto : <br>
            <input class="form-control" type="number" value="<%=nov.getProyecto_Id_proyecto() %>" name="txtProyecto_Id_proyecto" required>
           
            <input class="btn btn-warning" type="submit" name="accion" value="Actualizar">
            
            <a class="btn btn-danger" href="CrtUsuario?accion=listar">Regresar</a>
        </form>
            </div>
        </div>
    </body>
</html>
