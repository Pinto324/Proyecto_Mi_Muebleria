<%-- 
    Document   : RegistrarVenta
    Created on : 5/09/2021, 20:52:04
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="Controles.ControladorRecibo"%>
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
         <jsp:useBean id="Pz" class="BaseDeDatos.Piezas" scope="page"></jsp:useBean> 
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
        
        
        <!--Menu de ingreso de datos-->       
    <h2 align="center">Registro de Venta</h2>  
      <table  border="4" width="900" align="center">
            <form   method="post" action="#">
                <p>
                <tr>
                <th rowspan="6"><img src="../../resources/Imagenes/crear.png" width="140" hight="140"/></th>
                <th>Ingresar cliente al sistema:</th>
                <th><input type="submit" value="Ingresar cliente Nuevo" name="BtnCrearUs"> </th>
                <p>
                <tr>
                        <th>Codigo de factura (5 caracteres):</th>
                    <th><input type="text" name="CodF" style="width : 60px;"></input></th>
                    </tr>
                    <p>
                    <tr>
                     <p>
                <th>Seleccione el nit del cliente:</th>
                <th><select <%if(request.getParameter("BtnCargar")!=null){ %> hidden <% } %> name="IDC" onchange="CambiarDatos()">
                    <!--Codigo para combobox:--> 
                    <option name="0">Seleccione una opcion</option> 
                    <%
                        while(Rs.next()){          
                    %>
                    <option name="Nits"><%=Rs.getString("Nit")%></option> 
                    <%  
                        }
                    %>
                    </select></th>         
                <tr>
                    <th><input href="RegistrarVenta.jsp" type="submit" value="recargar pagina" name="BtnRecargar" > </th>
                    <th><input type="submit" value="Ir al menu de compra" name="BtnCargar" > </th>
                </tr>
            </form>   
        </table> 
        <%                          
            if(request.getParameter("BtnCargar")!=null){
                        if(!(request.getParameter("IDC").equals("Seleccione una opcion"))){ 
                            if(CR.Existencia(request.getParameter("CodF"))){
                                if(request.getParameter("CodF").length() <= 5){
                                    CR.setCodeRecibo(request.getParameter("CodF"));
                                    CR.setNit(request.getParameter("IDC"));
                                    out.print("<script>location.replace('VentaAlterna.jsp');</script>");
                                }else{
                                 out.print("<script type='text/javascript'>alert('El codigo traspasa los 5 caracteres permitidos')</script>");
                                }
                            }else{
                                out.print("<script type='text/javascript'>alert('El codigo seleccionado ya está en uso')</script>");
                            }
                        }else{
                            out.print("<script type='text/javascript'>alert('Seleccione un cliente valido')</script>");
                        }
            }else if(request.getParameter("BtnCrearUs")!=null){
                out.print("<script>location.replace('RegistroDeCliente.jsp');</script>");
            }
        %>
    </body>
</html>
