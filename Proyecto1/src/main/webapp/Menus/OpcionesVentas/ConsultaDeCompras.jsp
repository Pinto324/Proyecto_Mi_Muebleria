<%-- 
    Document   : ConsultaDeCompras
    Created on : 6/09/2021, 03:35:59
    Author     : branp
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegistroDeVenta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#CAFFC8;" >
         <!--Información:-->
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <jsp:useBean id="Pz" class="BaseDeDatos.Piezas" scope="page"></jsp:useBean> 
         <jsp:useBean id="CR" class="Controles.ControladorRecibo" scope="page"></jsp:useBean> 
         <%
            ResultSet Rs = cn.IniciarConexion().executeQuery("select * from clientes;");
            ResultSet RsM = cn.IniciarConexion().executeQuery("select * from Facturas;");
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
                                <a class="nav-link" href="/RegistrarVenta.jsp">Registro de venta</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Devoluciones</a>
                            </li>
                            <!--Barra de navegación de Muebles-->
                            <li class="nav-item-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Consultas</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item">
                                        <a class="nav-link" href="ConsultaDeCompras.jsp">Consulta de compras</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="ConsultaDeDevoluciones.jsp">Consulta de devoluciones</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="ConsultaDeMuebles.jsp">Consulta de muebles</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="ConsultaDeFacturas.jsp">Consulta de facturas</a>
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
            <p>
                <a>Seleccione el cliente a consultar</a>
            <p>
            <p><label N="F">Fecha de inicio:</label>
            <a><input Name="Fi" id="Fi" type="date"></a>
            <p><label for="FF">Fecha de Final:</label>
            <a><input Name="FF" Name="FF" type="date"></a>
            <p>  
                <input type="submit" value="Cargar Datos del cliente" name="BtnCargar" >
                <p> 
            <select name="IDC" align="center" onchange="CambiarDatos()">
                    <!--Codigo para combobox:--> 
                    <%
                        while(Rs.next()){  %>
                        <option name="XD" value="<%=Rs.getString("Nit")%>"><%=Rs.getString("Nombre")%></option> 
                        <% } %>                       
                   </select>              
                   <% if(request.getParameter("BtnCargar")!=null){
                       ResultSet Tabla = null;
                         if(request.getParameter("Fi").equals("") || request.getParameter("FF").equals("")){
                             Tabla = cn.IniciarConexion().executeQuery("SELECT * FROM Facturas WHERE NitComprador ='"+ request.getParameter("IDC") +"';");
                             }else if(Date.valueOf(request.getParameter("Fi")).before(Date.valueOf(request.getParameter("FF")))){
                                String sql = "SELECT * FROM Facturas WHERE Fecha BETWEEN ? AND ? AND NitComprador = ?";
                                Connection con = cn.getConexion();
                                PreparedStatement psmt = con.prepareStatement(sql);
                                psmt.setDate(1,Date.valueOf(request.getParameter("Fi")));
                                psmt.setDate(2,Date.valueOf(request.getParameter("FF")));
                                psmt.setString(3, request.getParameter("IDC"));
                                Tabla = psmt.executeQuery();
                             }else{
                                    Tabla = cn.IniciarConexion().executeQuery("SELECT * FROM Facturas WHERE NitComprador ='"+ request.getParameter("IDC") +"';");
                                    out.print("<script type='text/javascript'>alert('Fechas puestas no validas')</script>");
                                    out.print("<script>location.replace('ConsultaDeCompras.jsp');</script>");
                                }
                        %>
 
     <!--Tabla de info-->  
     </form>
   </table>
   <h1>Tabla de elementos:</h1>  
    <div class="container mt-5">
        <div class="table-responsive">
        <table class="table table-striped">
            <tr class="success">
                <th>Mueble comprado:</th>
                <th>Precio del mueble:</th>
                <th>Fecha de la compra:</th>
            </tr>
            <%
                        while(Tabla.next()){          
                    %>
            <tr>
                <td><%=Tabla.getString("NombreMueble")%></td>
                <td><%=Tabla.getString("PrecioProducto")%></td>
                <td><%=Tabla.getDate("Fecha")%></td>
            </tr>          
              <%
                  }%>
                    </table> 
               <% cn.CerrarConexiones();;
                Tabla.close();
                Rs.close();
                RsM.close();      
                  } 
                %>               
                              
              </form>   
        </table>                             
    </body>
</html>
