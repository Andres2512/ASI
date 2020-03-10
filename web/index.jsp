
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>A$I</title>
        <link rel="shortcut icon" href="img/A$I_png-logo.png">
        <link rel="stylesheet" href="css/cssIndex.css">

        <!-- BOOTSTRAP 4 online -->	
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- END BOOTSTRAP 4 online -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <nav style="background: #F09D1E" class="navbar scrolling-navbar stiky navbar-expand-lg navbar-dark ">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="img/A$I_png-nombre.png" alt="" width="35%" height="35%"></a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" data-scroll href="#">Inicio
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-scroll href="#hiper1">A$I de Objetivos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-scroll href="#hiper2">A$I Somos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-scroll href="#hiper3">Contáctenos</a>
                        </li>

                        <li class="log_in nav-item dropdown">
                            <a class="logPrinc nav-link dropdown-toggle" data-toggle="dropdown" data-target="dropdown_target"  >INGRE$E<span class="caret"></span></a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown_target">
                                <ul class="navbar-nav">
                                    <a class="dropdown-item"href="<%= request.getContextPath()%>/CtrLogin?accion=iniciarSesion"><i class="fas fa-user-circle"></i><b>Ingrese</b></a>
                                    <a class="dropdown-item" href="<%= request.getContextPath()%>/CrtUsuario?accion=add"><i class="fas fa-sign-in-alt"></i><b>Registrese</b></a>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- HEADER -->
        <header>
            <div class="sharp">
                <img src= "img/A$I_png-nombre.png" alt="">

                <img class="enca2 d-none d-lg-inline d-md-none"src= "img/A$I_png-logo.png" alt="">

                <p class="lead my-5 text-white"><b>AHORRO - SISTEMA DE INFORMACIÓN<br>Facilita tu Construcción</b></p>
            </div>
        </header>
        <!-- HIPER 1 (objetivos) -->
        <h1 id="hiper1" class="orangeClass lead">
            <div class="container py-2 text-center">
                <b>A$I de Objetivos</b>
            </div>	
        </h1>		
        <main>
            <!-- MENÚ -->
            <div class="container-fixed mx-4">
                <div class="row text-justify">
                    <div class="objective col-sm-12 col-md-6 col-lg-3">
                        <img class="" src="img/ob1.png" alt="">
                        <br>
                        <h2>Facilitar</h2>
                        <p>El cálculo y control de los materiales, herramientas y equipos necesarios para el desarrollo del proyecto.</p>
                    </div>
                    <div class="objective col-sm-12 col-md-6 col-lg-3">
                        <img class="" src="img/ob2.png"  alt="">

                        <br>
                        <h2>Generar</h2>
                        <p>Reportes de los estados del proyecto para el cliente.</p>
                    </div>
                    <div class="objective col-sm-12 col-md-6 col-lg-3">
                        <img class="" src="img/ob3.png" alt="">
                        <br>
                        <h2>Facilitar</h2>
                        <p>La planeación y cotización de cada uno de los proyectos solicitados por los clientes.</p>
                    </div>
                    <div class="objective col-sm-12 col-md-6 col-lg-3">
                        <img class="" src="img/ob4.png" alt="">
                        <br>
                        <h2>Permitir</h2>
                        <p>El control del personal por cada uno de los proyectos.</p>
                    </div>				
                </div>
            </div>
        </main>
        <h1 id="hiper2" class="orangeClass lead" style="margin-top: 50px;">
            <div class="container py-2 text-center">
                <b>A$I Somos</b>
            </div>	
        </h1>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-1">
                    <div></div>
                </div>
                <div class="col-sm-12 order-md-1 col-md-12 col-lg-10 order-lg-0">
                    <p class="text-justify lead">Una empresa innovadora especializada en construcción integral, que tiene el convencimiento de que las cosas se pueden y se deben realizar de otra manera.<br>En <b style="font-weight: 600; font-family: Microsoft YaHei Light">ELIZARCONSTRUCCIONES S.A.S</b> escapamos del estereotipo de constructora, del discurso estándar y del conformismo de ser uno más en el directorio de empresas. Queremos distinguirnos, salirnos de la fila, ofrecer un valor añadido que deje nuestra impronta en los proyectos que ejecutamos, permaneciendo siempre atentos a las nuevas tendencias y dispuestos a dar respuesta a las exigencias de nuestros clientes.</p>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-1">
                </div>
            </div>
            <hr style="background: black;">
            <div class="row"> 
                <div class="col-sm-12 col-md-6 col-lg-4">
                    <center><img src="img/A$I_png-nombre.png" alt="" class="w-50"></center>
                </div>
                <div class="col-sm-12 order-md-1 col-md-12 col-lg-4 order-lg-0">
                    <p class="elizar text-center align-text-bottom border"><b>ELIZARCONSTRUCCIONES S.A.S</b></p>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-4">
                    <center><img src="img/A$I_png-nombre.png" alt="" class="w-50"></center>
                </div>
            </div>
            <hr style="background: black;">
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-1">
                </div>
                <div class="col-sm-12 order-md-1 col-md-12 col-lg-10 order-lg-0">
                    <p class="text-justify lead">Con un sistema de gestión totalmente orientado al cliente, y perfilada con unos valores presentes en todas nuestras actuaciones: transparencia, seriedad y compromiso, afrontamos el día a día con el objetivo de posicionarnos como empresa referente en el sector, demarcamos un camino y una metodología de trabajo que nos distingan en el mercado como su constructora de confianza.</p>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-1">
                </div>
            </div>
        </div>
        <br>
        <div class="container-fixed text-center team">
            <h1 class="greenClass lead">
                <div class="container-fixed py-2 text-center">
                    <b>El Equipo de Trabajo</b>
                </div>	
            </h1>		
            <div class="container p-1">
                <p class="text-black lead"><br>Nuestro Equipo de trabajo está conformado por personas con capacidades tanto únicas como inigualables, destacándose por un talento en el campo de las tecnologías de la información y la comunicación que los hacen los mejores en su trabajo.</p>
                <br>
            </div>    	
            <section class="section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                            <div class="card border-0 rounded-0 hover-shadow">
                                <img class="card-img-top rounded-0" src="img/person1.jpg" alt="persona1">

                                <div class="card-body">
                                    <h4 class="card-title">Daniel Cuellar</h4>
                                    <div class="text-center">
                                        <span>Desarrollador Back-end</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                            <div class="card border-0 rounded-0 hover-shadow">
                                <img class="card-img-top rounded-0" src="img/person3.jpg" alt="persona03">

                                <div class="card-body">
                                    <h4 class="card-title">Vanessa Araujo</h4>
                                    <div class="text-center">
                                        <span>Desarrolladora Fullstack</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                            <div class="card border-0 rounded-0 hover-shadow">
                                <img class="card-img-top rounded-0" src="img/person5.jpg" alt="persona04">

                                <div class="card-body">
                                    <h4 class="card-title">Jose Romero</h4>
                                    <div class="text-center">
                                        <span>Web Developer / Diseñador</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>			
            <h1 id="hiper3" class="orangeClass lead" style="margin-top: 50px;">
                <div class="container py-2 text-center">
                    <b>Contáctenos</b>
                </div>	
            </h1>
        </div>
        <section class="bg-light py-5">
            <div class="container">
                <p class="lead">¿Alguna opinión, queja o reclamo? Envíanos un mensaje.</p>
                <form id="frm_PQRS" class="container">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <i class="fas fa-user input-group-text"></i>
                        </div>
                        <input type="text" class="form-control" placeholder="Nombre" name="NameP"aria-label="Username" aria-describedby="basic-addon1">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <i class="fas fa-envelope input-group-text"></i>
                        </div>
                        <input type="text" class="form-control" placeholder="Correo" name="EmailP" aria-label="Username" aria-describedby="basic-addon1">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <i class="fas fa-pencil-alt input-group-text"></i>
                        </div>
                        <textarea name="MessageP" cols="30" rows="10" placeholder="Mensaje"  class="form-control"></textarea>
                    </div>
                    <button type="submit" id="btn_Enviar" class="btn btn-warning btn-block">Enviar</button>
                </form>
            </div>
        </section>
        <!-- END HIPER 3 -->

        <!-- FOOTER -->		
        <footer class="bg-dark">
            <div class="container p-3">
                <div class="row text-center text-white">
                    <div class="col ml-auto">
                        <p style="font-weight: 600; margin-bottom: -5px;">SENA - ADSI</p>
                        <p class="lead">Copyright &copy; 2019</p>
                        <button class="btn btn-info align-top text-center pl-auto"><a href="index_en.jsp"><i class="fas fa-globe-americas"></i> (<b style="color: gold;">En</b>)</a></button>
                    </div>
                </div>
            </div>       
        </footer>
        <!-- END FOOTER -->

        <!-- SCRPTS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="js/jquery.scrollUp.js"></script>
        <script src="js/smooth-scroll.polyfills.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.js"></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>-->
        <link href="<%= request.getContextPath()%>/js/sweetAlert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
            <script src="<%= request.getContextPath()%>/js/sweetAlert2/sweetalert2.all.min.js" type="text/javascript"></script>
        <script>
            //funccion ajax para enviar el formulario de contactenos y registrar el pqrs del invitado
            $(function () {
                $('#btn_Enviar').click(function (e) {
                    e.preventDefault();
                    var datos = $('#frm_PQRS').serialize();
                    $("#frm_PQRS")[0].reset();
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/CrtPqrs?accion=AgregarPQRS",
                        data: datos,
                        success: function (r) {
                            //                                    $(':text', $('#frm_PQRS')).val('');
                            //                                    document.getElementById("lim").value = "";
                            if (r == 1) {
                                Swal.fire({
                                    type: 'success',
                                    title: '¡Mensaje enviado exitosamente!',
                                    width: 500,
                                    padding: '1em',
                                    confirmButtonColor: 'gold',
                                    showConfirmButton: true,
                                    timer: 2500
                                });
                            } else {
                                Swal.fire({
                                    type: 'error',
                                    title: '¡Error al enviar el mensaje! ',
                                    text: 'Inténtelo de nuevo',
                                    width: 500,
                                    confirmButtonColor: 'gold',
                                    padding: '5em',
                                    showConfirmButton: false,
                                    timer: 4000 //el tiempo que dura el mensaje en ms
                                });
                                listar();
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>
