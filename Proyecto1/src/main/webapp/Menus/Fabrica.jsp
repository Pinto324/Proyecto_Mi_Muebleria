<%-- 
    Document   : Fabrica
    Created on : 2/09/2021, 00:32:16
    Author     : branp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area De Fabrica</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#F9EED2;" >
        <!--Logeo en la pagina-->
        <%
            HttpSession Sesion = request.getSession();
                if(Sesion.getAttribute("user")!=null&&Sesion.getAttribute("nivel")!=null){                    
                }else{
                    out.print("<script>location.replace('../Login.jsp');</script>");
                }
         %>
        <!--Barra de navegación-->
        <div class="container-fluid">
            <nav class="navbar navbar-expand-md navbar-light bg-light border-3 border-bottom border-primary">
                <div class="container-fluid">
                    <a href="#" class="navbar-brand">Mi Muebleria</a>
                    <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#Navegacion">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div id="Navegacion" class="collapse navbar-collapse">
                        <ul class="navbar-nav"> 
                            <li class="nav-item dropdown">
                                <!--Barra de navegación de piezas-->
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Manejo de Piezas</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item">
                                            <a class="nav-link" href="OpcionesFabrica/CrearPieza.jsp">Crear Pieza</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="OpcionesFabrica/ModificarPieza.jsp">Modificar Pieza</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="OpcionesFabrica/EliminarPieza.jsp">Eliminar Pieza</a>
                                        </li>
                                    </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="OpcionesVentas/EnsambleDeMuebles.jsp">Ensamble de muebles</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="OpcionesVentas/ManejoDeMuebles.jsp">Manejo de piezas</a>
                            </li>
                        </ul>
                        <ul class="navbar-nav ms-3"> 
                            <li class="nav-item">
                                <a class="nav-link" href="../Login.jsp?cerrar=true">Cerrar Sesión</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>     
        </div>
        <!--
        <table border="0" width="1000" align="center">
            <tr style="background-color:#F8D29E;" opacity: .85;>
                <th ><a href="Fabrica.jsp">Menu principal</a></th>
                <th><a href="OpcionesVentas/ManejoDeMuebles.jsp">Manejo de Muebles</a></th>
                <th><a href="OpcionesVentas/EnsambleDeMuebles.jsp">Ensamble de muebles</a></th>
                <th><a href="../Login.jsp">Cerrar sesion</a></th>
                <th width="200"></th>
            </tr>
        </table>-->
        <h1>Hello World!</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    </body>
</html>
