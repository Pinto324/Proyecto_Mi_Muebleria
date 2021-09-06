<%-- 
    Document   : ConfirmacionVenta
    Created on : 5/09/2021, 23:21:26
    Author     : branp
--%>

<%@page import="Controles.ControladorRecibo"%>
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
         <%
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
    <h2 align="center">Registro de Venta</h2>  
      <table  border="4" width="200" align="center">
            <form   method="post" action="#">
                <tr>
                <th>Desea continuar comprando?</th>
                </tr><tr>
                <th><input type="submit" value="Si" name="BtnSi"style="width : 70px;"> </th>
                
                <th><input type="submit" value="No" name="BtnNo"style="width : 70px;"> </th>  
                </tr>
                
             </form>
      </table>
        <%        
            if(request.getParameter("BtnSi")!=null){
                out.print("<script>location.replace('VentaAlterna.jsp');</script>");
            }else if(request.getParameter("BtnNo")!=null){
                ControladorRecibo.setCodeRecibo("");
                ControladorRecibo.setNit("");
                ControladorRecibo.setPrecioTotal(0.0);
                ControladorRecibo.setNMueble("");
                out.print("<script type='text/javascript'>alert('Se finalizó la transaccion correctamente')</script>");
                out.print("<script>location.replace('../Ventas.jsp');</script>");
            }
        %>
    </body>
</html>
