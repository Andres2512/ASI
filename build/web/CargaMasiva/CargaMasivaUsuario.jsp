
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <form id="frm_contact" name="frm_contact" action="<%=request.getContextPath()%>/CtrCargaMasivaUsuario" enctype="multipart/form-data" method="post">
            <div class="field">
                <label>Adjuntar archivo<span class="required">*</span></label>
                <div class="inputs">
                    <input type="hidden" name="marca" value="upload">
                    <input class="btn btn-success" type="file" name="fichero" size="70" accept="text/plain;image/jpeg">
                </div>
            </div>  
            <input type="submit"value="Enviar datos">
        </form>
    </body>
</html>
