<%-- 
    Document   : alta_empleados
    Created on : 12/12/2021, 19:24:05
    Author     : FerCod
--%>

<%@page import="logica.PaqueteTuristico"%>
<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- SEO Meta Tags -->
    <meta name="description"
        content="Alta Ventas">
    <meta name="author" content="Inovatik">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
    <meta property="og:site_name" content="" /> <!-- website name -->
    <meta property="og:site" content="" /> <!-- website link -->
    <meta property="og:title" content="" /> <!-- title shown in the actual shared post -->
    <meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
    <meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
    <meta property="og:url" content="" /> <!-- where do you want your post to link to -->
    <meta property="og:type" content="article" />

    <!-- Website Title -->
    <title>Alta Nuevos Servicios</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:500,700&display=swap&subset=latin-ext"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,600&display=swap&subset=latin-ext"
        rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/fontawesome-all.css" rel="stylesheet">
    <link href="css/swiper.css" rel="stylesheet">
    <link href="css/magnific-popup.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="images/favicon.png">
    
    
</head>

<body>
    
    <script>
            function seleccionarPaquete() {
                let servicio = document.getElementById('servicio');
                let paquete = document.getElementById('paquete');

                if (document.getElementById('seleccionPaquete').checked) {
                    servicio.disabled = !servicio.disabled;
                    paquete.disabled = !paquete.disabled;
                    paquete.value = "";
                } else {
                    servicio.disabled = !servicio.disabled;
                    paquete.disabled = !paquete.disabled;
                    servicio.value = "";
                }
            }
        </script>

    <nav class="navbar navbar-expand-md navbar-dark navbar-custom fixed-top">
        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="index.jsp">INICIO <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="alta_cliente.jsp">ALTA CLIENTES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="alta_empleado.jsp">ALTA EMPLEADOS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="alta_servicio.jsp">ALTA DE SERVICIOS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="alta_paquete.jsp">ALTA DE PAQUETES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="newjsp.jsp">prueba</a>
                </li>

            </ul>
            <span class="nav-item social-icons">
                <span class="fa-stack">
                    <a href="#your-link">
                        <span class="hexagon"></span>
                        <i class="fab fa-facebook-f fa-stack-1x"></i>
                    </a>
                </span>
                <span class="fa-stack">
                    <a href="#your-link">
                        <span class="hexagon"></span>
                        <i class="fab fa-twitter fa-stack-1x"></i>
                    </a>
                </span>
            </span>
        </div>
    </nav> <!-- end of navbar -->

    <!-- Call Me Form -->
    <div id="Alta" class="form-1">
        <h2 class="form-titulo" style="text-align: center; color: aqua;">NUEVAS VENTAS</h2>
        <div class="container">
            <form id="Alta" data-toggle="validator" data-focus="false" action="SvVenta" method="POST">
                
                <%Controladora control = new Controladora();%>
                
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <select class="form-control-input" name="id_empleado" id="id_empleado" required>
                                <option class="label-control" disabled selected value> -- Selecione Empleado -- </option>
                                <%
                                    List<Empleado> listaEmpleado = control.listaEmpleado();
                                    for (Empleado unEmpleado : listaEmpleado) {
                                %>                  
                                <option value="<%= unEmpleado.getId_empleado()%>">
                                    <%= unEmpleado.getDni()%> - <%= unEmpleado.getNombre()%> <%= unEmpleado.getApellido() %>
                                </option>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control-input" name="id_cliente" id="id_cliente" required>
                                <option class="label-control" disabled selected value> -- Selecione Cliente -- </option>
                                <%
                                    List<Cliente> listaClientes = control.listaCliente();
                                    for (Cliente unCliente : listaClientes) {
                                %>                  
                                <option value="<%= unCliente.getId_cliente()%>">
                                    <%= unCliente.getDni()%> - <%= unCliente.getNombre()%> <%= unCliente.getApellido() %>
                                </option>
                                <% }%>
                            </select>
                        </div>  
                        <div class="form-group">
                            <div class="form-control-input">
                            <label > Seleccionar Servicio  </label>
                            <input type="checkbox" name="seleccionPaquete" id="seleccionPaquete" onclick="seleccionarPaquete()" checked>
                            <label > Solo un Servicio por Venta  </label>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <select class="form-control-input" name="servicio" id="servicio" >
                                <option class="label-control" disabled selected value> -- Selecione Servicio -- </option>
                                <%
                                    List<ServicioTuristico> listaServicio = control.listaServicio();
                                    for (ServicioTuristico unServicio : listaServicio) {
                                %>                  
                                <option value="<%= unServicio.getCodigo_servicio()%>">
                                    <%= unServicio.getDescripcion_breve()%> %>
                                </option>
                                <% }%>
                            </select>
                        </div>
                    </div> <!-- end of col -->
                    <div class="col-lg-6">

                        <div class="form-group">
                            <input type="date" class="form-control-input" id="fechaVenta" name="fechaVenta" required>
                            <label class="label-control" for="fechaVenta">Fecha de Venta</label>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <select class="form-control-input" name="medioPago" title="Medio de Pago">
                                <option class="label-control" disabled selected value> -- Medio de Pago -- </option>
                                <option>Efectivo</option>
                                <option>Tarjeta de Débito</option>
                                <option>Tarjeta de Crédito</option>
                                <option>Monedero virtual</option>
                                <option>Transferencia</option>
                            </select>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <select class="form-control-input" name="paquete" id="paquete" disabled>
                                <option class="label-control" disabled selected value> -- Selecione Paquete -- </option>
                                <%
                                    List<PaqueteTuristico> listaPaquete = control.listaPaquete();
                                    for (PaqueteTuristico unPaquete : listaPaquete) {
                                %>                  
                                <option value="<%= unPaquete.getCodigo_paquete()%>">
                                    <%= unPaquete.getNombre()%> %>
                                </option>
                                <% }%>
                            </select>
                        </div>
                        
                    </div> <!-- end of col -->
                </div> <!-- end of row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <button type="reset" class="form-control-submit-button">BORRAR DATOS</button>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <button type="submit" class="form-control-submit-button">GUARDAR DATOS</button>
                        </div>
                        <div class="form-message">
                            <div id="lmsgSubmit" class="h3 text-center hidden"></div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- end of call me form -->
        </div> <!-- end of container -->
    </div> <!-- end of form-1 -->

    <script src="js/jquery.min.js"></script> <!-- jQuery for Bootstrap's JavaScript plugins -->
    <script src="js/popper.min.js"></script> <!-- Popper tooltip library for Bootstrap -->
    <script src="js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
    <script src="js/jquery.easing.min.js"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
    <script src="js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
    <script src="js/jquery.magnific-popup.js"></script> <!-- Magnific Popup for lightboxes -->
    <script src="js/morphext.min.js"></script> <!-- Morphtext rotating text in the header -->
    <script src="js/isotope.pkgd.min.js"></script> <!-- Isotope for filter -->
    <script src="js/validator.min.js"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
    <script src="js/scripts.js"></script> <!-- Custom scripts -->
</body>

</html>