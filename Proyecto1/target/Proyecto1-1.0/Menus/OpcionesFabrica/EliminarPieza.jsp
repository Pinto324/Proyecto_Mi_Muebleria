<%-- 
    Document   : EliminarPieza
    Created on : 2/09/2021, 02:28:49
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar pieza</title>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> 
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <jsp:useBean id="Pz" class="BaseDeDatos.Piezas" scope="page"></jsp:useBean>           
                    <%
                        ResultSet Rs = cn.IniciarConexion().executeQuery("select * from Piezas;");
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
        <h2 align="center">Eliminación de pieza</h2>
        <table  border="4" width="600" align="center">
            <form   method="post" action="#">
                
                <tr>
                <th rowspan="5"><img src="../../resources/Imagenes/eliminar.png" width="140" hight="140"/></th>
                <th>Seleccione el id de la pieza que desea eliminar</th>
                <th><select name="IDC" onchange="CambiarDatos()">
                    <option value="0">Elige una opción</option>
                    <!--Codigo para combobox:--> 
                    <%
                        while(Rs.next()){          
                    %>
                    <option name="XD"><%=Rs.getString("Id_Pieza")%></option> 
                    <%  
                        }
                    if((request.getParameter("BtnCargar")!=null)&&!(request.getParameter("IDC").equals("0"))){
                        if(!(request.getParameter("BtnCargar").equals(""))&&!(request.getParameter("IDC").equals("Elige una opción"))){
                        String[] Datos = Pz.BuscarPorID(Integer.valueOf(request.getParameter("IDC")));
                    %>                   
                    <tr>
                    <th>Nombre de pieza</th>
                    <%if(request.getParameter("IDC")!=null){%>
                        <input type="text" name="Id" value="<%=Datos[0]%>" hidden/>
                    <%}%>
                    <th><input type="text" name="Nombre" value="<%=Datos[1]%>" disabled></input></th>
                    </tr><tr>
                        <th>Costo</th>
                        <th><input type="text" name="Precio" value="<%=Datos[2]%>" disabled></input></th>
                    </tr>
                    <%
                        }else{
                            out.print("<script type='text/javascript'>alert('Seleccione un id valido')</script>");
                        }
                    }
                    %>
                    </select></th>         
                    <tr>
                    <th><input type="submit" value="Cargar Datos del id" name="BtnCargar" > </th>
                </tr><tr>
                    <th><input type="submit" value="Eliminar Pieza" name="BtnEliminar"> </th>
                </tr>
            </form>   
        </table>
         <%
            if((request.getParameter("BtnEliminar")!=null)){
                if(Pz.EliminarPorID(Integer.valueOf(request.getParameter("Id")))){
                out.print("<script type='text/javascript'>alert('Se a borrado la pieza con exito')</script>");                        
                }else{out.print("<script type='text/javascript'>alert('a ocurrido un error, intente más tarde')</script>");  }  
            }
                    %>           
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <!--Codigo de java:-->    
    
    </body>
</html>
