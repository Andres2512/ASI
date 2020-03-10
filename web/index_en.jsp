<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>A$I</title>
        <link rel="shortcut icon" href="images/A$I_png-logo.png">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/cssIndex.css">

        <!-- BOOTSTRAP 4 online -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- END BOOTSTRAP 4 online -->

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>

    <!-- INICIO DEL CUERPO -->
    <body>

        <!-- NAV -->
        <nav style="background: #F09D1E" class="navbar scrolling-navbar stiky navbar-expand-lg navbar-dark ">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="<%= request.getContextPath()%>/img/A$I_png-nombre.png" alt="" width="35%" height="35%"></a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" data-scroll href="#">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-scroll href="#hiper1">Objective$</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-scroll href="#hiper2">About u$</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-scroll href="#hiper3">Contact u$</a>
                        </li>

                        <li class="log_in nav-item dropdown">
                            <a class="logPrinc nav-link dropdown-toggle" data-toggle="dropdown" data-target="dropdown_target" href="#">
                                LOGIN
                                <span class="caret"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown_target">
                                <ul class="navbar-nav">
                                    <a class="dropdown-item" href="<%= request.getContextPath()%>/vistasLogin/login.jsp"><i class="fas fa-user-circle"></i><b>Log In</b></a>
                                    <a class="dropdown-item" href="<%= request.getContextPath()%>/CrtUsuario?accion=add"><i class="fas fa-sign-in-alt"></i><b>Sign Up</b></a>
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
                <img src="<%= request.getContextPath()%>/img/A$I_png-nombre.png" alt="">
                <img class="enca2 d-none d-lg-inline d-md-none"src="<%= request.getContextPath()%>/img/A$I_png-logo.png" alt="">
                <p class="lead my-5 text-white"><b>AHORRO - SISTEMA DE INFORMACIÓN<br>Facilitate your Construction</b></p>
            </div>
        </header>
        <!-- HIPER 1 (objetivos) -->
        <h1 id="hiper1" class="orangeClass lead">
            <div class="container py-2 text-center">
                <b>OBJECTIVE$</b>
            </div>	
        </h1>		
        <main>
            <!-- MENÚ -->
            <div class="container-fixed mx-4">
                <div class="row text-justify">
                    <div class="objective col-sm-12 col-md-6 col-lg-3">
                        <img class="" src="<%= request.getContextPath()%>/img/ob1.png" alt="">
                        <br>
                        <h2>Facilitate</h2>
                        <p>The calculation and control of the materials, tools and equipment necessary for the development of the project.</p>
                    </div>
                    <div class="objective col-sm-12 col-md-6 col-lg-3">
                        <img class="" src="<%= request.getContextPath()%>/img/ob2.png" alt="">
                        <br>
                        <h2>Generate</h2>
                        <p>Reports of project states for clients.</p>
                    </div>
                    <div class="objective col-sm-12 col-md-6 col-lg-3">
                        <img class="" src="<%= request.getContextPath()%>/img/ob3.png" alt="">
                        <br>
                        <h2>Facilitate</h2>
                        <p>The planning and budget of each one of the projects requested by the clients.</p>
                    </div>
                    <div class="objective col-sm-12 col-md-6 col-lg-3">
                        <img class="" src="<%= request.getContextPath()%>/img/ob4.png" alt="">
                        <br>
                        <h2 class="">Allow</h2>
                        <p>The control of personnel for each of the projects</p>
                    </div>				
                </div>
            </div>
        </main>
        <!-- END HIPER 1-->

        <!-- HIPER 2 (acerca de) -->		
        <h1 id="hiper2" class="orangeClass lead" style="margin-top: 50px;">
            <div class="container py-2 text-center">
                <b>ABOUT U$</b>
            </div>	
        </h1>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-1">
                    <div></div>
                </div>
                <div class="col-sm-12 order-md-1 col-md-12 col-lg-10 order-lg-0">
                    <p class="text-justify lead">An innovative company specialized in integral construction, that is convinced that things can and should be done in another way. 
                        <br>In <b style="font-weight: 600; font-family: Microsoft YaHei Light">ELIZARCONSTRUCCIONES S.A.S</b> we escape the construction stereotype, of standard discourse and conformism to be one more in the directory of companies. 
                        <br>We want to stand out, be different, offer an added value that leaves our stamp on the projects we execute, always staying attentive to new trends and always be willing to respond to the demands of our customers.</p>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-1">
                </div>
            </div>
            <hr style="background: black;">
            <div class="row"> 
                <div class="col-sm-12 col-md-6 col-lg-4">
                    <center><img src="<%= request.getContextPath()%>/img/A$I_png-nombre.png" alt="" class="w-50"></center>
                </div>
                <div class="col-sm-12 order-md-1 col-md-12 col-lg-4 order-lg-0">
                    <p class="elizar text-center align-text-bottom border"><b>ELIZARCONSTRUCCIONES S.A.S</b></p>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-4">
                    <center><img src="<%= request.getContextPath()%>/img/A$I_png-nombre.png" alt="" class="w-50"></center>
                </div>
            </div>
            <hr style="background: black;">
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-1">
                </div>
                <div class="col-sm-12 order-md-1 col-md-12 col-lg-10 order-lg-0">
                    <p class="text-justify lead">With a management system totally oriented to the client, and outlined with some values present in all our actions: Transparency, seriousness and commitment, we face the day to day with the aim of positioning ourselves as a benchmark company in the sector, we trace a path and a methodology of work that distinguishes us in the market as its trusted constructor.</p>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-1">
                </div>
            </div>
        </div>
        <br>

        <!-- TEAM () -->
        <div class="container-fixed text-center team">
            <h1 class="greenClass lead">
                <div class="container-fixed py-2 text-center">
                    <b>Our Work Team</b>
                </div>	
            </h1>		
            <div class="container p-1">
                <p class="text-black lead"><br>Our Team is made up of people with both unique and incomparable abilities, standing out for their talent in the field of information and communication technologies and that makes them the best in their work.</p>
                <br>
            </div>    	
            <section class="section">
                <div class="container">
                    <div class="row justify-content-center">

                        <!-- USER TEAM 1 -->
                        <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                            <div class="card border-0 rounded-0 hover-shadow">
                                <img class="card-img-top rounded-0" src="<%= request.getContextPath()%>/img/person1.jpg" alt="persona1">
                                <div class="card-body">
                                    <h4 class="card-title">Daniel Cuellar</h4>
                                    <div class="text-center">
                                        <span>Back-end Developer</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                                
                        <!-- USER TEAM 3 -->
                        <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                            <div class="card border-0 rounded-0 hover-shadow">
                                <img class="card-img-top rounded-0" src="<%= request.getContextPath()%>/img/person3.jpg" alt="persona03">
                                <div class="card-body">
                                    <h4 class="card-title">Vanesa Araujo</h4>
                                    <div class="text-center">
                                        <span>Fullstack Developer</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- USER TEAM 4 -->
                        <div class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
                            <div class="card border-0 rounded-0 hover-shadow">
                                <img class="card-img-top rounded-0" src="<%= request.getContextPath()%>/img/person5.jpg" alt="persona04">
                                <div class="card-body">
                                    <h4 class="card-title">Jose Romero</h4>
                                    <div class="text-center">
                                        <span>Web Developer / Designer</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- /teachers -->
            <!-- END HIPER 2 -->
        </div>
        <br>
        
        <!-- FOOTER -->		
        <footer class="bg-dark">
            <div class="container p-3">
                <div class="row text-center text-white">
                    <div class="col ml-auto">
                        <p style="font-weight: 600; margin-bottom: -5px;">SENA - ADSI</p>
                        <p class="lead">Copyright &copy; 2019</p>
                        <button class="btn btn-info align-top text-center pl-auto"><a href="<%= request.getContextPath()%>/index.jsp"><i class="fas fa-globe-americas"></i> (<b style="color: gold;">Es</b>)</a></button>
                    </div>
                </div>
            </div>       
        </footer>
        <!-- END FOOTER -->

        <!-- SCRPTS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.scrollUp.js"></script>
        <script src="<%= request.getContextPath()%>/js/smooth-scroll.polyfills.min.js"></script>
        <script>
            $(function () {
                $.scrollUp({scrollImg: true});
            });
        </script>
        <script>
            var scroll = new SmoothScroll('a[href*="#"]', {
                customEasing: function (time) {
                    return time < 0.5 ? 2 * time * time : -1 + (4 - 2 * time) * time;
                }
            });
        </script>
    </body>
    <!-- FIN DEL CUERPO -->
</html>
