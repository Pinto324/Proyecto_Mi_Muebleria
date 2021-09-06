<%-- 
    Document   : CrearPieza
    Created on : 2/09/2021, 02:29:14
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="Usuarios.ControladorPieza"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear pieza</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#F9EED2;" >
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
                    <a href="../Fabrica.jsp" class="navbar-brand">Mi Muebleria</a>
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
                                            <a class="nav-link" href="CrearPieza.jsp">Crear Piezas</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="PiezasInformacion.jsp">Información de Piezas</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ModificarPieza.jsp">Modificar Piezas</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="EliminarPieza.jsp">Eliminar Piezas</a>
                                        </li>
                                    </ul>
                            </li>
                            <!--Barra de navegación de Muebles OWORANG-->
                            <li class="nav-item-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Manejo de muebles</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item">
                                        <a class="nav-link" href="InfoMueble.jsp">Informacion de Muebles</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="EnsamblarMueble.jsp">Ensamble de muebles</a>
                                    </li>
                                </ul>    
                            </li>
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
                <th>Nombre de pieza nueva</th>
                <th><input type="text" name="NombrePieza"></input></th>
                </tr><tr>
                <th>Costo por pieza</th>
                <th><input type="number" name="precio" min="0" value="0" step=".01"></input></th>
                </tr><tr>
                <th><input type="submit" value="Crear Pieza" name="BtnCrear"> </th>
                </tr>
            </form>   
        </table>
        <%
            ControladorPieza ControlPieza = new ControladorPieza();
            if(request.getParameter("BtnCrear")!=null){
                try{
                if(request.getParameter("NombrePieza")!=""&& !(Double.parseDouble(request.getParameter("precio"))<=0)){
                    String Nombre = request.getParameter("NombrePieza");
                    double Costo = Double.parseDouble(request.getParameter("precio"));
                    out.print("<script type='text/javascript'>alert('"+ ControlPieza.CrearPieza(Nombre, Costo, 0) +"')</script>");
                    }else{
                        out.print("<script type='text/javascript'>alert('parametros con datos invalidos, porfavor revisar')</script>");
                    }
                }catch(NumberFormatException e){
                    out.print("<script type='text/javascript'>alert('El precio solo puede tener numeros')</script>");
                }catch(NullPointerException Ex){
                    out.print("<script type='text/javascript'>alert('El precio solo puede tener numeros')</script>");
                }
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    </body>
</html>
