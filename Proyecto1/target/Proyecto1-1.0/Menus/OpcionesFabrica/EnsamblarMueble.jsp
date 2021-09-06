<%-- 
    Document   : ConsultarMueble
    Created on : 2/09/2021, 02:30:35
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dtd.models.CMLeaf"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar piezas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#F9EED2;" >
        <!--Logeo en la pagina-->
        <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
        <jsp:useBean id="CM" class="Controles.ControladorMuebles" scope="page"></jsp:useBean>
        <%
            HttpSession Sesion = request.getSession();
                if(Sesion.getAttribute("user")!=null&&Sesion.getAttribute("nivel")!=null){                    
                }else{
                    out.print("<script>location.replace('../../Login.jsp');</script>");
                }
                ResultSet Rs = cn.IniciarConexion().executeQuery("select * from muebles;");
                ResultSet MD = cn.IniciarConexion().executeQuery("select * from ensamble_muebles;");
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
                            <!--Barra de navegación de Muebles -->
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
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
      <table  border="4" width="600" align="center">
            <form   method="post" action="#">
            <p>
                <a>Seleccione el nombre del mueble a ensamblar</a>
            <p>  
                <input type="submit" value="Cargar Datos del mueble" name="BtnCargar" >
                <p> 
            <select name="IDC" align="center" onchange="CambiarDatos()">
                    <!--Codigo para combobox:--> 
                    <%
                        while(Rs.next()){  %>
                        <option name="XD"><%=Rs.getString("Nombre")%></option> 
                        <% } %>                       
                   </select>              
                   <% if((request.getParameter("BtnCargar")!=null)&&!(request.getParameter("IDC").equals("0"))){
                        if(CM.ListaDeMueblesEnsamblados(MD,request.getParameter("IDC"))){  
                           Rs = cn.IniciarConexion().executeQuery("select * from ensamble_muebles WHERE NombreDeMueble = '"+request.getParameter("IDC") + "' ;");
                           CM.setMuebleActual(request.getParameter("IDC"));
                        %>
 
    <!--Tabla de info-->         
    </table>
        <h1>Tabla piezas necesarias:</h1>  
            <div class="container mt-5">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tr class="success">
                <th>Nombre de pieza</th>
                <th>Piezas necesarias</th>
                <th>Costo total por pieza</th>
            </tr>
            <%
                Double Total = 0.0;        
                while(Rs.next()){          
                    %>
            <tr>
                <td><%=Rs.getString("NombreDePieza")%></td>
                <td><%=Rs.getString("CantidadPieza")%></td>
                <td><%= (Double.parseDouble(Rs.getString("CostoPieza"))*Double.parseDouble(Rs.getString("CantidadPieza"))) %></td>
            </tr>
            <%                  
                Total+= (Double.parseDouble(Rs.getString("CostoPieza"))*Double.parseDouble(Rs.getString("CantidadPieza")));
                }
                %>          
                <tr>
                <td><%="Costo total por mueble: "+Total+" Q"%></td>
                <td><a>Ingrese cantidad a ensamblar:</a><input type="number" value="1" name="CantArmar" min="1" style="width : 50px; heigth : 10px"></td>
                <td><input type="submit" value="Ensamblar mueble" name="BtnEnsamblar"  ></td>
            </tr>
                </table>      
              <%
                  }else{
                        out.print("<script type='text/javascript'>alert('El mueble elegido no cuenta con ensamble en este momento')</script>");
                        }
                    }else if((request.getParameter("BtnEnsamblar")!=null)){
                        Rs = cn.IniciarConexion().executeQuery("select * from ensamble_muebles WHERE NombreDeMueble = '"+CM.getMuebleActual() + "' ;");  
                        out.print("<script type='text/javascript'>alert('"+CM.CrearExistencia(Rs, CM.getMuebleActual(),Integer.valueOf(request.getParameter("CantArmar")))+"')</script>");
                        CM.setMuebleActual("");
                    }
                    cn.CerrarConexiones();;
                    Rs.close();
                %>               
                                   </form>   
                </table>                             
    </body>
</html>
