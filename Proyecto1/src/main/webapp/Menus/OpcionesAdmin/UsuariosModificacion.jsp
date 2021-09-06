<%-- 
    Document   : UsuariosModificacion
    Created on : 5/09/2021, 17:56:16
    Author     : branp
--%>

<%@page import="BaseDeDatos.Usuarios"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#EAF2F8;" >
        <!--Logeo en la pagina-->
        <%
            HttpSession Sesion = request.getSession();
                if(Sesion.getAttribute("user")!=null&&Sesion.getAttribute("nivel")!=null){                    
                }else{
                    out.print("<script>location.replace('../../Login.jsp');</script>");
                }
         %>
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <jsp:useBean id="Us" class="BaseDeDatos.Usuarios" scope="page"></jsp:useBean>
                    <%
                        ResultSet Rs = cn.IniciarConexion().executeQuery("select * from Usuarios;");
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
        <br>
        <br>
        <h2 align="center">Modificación de Usuarios</h2>  
      <table  border="4" width="600" align="center">
            <form   method="post" action="#">
                <tr>
                <th rowspan="6"><img src="../../resources/Imagenes/modificar.png" width="140" hight="140"/></th>
                <th>Seleccione el Nombre de usuario que desea modificar</th>
                <th><select name="IDC" onchange="CambiarDatos()">
                    <!--Codigo para combobox:--> 
                    <option name="0">Seleccione una opcion</option> 
                    <%
                        while(Rs.next()){          
                    %>
                    <option name="XD"><%=Rs.getString("Nick")%></option> 
                    <%  
                        }
                    if((request.getParameter("BtnCargar")!=null)&&!(request.getParameter("IDC").equals("0"))){
                        if(!(request.getParameter("BtnCargar").equals(""))&&!(request.getParameter("IDC").equals("Seleccione una opcion"))){                       
                            String[] Datos = Us.BuscarPorNombre(request.getParameter("IDC"));
                    %>
                    <tr>
                    <%if(request.getParameter("IDC")!=null){%>
                    <input type="text" name="Nombre" value="<%=Datos[0]%>" hidden/>
                    <%}%>
                    <th>Contraseña:</th>
                    <th><input type="password" name="contra" value="<%=Datos[1]%>"></input></th>
                    </tr><tr>
                    <th>Seleccion de area:</th>    
                    <th><select name="Area" onchange="CambiarDatos()">
                    <option name="Fab" value="1" >Area de fabrica</option>
                    <option name="Ven" value="2" >Area de Ventas</option>
                    <option name="Admin" value="3" >Area de Administracion</option>
                     </select></th> 
                     </tr><tr>
                         <th>Usuario habilitado</th>
                    <th><select name="Activa" onchange="CambiarDatos()">
                    <option name="act" value="1" >activo</option>
                    <option name="inact" value="0" >inactivo</option>
                     </select></th> 
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
                    <th><input type="submit" value="Modificar Pieza" name="BtnModificar"> </th>
                </tr>
            </form>   
        </table>         
                               <%
                if(request.getParameter("BtnModificar")!=null){
                    try{
                        String Nom = request.getParameter("Nombre");
                        String contra = request.getParameter("contra");
                        int area = Integer.valueOf(request.getParameter("Area"));
                        int act = Integer.valueOf(request.getParameter("Activa"));                  
                            if(!(Nom.equals(""))&&!(contra.equals(""))){
                                boolean Ac;
                                if(act == 1){
                                    Ac = true;
                                }else{
                                    Ac = false;
                                }                         
                                if(Us.ModificarDatos(Nom, contra, area, Ac)){
                                    out.print("<script type='text/javascript'>alert('se han modificado los datos con exito')</script>");
                                }else{
                                     out.print("<script type='text/javascript'>alert('A ocurrido un error de conexion, porfavor intente más tarde')</script>");
                                }
                            }else{
                            out.print("<script type='text/javascript'>alert('Datos con caracteres invalidos')</script>");
                            }      
                            }catch(NumberFormatException|NullPointerException e){
                              out.print("<script type='text/javascript'>alert('Datos con caracteres invalidos')</script>");  
                        }   
                    }
                    %> 
    </body>
</html>
