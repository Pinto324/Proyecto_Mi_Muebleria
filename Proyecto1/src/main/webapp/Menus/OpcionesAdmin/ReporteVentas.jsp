<%-- 
    Document   : ReporteVentas
    Created on : 5/09/2021, 17:57:40
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegistroDeVenta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#EAF2F8;" >
         <!--Información:-->
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <%
            ResultSet RsM = null;
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    
             <!--Buscadores por fecha--> 
        <table  border="4" width="600" align="center">
            <form   method="post" action="#">
            <p>
                <a>Seleccione el tiempo para la consulta</a>
            <p>
            <p><label N="F">Fecha de inicio:</label>
            <a><input Name="Fi" id="Fi" type="date"></a>
            <p><label for="FF">Fecha de Final:</label>
            <a><input Name="FF" Name="FF" type="date"></a>
            <p>  
                <input type="submit" value="Cargar Datos entre fechas" name="BtnCargar" >
                <p> 
        
                   <% if(request.getParameter("BtnCargar")!=null){
                       ResultSet Tabla = null;
                       cn.IniciarConexion();
                         if(request.getParameter("Fi").equals("") || request.getParameter("FF").equals("")){
                             Tabla = cn.IniciarConexion().executeQuery("SELECT * FROM Facturas;");
                             }else if(Date.valueOf(request.getParameter("Fi")).before(Date.valueOf(request.getParameter("FF")))){
                              
                                String sql = "SELECT * FROM Facturas WHERE Fecha BETWEEN ? AND ? ";
                                Connection con = cn.getConexion();
                                PreparedStatement psmt = con.prepareStatement(sql);
                                psmt.setDate(1,Date.valueOf(request.getParameter("Fi")));
                                psmt.setDate(2,Date.valueOf(request.getParameter("FF")));
                                Tabla = psmt.executeQuery();
                             }else{
                                    Tabla = cn.IniciarConexion().executeQuery("SELECT * FROM Facturas;");
                                    out.print("<script type='text/javascript'>alert('Fechas puestas no validas')</script>");
                                    out.print("<script>location.replace('ReporteVentas.jsp');</script>");
                                }
                        %> 
     </form>
   </table>
        
        <table  border="4" width="600" align="center">
            <form   method="post" action="#">
                 <h1>Ventas realizadas:</h1>  
                     <div class="container mt-5">
                        <div class="table-responsive">
                        <table class="table table-striped">
                            <tr class="success">
                                <th>Articulo vendido:</th>
                                <th>Precio del producto:</th>
                                <th>Fecha de venta</th>
                                <th>Vendedor</th>
                            </tr>
            <%
                        while(Tabla.next()){          
                    %>
            <tr>
                <td><%=Tabla.getString("NombreMueble")%></td>
                <td><%=Tabla.getDouble("PrecioProducto")%></td>
                <td><%=Tabla.getDate("Fecha")%></td>
                <td><%=Tabla.getString("Autor")%></td>
            </tr>          
              <%
                  }%>
                    <</form>   
        </table>   
               <% cn.CerrarConexiones();;
                Tabla.close();      
                   }
                %>                               
                                        
    </body>
</html>
