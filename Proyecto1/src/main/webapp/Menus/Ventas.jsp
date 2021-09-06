<%-- 
    Document   : Ventas
    Created on : 1/09/2021, 17:11:24
    Author     : branp
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area De Ventas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#CAFFC8;" >
         <!--Información:-->
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <jsp:useBean id="Pz" class="BaseDeDatos.Piezas" scope="page"></jsp:useBean>           
         <%
           Date date = new Date(Calendar.getInstance().getTime().getTime());
           ResultSet Rs; 
           cn.IniciarConexion();
           String sql = "SELECT * FROM Facturas WHERE Fecha= ?;";
            Connection con = cn.getConexion();
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setDate(1,date);
            Rs = psmt.executeQuery();   
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

                            <li class="nav-item">
                                <a class="nav-link" href="OpcionesVentas/RegistrarVenta.jsp">Registro de venta</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Devoluciones</a>
                            </li>
                            <!--Barra de navegación de Muebles-->
                            <li class="nav-item-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Consultas</a>
                                <ul class="dropdown-menu">
                                  <li class="nav-item">
                                        <a class="nav-link" href="OpcionesVentas/ConsultaDeCompras.jsp">Consulta de compras</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="OpcionesVentas/ConsultaDeDevoluciones.jsp">Consulta de devoluciones</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="OpcionesVentas/ConsultaDeMuebles.jsp">Consulta de muebles</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="OpcionesVentas/ConsultaDeFacturas.jsp">Consulta de facturas</a>
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
       <h1>Resumenes:</h1>  
    <div class="container mt-5">
        <h1>Consulta de ventas del día:</h1>
        <div class="table-responsive">
        <table class="table table-striped">
            <tr class="success">
                <th>Nombre de Mueble</th>
                <th>Precio del producto</th>
                <th>Autor</th>
                <th>Fecha</th>
            </tr>
            <%
                        while(Rs.next()){          
                    %>
            <tr>
                <td><%=Rs.getString("NombreMueble")%></td>
                <td><%=Rs.getString("PrecioProducto")%></td>
                <td><%=Rs.getString("Autor")%></td>
                <td><%=Rs.getDate("Fecha")%></td>
            </tr>
            <%                  
                }
                cn.CerrarConexiones();;
                Rs.close();
                %>             
        </table>  

                     
    </body>
</html>
