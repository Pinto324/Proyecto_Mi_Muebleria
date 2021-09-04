<%-- 
    Document   : ModificarPieza
    Created on : 2/09/2021, 00:53:20
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar piezas</title>
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
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <jsp:useBean id="Pieza" class="Usuarios.ControladorPieza" scope="page"></jsp:useBean>   
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
                                            <a class="nav-link" href="PiezasInformacion.jsp">Consulta de Piezas</a>
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
                                        <a class="nav-link" href="ConsultarMueble.jsp">Información de muebles</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="CrearMueble.jsp">Ensamble de muebles</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="ValidarMueble.jsp">Validación de muebles</a>
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
      <br>
        <br>
        <h2 align="center">Modificación de pieza</h2>  
      <table  border="4" width="600" align="center">
            <form   method="post" action="#">
                <tr>
                <th rowspan="6"><img src="../../resources/Imagenes/modificar.png" width="140" hight="140"/></th>
                <th>Seleccione el id de la pieza que desea modificar</th>
                <th><select name="IDC" onchange="CambiarDatos()">
                    <!--Codigo para combobox:--> 
                    <option name="0">Seleccione una opcion</option> 
                    <%
                        while(Rs.next()){          
                    %>
                    <option name="XD"><%=Rs.getString("Id_Pieza")%></option> 
                    <%  
                        }
                    if((request.getParameter("BtnCargar")!=null)&&!(request.getParameter("IDC").equals("0"))){
                        if(!(request.getParameter("BtnCargar").equals(""))&&!(request.getParameter("IDC").equals("Seleccione una opcion"))){                       
                            String[] Datos = Pz.BuscarPorID(Integer.valueOf(request.getParameter("IDC")));
                    %>
                    <tr>
                    <th>Nombre de pieza</th>
                    <%if(request.getParameter("IDC")!=null){%>
                    <input type="text" name="Id" value="<%=Datos[0]%>" hidden/>
                    <%}%>
                    <th><input type="text" name="Nombre" value="<%=Datos[1]%>"></input></th>
                    </tr><tr>
                        <th>Costo</th>
                        <th><input type="number" name="Precio" value="<%=Double.parseDouble(Datos[2])%>" min="0" step=".01"></input></th>
                    </tr><tr>
                        <th>Existencias</th>
                        <th><input type="number" name="exis" value="<%=Integer.valueOf(Datos[3])%>" min="0"></input></th>
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
                    String ID = request.getParameter("Id");
                    String Nom = request.getParameter("Nombre");
                    String Pre = request.getParameter("Precio");
                    String Exis = request.getParameter("exis");                 
                            if(Pieza.VerificarModificacion(Nom, Pre, Exis)){    
                                if(Pieza.ModificarValor(ID,Nom, Pre, Exis)){
                                    out.print("<script type='text/javascript'>alert('se han modificado los datos con exito')</script>");
                                }else{
                                     out.print("<script type='text/javascript'>alert('A ocurrido un error de conexion, porfavor intente más tarde')</script>");
                                }
                            }else{
                            out.print("<script type='text/javascript'>alert('Datos con caracteres invalidos')</script>");
                            }                        
                        }
                    %> 
    </body>
</html>
