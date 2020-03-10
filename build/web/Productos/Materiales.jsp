<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DTOMateriales1"%>
<%@ page import="java.util.List" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Gestion productos</title>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/table.css" >
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    </head>
    <input type="text" name="nombreProducto" id="txtProducto">
    <button id="btnProducto">Agregar Producto</button>
     <div id="resultado"></div>

    <%
        double total = 0;
    %>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    Cotización      
                </div>
                <%
                    List<DTOMateriales1> materiales = new ArrayList();
                    if (session.getAttribute("listaAgregados") != null) {
                        materiales = (List<DTOMateriales1>) session.getAttribute("listaAgregados");

                    }
                %>
                <div class="card-body">
                    <div style="text-align: right">
                        <button type="button" onclick="registrar()" style="background-color: activeborder">Registrar</button>
                    </div>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="2" class="table col-md-12 table-condensed  table-hover table-striped table-bordered text-center" style="border: 2px solid #000">
                        <thead style="text-align: center">
                            <tr>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Precio</th>
                                <th class="text-center">Cantidad</th>
                            </tr>
                        </thead>
                        <%
                            for (DTOMateriales1 material : materiales) {
                                double precioActual = material.getPrecio();
                                //   total = precioActual + total;
                        %>
                        <tbody>
                            <tr>
                                <td><% out.print(material.getNombre()); %>
                                    <input id="txtIdMaterial" type="hidden" value="<% out.print(material.getCodigoMaterial()); %>">
                                </td>
                                <td><input id="txtPrecio" disabled type="text" value="<% out.print(material.getPrecio()); %>">
                                    <input id="txtPrecioPrimario" type="hidden" value="<% out.print(material.getPrecio()); %>">
                                </td>
                                <td><input id="<% out.print(material.getCodigoMaterial()); %>" type="text" value=""
                                           onchange="cambiarValor(<% out.print(material.getCodigoMaterial()); %>);"/></td>
                            </tr>
                        </tbody>
                        <%}%>                         
                    </table>
                    <div class="col-3" style="text-align: right">
                        Precio Total: <input type="text" disabled id="labelTotal" value="0">
                    </div>
                    <div id="validacionCantidad"></div>
                </div>
            </div>
        </div>     

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
                                               /**
                                                * 
                                                * @param {type} id
                                                * @returns Metodo que se llama cuando se da click por fuera del input de la cantidad en la tabla 
                                                */
                                               function cambiarValor(id) {
                                                   //var cantidad = document.getElementById("txtCantidad").value;
                                                   var cantidad = document.getElementById(id).value;
                                                   var idMaterial = id;
                                                   $.ajax({
                                                       type: "post",
                                                       url: "<%= request.getContextPath()%>/CrtCantidadMateriales",
                                                       dataType: "html",
                                                       data: {cantidad: cantidad, idMaterial: idMaterial},
                                                       success: function (dato) {
                                                           $("#validacionCantidad").empty();
                                                           $("#validacionCantidad").append(dato);
                                                           if (dato == '') {
                                                               var precio = $(txtPrecioPrimario).val();
                                                               var total = precio * cantidad;
                                                               $("#txtPrecio").val(total);
                                                               var totalActual = $(labelTotal).val();
//                                                               alert(precio);
//                                                               alert(totalActual);
//                                                               alert(total);
//                                                                   var totalActual = +document.getElementById('labelTotal').text();
//                                                                   alert(parseInt(totalActual));
                                                               var totalGeneral = total + totalActual;
//                                                               alert(totalGeneral);
                                                               $("#labelTotal").val(totalGeneral);
//                                                                   var cc = document.getElementById(idMaterial).value;
                                                               // $(idMaterial).prop("disabled", true);

                                                           }
                                                       }
                                                   });

                                               }

                                               /**
                                                * Metodo que se llama cuando se da click al boton de registro
                                                * @returns 
                                                */
                                               function registrar() {
//                                                   var cantidad = document.getElementById(cantidad).value;
                                                   $.ajax({
                                                       type: "post",
                                                       url: "<%= request.getContextPath()%>/CrtGestionMaterial",
                                                       dataType: "html",
                                                       data: {cantidad: 3},
                                                       success: function (dato) {
                                                           console.log(dato);
                                                       }
                                                   });
                                               }
                                               $(document).ready(function (e) {
                                                   $("#txtProducto").keyup(function (e) {

                                                       var nombreProducto = $("#txtProducto").val();
                                                       /*
                                                        Capturamos el id del tipo de producto
                                                        */
                                                       $.ajax({
                                                           type: "post",
                                                           url: "<%= request.getContextPath()%>/CrtBusquedaProducto",
                                                           dataType: "html",
                                                           /*
                                                            Enviamos el id del tipo de producto, junto al nombre digitado en el campo de texto
                                                            */
                                                           data: {nombreProducto: nombreProducto},
                                                           success: function (dato) {
                                                               $("#resultado").empty();
                                                               $("#resultado").append(dato);

                                                           }
                                                       });
                                                   });

                                               });
        </script>
    </body>
</html>
