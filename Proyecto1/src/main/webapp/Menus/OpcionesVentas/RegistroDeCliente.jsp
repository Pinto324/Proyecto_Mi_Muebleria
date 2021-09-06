<%-- 
    Document   : RegistroDeCliente
    Created on : 6/09/2021, 02:28:44
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegistroDeVenta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body style="background-color:#CAFFC8;" >
        <jsp:useBean id="Cli" class="BaseDeDatos.Clientes" scope="page"></jsp:useBean> 
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
                    <a href="#" class="navbar-brand">Mi Muebleria</a>
                    <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#Navegacion">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div id="Navegacion" class="collapse navbar-collapse">
                    </div>
                </div>
            </nav>     
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
        
        
        <!--Menu de botoness-->       
    <h2 align="center">Registro de Cliente nuevo</h2>  
<br>
        <br>
        <table  border="4" width="600" align="center">
            <form   method="post" action="">
                <tr>
                <th rowspan="7"><img src="../../resources/Imagenes/crear.png" width="140" hight="140"/></th>
                <th>Nit de Cliente</th>
                <th><input type="text" name="Nit"></input></th>
                </tr><tr>
                <th>Nombre del cliente</th>
                <th><input type="text" name="Nombre"></input></th>
                </tr>
                <th>                 Campos Opcionales:</th>
                <tr>                    
                <th>Dirección:</th>
                <th><input type="text" name="dir"></input></th>
                </tr><tr>
                <th>Municipio:</th>
                <th><input type="text" name="Mun"></input></th>
                </tr><tr>
                <th>Departamento:</th>
                <th><input type="text" name="depa"></input></th>
                </tr><tr>
                <th><input type="submit" value="Subir Info" name="BtnCrear"> </th>
                </tr>
            </form>   
        </table>
        <%        
            if(request.getParameter("BtnCrear")!=null){
                if(request.getParameter("Nit")!=null&& !(request.getParameter("Nit").equals("")) &&request.getParameter("Nombre")!=null && !(request.getParameter("Nombre").equals(""))){
                    String[] datos = new String[5];
                    datos[0]=request.getParameter("Nit");
                    datos[1]=request.getParameter("Nombre");
                        if(request.getParameter("dir").equals("")){
                            datos[2]=null;
                        }else{
                            datos[2] = request.getParameter("dir");
                        }if(request.getParameter("Mun").equals("")){
                            datos[3]=null;
                        }else{
                            datos[3]=request.getParameter("Mun");
                        }
                        if(request.getParameter("depa").equals("")){
                            datos[4]=null;
                        }else{
                            datos[4] = request.getParameter("depa");
                        }    
                    Cli.CrearCliente(datos);
                    out.print("<script type='text/javascript'>alert('Se ingreso al cliente de manera satisfactoria')</script>");
                    out.print("<script>location.replace('RegistrarVenta.jsp');</script>");
                }else{
                    out.print("<script type='text/javascript'>alert('Llene los campos obligatorios con información valida')</script>");
                }     
            }
        %>
    </body>
</html>
