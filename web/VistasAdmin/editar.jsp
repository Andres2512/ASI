<%-- 
    Document   : agregar
    Created on : 7/07/2019, 07:33:29 PM
    Author     : Vannesa
--%>

<%@page import="modelo.DTOUsuario"%>
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
                    int id=Integer.parseInt((String)request.getAttribute("Id_usuario"));
                    DTOUsuario us= (DTOUsuario)dao.list(id);
                    %>
                    
        <h1>Actualizar usuario</h1>
        <form action="<%=request.getContextPath()%>/CrtUsuario">
            <input class="form-control" type="text" value="<%= us.getId_usuario()%>" name ="txtId_usuario" readonly=""><br>
            Nombres :<br>
            <input class="form-control" type="text" value="<%= us.getNombres()%>" name="txtNombre"><br> 
            Apellidos : <br>
            <input class="form-control" type="text" value="<%= us.getApellidos()%>"name="txtApellidos"><br>
            Número celular : <br>
            <input class="form-control" type="text" value="<%= us.getNumero_celular()%>" name="txtCelular"><br>
            Número telefono : <br>
            <input class="form-control" type="text" value="<%= us.getNumero_telefono()%>" name="txtTelefono"><br>
            Correo : <br>
            <input class="form-control" type="text" value="<%= us.getCorreo()%>" name="txtCorreo"><br>
            Dirección :<br>
            <input class="form-control" type="text" value="<%= us.getDireccion()%>" name="txtDireccion"><br>
            Rol :<br>
            <input class="form-control" type="text" value="<%=us.getRoles_Id_roles()%>"name="txtRol"><br>
            Ciudad :<br>
            <input class="form-control" type="text" value="<%= us.getCiudades_Id_ciudades()%>" name="txtCiudad"><br>
            Proyecto : <br>
            <input class="form-control" type="text" value="<%= us.getProyecto_Id_proyecto()%>" name="txtProyecto"><br>
            Contraseña:<br>
            <input class="form-control" type="text" value="<%= us.getContrasenia()%>" name="txtContrasenia"><br>
            
            
            <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"><br>
            
            <a class="btn btn-primary" href="CrtUsuario?accion=listar">Regresar</a>
        </form>
            </div>
        </div>     
    </body>
</html> 
