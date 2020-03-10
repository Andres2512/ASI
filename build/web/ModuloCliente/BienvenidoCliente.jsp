<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css"/>
        <title></title>
    </head>
    <body>
        <nav style="
             background: rgb(242,159,20);
             background: linear-gradient(122deg, rgba(242,159,20,1) 0%, rgba(52,58,63,1) 78%);
             " class="navbar scrolling-navbar stiky navbar-expand-lg navbar-dark ">
            <div class="container">
                <a><img  src="<%=request.getContextPath()%>/img/A$I_png-logo.png" height="80" width="80" ></a><br> 
                <a class="navbar-brand" href="#"><img src="<%=request.getContextPath()%>/img/A$I_png-nombre.png" alt="" width="35%" height="35%"></a>
                <div class="cantiner nt-4">
                    <h1 class="text-white">Bienvenid@ <strong>Cliente</strong></h1>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active"></li>
                        </ul>
                    </div> 
                </div>              
            </div> 
        </nav>
    </body>
</html>
