<%-- 
    Document   : UsuariosCreacion
    Created on : 5/09/2021, 17:43:22
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="BaseDeDatos.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#EAF2F8;" >
        <!--Logeo en la pagina-->
        <%
            HttpSession Sesion = request.getSession();
                if(Sesion.getAttribute("user")!=null&&Sesion.getAttribute("nivel")!=null){                    
                }else{
                    out.print("<script>location.replace('../../Login.jsp');</script>");
                }
         %>
         <!--Barra de navegación-->
        <div class="container-fluid">
            <nav class="navbar navbar-expand-md navbar-light bg-light border-3 border-bottom border-primary">
                <div class="container-fluid">
                    <a href="../Administracion.jsp" class="navbar-brand">Mi Muebleria</a>
                    <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#Navegacion">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div id="Navegacion" class="collapse navbar-collapse">
                        <ul class="navbar-nav"> 
                            <li class="nav-item dropdown">
                                <!--Barra de navegación de piezas-->
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Manejo de Usuarios</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item">
                                            <a class="nav-link" href="UsuariosCreacion.jsp">Crear Usuarios</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="UsuariosModifcacion.jsp">Modificar Usuarios</a>
                                        </li>
                                    </ul>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" href="CreacionMuebles.jsp">Creacion de muebles</a>
                            </li>
                            <!--Barra de navegación de Muebles-->
                            <li class="nav-item-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Reportes</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item">
                                        <a class="nav-link" href="ReporteDevoluciones.jsp">Reporte de devoluciones</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="ReporteGeancia.jsp">Reporte de ganancias</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="ReporteMueble.jsp">Reportes de muebles</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="ReporteUsuarios.jsp">Reporte de los usuarios</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="ReporteVentas.jsp">Reporte de Ventas</a>
                                    </li>
                                </ul> 
                                </ul>    
                        <ul class="navbar-nav ms-3"> 
                            <li class="nav-item">
                                <a class="nav-link" href="../../Login.jsp?cerrar=true">Cerrar Sesión</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>     
        </div>
        <br>
        <br>
        <h2 align="center">Creación de pieza</h2>
        <table  border="4" width="600" align="center">
            <form   method="post" action="">
                <tr>
                <th rowspan="5"><img src="../../resources/Imagenes/crear.png" width="140" hight="140"/></th>
                <th>Nombre del usuario nuevo</th>
                <th><input type="text" name="Nombre"></input></th>
                </tr><tr>
                <th>Contraseña:</th>
                <th><input type="password" name="Contra"></input></th>
                </tr><tr>
                    <!--Codigo para combobox:--> 
                    <th><select name="IDC" onchange="CambiarDatos()">
                    <option name="Fab" value="1" >Area de fabrica</option>
                    <option name="Ven" value="2" >Area de Ventas</option>
                    <option name="Admin" value="3" >Area de Administracion</option>
                     </select></th> 
                <th><input type="submit" value="Crear Usuario" name="BtnCrear"> </th>
                </tr>   
            </form>   
        </table>
        <%
            if(request.getParameter("BtnCrear")!=null){
                Usuarios CU = new Usuarios();
                try{
                if(request.getParameter("Nombre")!=""&&request.getParameter("Contraseña")!=""){
                    String Nombre = request.getParameter("Nombre");
                    String contra = request.getParameter("Contra");
                    int Area = Integer.valueOf(request.getParameter("IDC"));
                    out.print("<script type='text/javascript'>alert('"+ CU.CrearUsuario(Nombre, contra, Area) +"')</script>");
                    }else{
                        out.print("<script type='text/javascript'>alert('Campos con datos invalidos, porfavor revisar')</script>");
                    }
                }catch(NumberFormatException | NullPointerException e){
                    out.print("<script type='text/javascript'>alert('Llene todos los campos con caracteres validos')</script>");
                }
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    </body>
</html>
