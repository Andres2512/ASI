<%@page import="modelo.DTOMarca"%>
<%@page import="modeloDAO.DAOMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Editar Marca</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- HOJAS DE ESTILOS PROPIA -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssModulos.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <%
                DAOMarca mrcaDAO = new DAOMarca();
                int Id_marca = Integer.parseInt((String) request.getAttribute("Id_marca"));
                DTOMarca mrca = (DTOMarca) mrcaDAO.list(Id_marca);
            %>
            <h1>Modificar Marca</h1>
            <form action="<%= request.getContextPath()%>/CtrMarca">
                <div class="form-group">
                    <label for="" class="control-label">ID</label>
                    <input type="number" readonly="readonly" style="background:rgba(0,0,0,0.1)" class="form-control" name="txtId_marca" value="<%= mrca.getId_marca()%>" placeholder="Id">
                </div>
                
                <div class="form-group">
                    <label for="" class="control-label">Marca</label>
                    <input type="text" class="form-control" name="txtNombre" value="<%= mrca.getNombre()%>" placeholder="Marca">
                </div>
                <br>
                <p><button type="submit" name="accion" class="btn btn-primary" value="btnActualizarMrca">Modificar Marca</button></p>
            </form>
        </div>    
    </body>
</html>
