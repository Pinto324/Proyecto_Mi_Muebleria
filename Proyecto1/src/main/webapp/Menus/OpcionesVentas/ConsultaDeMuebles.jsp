<%-- 
    Document   : ConsultaDeMuebles
    Created on : 6/09/2021, 03:37:00
    Author     : branp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegistroDeVenta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#CAFFC8;" >
         <!--Información:-->
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <%
            ResultSet RsM = cn.IniciarConexion().executeQuery("select * from Muebles WHERE Existencias > 0;");
         %>        
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
                    <a href="../Ventas.jsp" class="navbar-brand">Mi Muebleria</a>
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
    
        <table  border="4" width="600" align="center">
            <form   method="post" action="#">
                 <h1>Muebles disponibles para vender:</h1>  
                     <div class="container mt-5">
                        <div class="table-responsive">
                        <table class="table table-striped">
                            <tr class="success">
                                <th>Nombre del mueble</th>
                                <th>Precio del mueble:</th>
                                <th>Fecha que fue ensamblado:</th>
                                <th>Creador:</th>
                                <th>Existencias:</th>
                            </tr>
            <%
                        while(RsM.next()){          
                    %>
            <tr>
                <td><%=RsM.getString("Nombre")%></td>
                <td><%=RsM.getString("Precio")%></td>
                <td><%=RsM.getDate("FechaEnsamble")%></td>
                <td><%=RsM.getString("Creador")%></td>
                <td><%=RsM.getInt("Existencias")%></td>
            </tr>          
              <%
                  }%>
                    </table> 
               <% cn.CerrarConexiones();;
                RsM.close();      
                %>               
                              
              </form>   
        </table>                             
    </body>
</html>
