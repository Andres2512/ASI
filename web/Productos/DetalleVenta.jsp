
<%-- 
    Document   : DetalleVenta
    Created on : 17/11/2019, 09:58:57 PM
    Author     : Daniel Avila
--%>

<%@page import="modelo.DTODetalleVenta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Detalle Venta</title>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css" >
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h3>Detalle Venta Materiales</h3>
        <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table col-md-12 table-condensed  table-hover table-striped table-bordered text-center">
            <thead style="text-align: center">
                <tr>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Precio</th>
                    <th class="text-center">Cantidad</th>
                    <th class="text-center">Total</th>
                </tr>
            </thead>
            <%
                List<DTODetalleVenta> listaDetalle = null;
                if (request.getAttribute("detalle") != null) {
                    listaDetalle = (List<DTODetalleVenta>) request.getAttribute("detalle");
                }
                for (DTODetalleVenta detalleVenta : listaDetalle) {%>
            <tbody>
                <tr>
                    <td>
                        <% out.print(detalleVenta.getNombre()); %>
                    </td>
                    <td>
                        <% out.print(detalleVenta.getPrecio()); %>
                    </td>
                    <td>
                        <% out.print(detalleVenta.getCantidad()); %>
                    </td>
                    <td>
                        <% out.print(detalleVenta.getTotal()); %>
                    </td>
                </tr>
            </tbody>
            <%}%>
        </table>
    </body>
</html>
