<%-- 
    Document   : Administracion
    Created on : 5/09/2021, 17:41:40
    Author     : branp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area De Administracion</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#EAF2F8;" >
         <!--Información:-->
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <jsp:useBean id="Pz" class="BaseDeDatos.Piezas" scope="page"></jsp:useBean>           
         <%
            int IdU = (Pz.BuscarPiezaReciente()-5);
            ResultSet Rs = cn.IniciarConexion().executeQuery("select * from Piezas where Id_Pieza >"+IdU+";");
            ResultSet ago = cn.IniciarConexion().executeQuery("select * from Piezas where existencias < 5");
         %>        
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
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Manejo de Usuarios</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item">
                                            <a class="nav-link" href="OpcionesAdmin/UsuariosCreacion.jsp">Crear Usuarios</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="OpcionesAdmin/UsuariosModificacion.jsp">Modificar Usuarios</a>
                                        </li>
                                    </ul>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" href="OpcionesAdmin/CreacionMuebles.jsp">Creacion de muebles</a>
                            </li>
                            <!--Barra de navegación de Muebles-->
                            <li class="nav-item-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Reportes</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item">
                                        <a class="nav-link" href="OpcionesAdmin/ReporteDevoluciones.jsp">Reporte de devoluciones</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="OpcionesAdmin/ReporteGeancia.jsp">Reporte de ganancias</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="OpcionesAdmin/ReporteMueble.jsp">Reportes de muebles</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="OpcionesAdmin/ReporteUsuarios.jsp">Reporte de los usuarios</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="OpcionesAdmin/ReporteVentas.jsp">Reporte de Ventas</a>
                                    </li>
                                </ul> 
                                </ul>    
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<!--Tabla de info--> 
        <p>
       <h1>Resumen:</h1> 
            <%                  
            
                Rs = cn.IniciarConexion().executeQuery("SELECT * FROM Muebles ORDER BY DATE_FORMAT(FechaEnsamble, '%Y%m%d') desc;");
                %>          
        <!--Tabla de info--> 
        <p> 
    <div class="container mt-5">
        <h1>Tabla de los ultimos muebles creados:</h1>
        <div class="table-responsive">
        <table class="table table-striped">
            <tr class="success">
                <th>Nombre de mueble</th>
                <th>Creador</th>
                <th>Fecha Ensamble</th>
                <th>Precio</th>
                <th>Existencias</th>
            </tr>
            <%
                        while(Rs.next()){          
                    %>
            <tr>
                <td><%=Rs.getString("Nombre")%></td>
                <td><%=Rs.getString("Creador")%></td>
                <td><%=Rs.getString("FechaEnsamble")%></td>
                <td><%=Rs.getString("Precio")%></td>
                <td><%=Rs.getString("Existencias")%></td>
            </tr>
            <%                  
                }
                cn.CerrarConexiones();;
                Rs.close();
                %>          
        </table>  
    </body>
</html>
