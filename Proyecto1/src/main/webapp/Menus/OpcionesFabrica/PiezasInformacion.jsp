<%-- 
    Document   : PiezasInformacion
    Created on : 2/09/2021, 15:34:21
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informacion de piezas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
         <!--Información:-->
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <jsp:useBean id="Pz" class="BaseDeDatos.Piezas" scope="page"></jsp:useBean>           
                    <%
                        ResultSet Rs = cn.IniciarConexion().executeQuery("select * from Piezas where existencias > 4;");
                        ResultSet ago = cn.IniciarConexion().executeQuery("select * from Piezas where existencias < 5");
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
  <!--Logica de ordenamiento-->      
        <%
            if((request.getParameter("OrdenarAscendente")!=null)){
               Rs = cn.IniciarConexion().executeQuery("select * from Piezas order by existencias;");
               ago = cn.IniciarConexion().executeQuery("select * from Piezas where existencias = -1");
            }else if(request.getParameter("OrdenarDescendente")!=null){
                 Rs = cn.IniciarConexion().executeQuery("select * from Piezas order by existencias desc;");
                 ago = cn.IniciarConexion().executeQuery("select * from Piezas where existencias = -1");
            }
                    %>  
 <!--Ordenar Tabla de info-->
<form   method="post" action="#">
     <p> 
          <p> 
    <a>Ordenar según existencias:</a>  
    <input type="submit" value="Ordenar de mayor a menor" name="OrdenarDescendente"> 
    <input type="submit" value="Ordenar de menor a mayor" name="OrdenarAscendente"> 
    <input type="submit" value="Recargar tabla" name="Agotar"> 
  </form>
  <!--Tabla de info agotados-->
    <p> 
  <div class="container mt-5">
    <h1>Tabla de elementos agotados/apunto de agotarse:</h1>  
        <div class="table-responsive">
            <table class="table table-striped">
            <tr class="danger">
                <th>Id de pieza</th>
                <th>Nombre</th>
                <th>Precio unitario</th>
                <th>Existencias</th>
            </tr>
            <%
                        while(ago.next()){          
                    %>
            <tr>
                <td><%=ago.getString("Id_Pieza")%></td>
                <td><%=ago.getString("Nombre_Pieza")%></td>
                <td><%=ago.getString("Costo")%></td>
                <td><%=ago.getString("existencias")%></td>
            </tr>
            <%                  
                }
                ago.close();
                %>              
   <!--Tabla de info-->         
   </table>
   <h1>Tabla de elementos:</h1>  
    <div class="container mt-5">
        <div class="table-responsive">
        <table class="table table-striped">
            <tr class="success">
                <th>Id de pieza</th>
                <th>Nombre</th>
                <th>Precio unitario</th>
                <th>Existencias</th>
            </tr>
            <%
                        while(Rs.next()){          
                    %>
            <tr>
                <td><%=Rs.getString("Id_Pieza")%></td>
                <td><%=Rs.getString("Nombre_Pieza")%></td>
                <td><%=Rs.getString("Costo")%></td>
                <td><%=Rs.getString("existencias")%></td>
            </tr>
            <%                  
                }
                cn.CerrarConexiones();;
                Rs.close();
                %>          
        </table>      
    </body>
</html>
