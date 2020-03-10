<%@page import="modelo.DTOTipo_Herramientas"%>
<%@page import="modeloDAO.DAOTipo_Herramientas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Editar Herramientas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- HOJAS DE ESTILOS PROPIA -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssMod.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssPrinc.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <%
                DAOTipo_Herramientas htaDAO = new DAOTipo_Herramientas();
                int Id_tipo_herramientas = Integer.parseInt((String) request.getAttribute("Id_tipo_herramientas"));
                DTOTipo_Herramientas hta = (DTOTipo_Herramientas) htaDAO.list(Id_tipo_herramientas);
            %>
            <h1>Modificar Herramientas</h1>
            <form action="<%= request.getContextPath()%>/CtrTipo_Herramientas">
                <div class="form-group">
                    <label for="" class="control-label">ID</label>
                    <input type="number" readonly="readonly" style="background:rgba(0,0,0,0.1)" class="form-control" name="txtId_tipo_herramientas" value="<%= hta.getId_tipo_herramientas()%>" placeholder="Id">
                </div>
                
                <div class="form-group">
                    <label for="" class="control-label">Tipo de Herramientas</label>
                    <input type="text" class="form-control" name="txtTipo_herramientas" value="<%= hta.getTipo_herramientas()%>" placeholder="Tipo de Herramienta">
                </div>    

                <div class="form-group"> 
                    <label for="" class="control-label">Descripción</label>
                    <input type="text" class="form-control" name="txtDescripcionHta" value="<%= hta.getDescripcion()%>" placeholder="Descripción">
                </div>
                <br>

                <p><button type="submit" name="accion" class="btn btn-primary" value="btnActualizarTipoHta">Modificar Tipo de Herramienta</button></p>
            </form>
        </div>    
    </body>
</html>
