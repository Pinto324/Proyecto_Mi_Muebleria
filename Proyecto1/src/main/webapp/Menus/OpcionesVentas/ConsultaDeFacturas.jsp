<%-- 
    Document   : ConsultaDeFactores
    Created on : 6/09/2021, 03:37:12
    Author     : branp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="BaseDeDatos.Clientes"%>
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
         <jsp:useBean id="CR" class="Controles.ControladorRecibo" scope="page"></jsp:useBean> 
         <%
            ResultSet Rs = cn.IniciarConexion().executeQuery("select * from clientes;");
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
                                <a class="nav-link" href="RegistrarVenta.jsp">Registro de venta</a>
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
        
        
        <!--Menu de seleccions-->       
    <h2 align="center">Factura por selección:</h2>  
      <table  border="4" width="900" align="center">
            <form   method="post" action="#">
                <p>
                <tr>
                <th rowspan="6"><img src="../../resources/Imagenes/Modificar.png" width="140" hight="140"/></th>
                <p>
                    <tr>
                     <p>
                <th>Seleccione el cliente para conocer sus facturas:</th>
                <th><select <%if(request.getParameter("BtnCargar")!=null){ %> hidden <% } %> name="IDC" onchange="CambiarDatos()">
                    <!--Codigo para combobox:--> 
                    <option name="0">Seleccione una opcion</option> 
                    <%
                        Clientes CN = new Clientes();
                        while(Rs.next()){          
                    %>
                    <option name="Nits" value="<%=Rs.getString("Nit")%>"><%=CN.NombrePorNit(Rs.getString("Nit"))%>  <%=Rs.getString("Nit")%></option> 
                    <%  
                        }
                    %>
                    </select></th>         
                <tr>
                    <th><input href="ConsultaDeFacturas.jsp" type="submit" value="recargar pagina" name="BtnRecargar" > </th>
                    <th><input type="submit" value="Abrir Menu de facturas" name="BtnCargar" > </th>
                </tr>
            </form>   
        </table> 
        <%                          
            if(request.getParameter("BtnCargar")!=null){
                        if(!(request.getParameter("IDC").equals("Seleccione una opcion"))){ 
                        String Nit = request.getParameter("IDC");
                        ArrayList<String> Datos = CR.CodigosPorNit(cn);
                           %>
            <th><select <%if(request.getParameter("BtnFac")!=null){ %> hidden <% } %> name="fac" onchange="CambiarDatos()">
            <!--Codigo para combobox:--> 
         <option name="0">Seleccione una opcion</option> 
                    <%
                        for (int i = 0; i < Datos.size() ; i++) {          
                    %>
                    <option name="Nits" value="<%=Rs.getString("Nit")%>"><%=Datos.get(i)%></option> 
                    <%  
                        }
                    %>
                </select></th>    
                <th><input type="submit" value="Abrir tabla de la factura" <%if(request.getParameter("BtnFac")!=null){ %> hidden <% } %> name="BtnFac" > </th>
                           
            <%  
                        }else{
                            out.print("<script type='text/javascript'>alert('Seleccione un cliente valido')</script>");
                        }
            }if(request.getParameter("BtnFac")!=null){
            Rs = cn.IniciarConexion().executeQuery("select * from facturas WHERE CodigoFactura="+ request.getParameter("fac")+";");
            %>
        <table  border="4" width="600" align="center">
            <form   method="post" action="#">
                 <h1>Información de la factura:</h1>  
                     <div class="container mt-5">
                        <div class="table-responsive">
                        <table class="table table-striped">
                            <tr class="success">
                                <th>Muebles vendidos:</th>
                                <th>Precio por mueble:</th>
                            </tr>
            <%
                        while(Rs.next()){          
                    %>
            <tr>
                <td><%=Rs.getString("NombreMueble")%></td>
                <td><%=Rs.getString("PrecioProducto")%></td>
            </tr>          
              <%
                  }%>
                    </table> 
               <% cn.CerrarConexiones();;
                Rs.close();      
                %>               
                              
              </form>   
        </table>                
      <%      }
        %>
    </body>
</html>
