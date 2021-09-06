<%-- 
    Document   : CreacionMuebles
    Created on : 5/09/2021, 04:58:14
    Author     : branp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#F9EED2;">
        <!--Logeo en la pagina-->
        <%
            HttpSession Sesion = request.getSession();
                if(Sesion.getAttribute("user")!=null&&Sesion.getAttribute("nivel")!=null){                    
                }else{
                    out.print("<script>location.replace('../../Login.jsp');</script>");
                }
         %>
         <!--Fin Logeo en la pagina-->
         <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
         <jsp:useBean id="Mueble" class="Controles.ControladorMuebles" scope="page"></jsp:useBean>
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
                                        <a class="nav-link" href="CrearMueble.jsp">Creación de muebles</a>
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
     <!--Fin de navegación-->
        <br>
        <br>
        <!--Logica de crear Mueble-->
        <% if(request.getParameter("BtnCrear")!=null){
            String[] datos = new String[6];
            datos[0] = request.getParameter("NombreMueble");
            datos[3] = request.getParameter("Precio");
            ValidadorDeLogin Usuario = new ValidadorDeLogin();
            datos[1] = Usuario.getNombreUsuario();
            datos[2] = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
            datos[4] = "0";
            datos[5] = "0";
            out.print("<script type='text/javascript'>alert"+Mueble.CrearPieza(datos)+"</script>");  
                for (int i = 0; i < Mueble.getPiezasTotal(); i++) {  
                    String[] D=new String[2]; 
                    D[0]=datos[0];
                    D[1]=request.getParameter("Opcion"+i);
                    int Cant = Integer.valueOf(request.getParameter(String.valueOf(i)));
                    Mueble.CrearEnsamble(D, Cant);
                } 
            }        
         %> 
         <!--Formulario de datos-->
        <h2 align="center">Creación de pieza</h2>
               <!--Ingreso de num-->

        <table  border="4" width="600" align="center">
            <form   method="post" action="#">
                <tr>
                <th rowspan="5"><img src="../../resources/Imagenes/crear.png" width="140" hight="140"/></th>
                <th>Numero de piezas distintas</th>
                <th><input type="number" name="No" min="1"  ></input></th>  
                <th><input type="submit" value="Subir Numero" name="BtnSubir"> </th>
                </tr><tr>
                <% if(request.getParameter("BtnSubir")!=null && !(request.getParameter("No").equals(""))&&(request.getParameter("No")!=null)){
                    Mueble.setPiezasTotal(Integer.valueOf(request.getParameter("No")));
                %>
                    
                        <input type="text" name="Numero" value="<%=request.getParameter("No")%>" hidden/>
                 <%}%>
                <% try{
               if(request.getParameter("BtnSubir")!=null&& Integer.valueOf(request.getParameter("No")) > 0){ %>
                                       <p>
                <th>Nombre del muebe</th>
                <th><input type="text" name="NombreMueble"></input></th>
                </tr>
                </tr><tr>
                    <p>
                <th>Precio de venta</th>
                <th><input type="number" name="Precio" min="0" value="0" step=".01"></input></th> 
            </form>   
        </table>             
                   <%
                       for (int i = 0; i < Integer.valueOf(request.getParameter("No")); i++) {                         
                    Rs = cn.IniciarConexion().executeQuery("select * from Piezas;");    
                    %>
                    <p>    
                    <table  border="4" width="800" align="center">
                        <tr>
                        <th>Pieza usada para el mueble</th>
                        <th><select name="IDC">
                        <%while(Rs.next()){ %>
                            <option name="Opcion<%=i%>" value="<%=Rs.getString("Id_Pieza")%>"><%=Rs.getString("Nombre_Pieza")+" "+Rs.getString("Costo")+"Q"%></option> 
                           <% } %> 
                        </select></th>
                        <p>
                        <th>Cantidad requerida</th>
                        <th><input type="number" name="<%=i%>"  min="1"></input></th></tr>
                    </table>
                        <p>
                        <% }%>
                        <form   method="post" action="">
                            <div align="center">
                                <p><input type="submit" value="Crear Mueble" name="BtnCrear"> 
                            </div>
                        </form>
                        <%}%> 
                    <% }catch(NumberFormatException e){
                        out.print("<script type='text/javascript'>alert('Ingrese un valor valido')</script>");
                        } %>

    </body>
</html>
