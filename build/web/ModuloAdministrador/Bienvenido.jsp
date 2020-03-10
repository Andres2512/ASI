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
                    <h1 class="text-white">Bienvenid@ <strong>Administrador</strong></h1>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active"></li>
                        </ul>
                    </div> 
                </div>              
            </div> 
        </nav>
        <br>
        <br>
    <center>
        <div class="form-group " style="margin-top: -10px">
            <div class="form-row">
                <div class="col-md-12 ">
                    <h2 class="" id="enviarmensajeee" style="text-align: center; font-size: 2.6em;color: #343A3F">Enviar correo</h2>
                    <br> <a><img style="margin-top: -20px" class="foto" data-toggle="modal" data-target="#modaenviarMensaje" width="20%" src="../img/enviar.png"></a>
                </div>
            </div>
        </div>
    </center>


    <!--     ************************MODAL ENVIAR MENSAJES  CORREO  ******************--> 
    <div class="modal fade" id="modaenviarMensaje" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg"  role="document">
            <div class="modal-content" >
                <div class="modal-body">
                    <div class="container">
                        <div class="card card-register mx-auto mt-4" style="border: none">
                            <div class="my-form-top">
                                <div class="myform-top-left">
                                    <br>
                                    <h3 id="enviarcorreoooooooo" style="font-family: cursive; font-weight: 600; font-size: 2.1em">Enviar correo...</h3>
                                </div>
                                <div class="Myform-top-right">
                                    <i class="fas fa-money-check-alt"> </i>
                                </div>
                            </div>
                            <div class="card-body">
                                <form id="frm_contact" name="frm_contact"  enctype="multipart/form-data" >
                                    <center>
                                        <div class="form-group">
                                            <div class="form-row">                                                
                                                <div class="col-md-12">
                                                    <textarea style="font-weight: 600; font-size: 1em;font-family: sans-serif; height: 1px; visibility: hidden" class="form-control" type="text" id="Documentojjjjjjjjjj" name="correosssssssss" ></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">   
                                                <div class="col-md-12">
                                                    <label id="asuntoCorreo" class="letra">Asunto:</label>
                                                    <input style="font-weight: 600; font-size: 1em;font-family: sans-serif" class="form-control" type="text" id="asunto" name="asunto" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">                                                
                                                <div class="col-md-12">
                                                    <label id="adjuntarArchivocorreo"class="letra">Adjuntar archivo</label>
                                                    <input  type="hidden" name="todo" value="upload">
                                                    <input class="form-control"type="file" name="fichero" size="70" accept="text/plain;image/jpeg">
                                                </div> 
                                            </div>
                                        </div> 		
                                        <div class="form-group">
                                            <div class="form-row">  
                                                <div  class="col-md-12">
                                                    <label id="mensajecorreo" class="letra">Mensaje</label>
                                                    <textarea style="font-weight: 600; font-size: 1em;font-family: sans-serif" class="form-control" id="mensaje" name="mensaje" cols="20" rows="8"></textarea>
                                                </div>
                                            </div>
                                        </div> 	</center>	
                                    <div class="form-submit" style="float: right"> 
                                        <button id="btn_CAncelarCorreo" type="submit" class="btn btn-outline-danger" data-dismiss="modal" >Cancelar</button>  
                                        <button id="btn_EnviarCorreo" type="submit" class="btn btn-outline-success btnEnviarCorreo" name="submit" value="Enviar">Enviar correos(s)</button>  
                                    </div>                                            						
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
<script>
//  ************************  FUNCION PARA ENVIAR CORREO MASIVO   ******************************
    $(function () {
        $('#btn_EnviarCorreo').click(function (e) {
            e.preventDefault();
            var datos = new FormData($('#frm_contact')[0]);
            $("#frm_contact")[0].reset();
            $("#modaenviarMensaje").modal("toggle");
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/CargarFichero",
                data: datos,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data == 1) {
                        Swal.fire({
                            type: 'success',
                            title: '¡Correo enviado satisfactoriamente! ',
                            width: 500,
                            padding: '5em',
                            showConfirmButton: false,
                            timer: 2000 //el tiempo que dura el mensaje en ms
                        });
                    } else {
                        Swal.fire({
                            type: 'error',
                            title: '¡Correo no pudo ser enviado! ',
                            text: 'Inténtelo de nuevo',
                            width: 500,
                            padding: '5em',
                            showConfirmButton: false,
                            timer: 4000 //el tiempo que dura el mensaje en ms
                        });
                    }
                }
            });
        });
    });
</script>
<script>
//    FUNCION PARA LLENAR EL CAMPO CON LOS CORREOS DE LOS JUGADORES
    $(document).ready(function () {
        listarJugadores();
    });

    var listarJugadores = function () {
        var data = "";
        $.ajax({
            url: "<%=request.getContextPath()%>/PedirCorreos?accion=ListarP",
            type: "POST",
            data: data,
            dataSrc: "datos",
            dataType: "json",
            success: function (data) {
                $.each(data.datos, function (i, field) {
                    $('#Documentojjjjjjjjjj').append(field.correos);
                });
            }
        });
    };
</script>
</html>
