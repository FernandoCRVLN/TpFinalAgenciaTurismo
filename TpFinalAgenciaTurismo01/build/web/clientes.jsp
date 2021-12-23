<%-- 
    Document   : alta_empleados
    Created on : 12/12/2021, 19:24:05
    Author     : FerCod
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- SEO Meta Tags -->
    <meta name="description"
        content="Alta de Empleados">
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
    <title>Alta Nuevos Clientes</title>

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
    <link href="css/table.css" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="images/favicon.png">
</head>

<body>
    <%
    HttpSession misession = request.getSession();
    String usuario = (String) misession.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    } else {%>
    
        <!-- Navbar -->
    <nav class="navbar navbar-expand-md navbar-dark navbar-custom fixed-top">
        <!-- Text Logo - Use this if you don't have a graphic logo -->
        <!-- <a class="navbar-brand logo-text page-scroll" href="index.html">Aria</a> -->

       
        <!-- Mobile Menu Toggle Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-awesome fas fa-bars"></span>
            <span class="navbar-toggler-awesome fas fa-times"></span>
        </button>
        <!-- end of mobile menu toggle button -->

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="index.jsp">INICIO <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="principal.jsp">PRINCIPAL <span class="sr-only">(current)</span></a>
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
                    <a class="nav-link page-scroll" href="alta_venta.jsp">ALTA DE VENTAS</a>
                </li>


                <li class="nav-item">
                    <a class="nav-link page-scroll" href="#contact">CONTACT</a>
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
    <!-- end of navbar -->


    <!-- Call Me Form -->
    <div id="Alta" class="form-1">
        <h2 class="form-titulo" style="text-align: center; color: aqua;">CLIENTES</h2>
        <div class="container">
                <div class="row">
                    <table class="tbl-header">
                        <thead >
                        <th >Nombre Cliente</th>
                        <th >DNI</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Nacionalidad</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th style=" width: 200px">e-mail</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                        </thead>
                        <tbody>
                            <% HttpSession miSession = request.getSession();

                        List <Cliente> listaClientes = (List) request.getSession().getAttribute("listaClientes");
                            for(Cliente unCliente : listaClientes){
                                %>

                            <tr>
                                <% String nombreCompleto = unCliente.getNombre() + " " + unCliente.getApellido(); 
                                   String dni = unCliente.getDni();
                                   String nacionalidad = unCliente.getNacionalidad();
                                   String direccion = unCliente.getDireccion();
                                   String telefono = unCliente.getCelular();
                                   String email = unCliente.getEmail();
                                   Date fecha = unCliente.getFechaNacimiento();
                                   int idCliente = unCliente.getId_cliente();
                                   
                                   SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                                   String fechaString = sdf.format(fecha);
                                %>
                                <td><%= nombreCompleto %></td>
                                <td><%= dni %></td>
                                <td><%= fechaString %></td>
                                <td><%= nacionalidad %></td>
                                <td><%= direccion %></td>
                                <td><%= telefono %></td>
                                <td><%= email %></td> 
                                
                                
                                <td>
                                    <form style="align-content: center; margin: auto" name="formEditarrCliente" action="SvCliente_Editar" method="post">
                                        <input type="hidden" name="cliente" value="<%= idCliente%>">
                                        <button type="submit" >MODIFICAR</button>
                                    </form>
                                    
                                </td>
                                <td>
                                    <form style="align-content: center; margin: auto" name="formBorrarCliente" action="SvCliente_Eliminar" method="post">
                                        <input type="hidden" name="cliente" value="<%= idCliente%>">
                                        <button type="submit">ELIMINAR</button>
                                    </form>
                                </td>   
                                

                                <% } %>
                            </tr>
                        </tbody>
                        
                    </table>
                    <div style="margin: auto;">
                        <div class="text-container">
                            <a class="btn-solid-lg page-scroll" href="alta_cliente.jsp">NUEVO CLIENTE</a>
                        </div>
                    </div>
                </div> <!-- end of row -->
            <!-- end of call me form -->
        </div> <!-- end of container -->
    </div> <!-- end of form-1 -->
    <% } %>

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