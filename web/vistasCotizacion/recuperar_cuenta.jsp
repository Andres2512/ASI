<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="<%=request.getContextPath()%>/CtrRecuperarCuenta" method="POST">
            Correo:<br>
            <input  type="text" class="form-control" name="correo" required><br>
            <input type="submit" value="Enviar">            
        </form>
    </body>
</html>