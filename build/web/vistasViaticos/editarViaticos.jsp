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
     <div class="container">
            <div class="col-lg-6">
                
               <%
                    DAOViaticos dao = new DAOViaticos();
                    int Id_viatico=Integer.parseInt((String)request.getAttribute("Id_viaticos"));
                    DTOViaticos via= (DTOViaticos) dao.list(Id_viatico);
                    
                    %>
                    
                    
                    
       <h1>Modificar Viaticos</h1>
        <form action="<%=request.getContextPath()%>/CtrViaticos">
            
            <input class="form-control" hidden="true" name ="txtid_viaticos" value ="<%=via.getId_viaticos()%>">
            
            Descripcion : <br>
            <input class="form-control" type="text" value="<%= via.getDescripcion_viatico()%>" name="txtDescripcion_viatico" required><br> 
            Tipo Viatico  : <br>
            <input class="form-control" type="text" value="<%= via.getTipo_viatico()%>" name="txtTipo_viatico" required><br>
            Nombres del Trabajador: <br>
            <input class="form-control" type="text" value="<%= via.getNombres_trabajador()%>" name="txtNombre_trabajador" required><br>
            id usuario: <br>
            <input class="form-control" type="number" value="<%=via.getId_usuario()%>" name="txtid_usuario" required>
             Valor_viatico : <br>
            <input class="form-control" type="text" value="<%=via.getValor_viatico()%>" name="txtvalor_viatico" required>
             Insertar Evidencia : <br>
            <input type="file" class="form-control-file" id="File" value="<%=via.getInsertar_evidencia()%>" name="txtInsertar_evidencia" required>
             <div class="form-group">
   
    

            
            
            <input class="btn btn-warning" type="submit" name="accion" value="Actualizar">
            
            <a class="btn btn-danger" href="CtrViaticos?accion=add">Regresar</a>
        </form>
            </div>
        </div>   

    </body>
</html>
