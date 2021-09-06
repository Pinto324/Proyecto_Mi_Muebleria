<%-- 
    Document   : VentaAlterna
    Created on : 5/09/2021, 23:39:13
    Author     : branp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
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
        <jsp:useBean id="cn" class="BaseDeDatos.Conexion" scope="page"></jsp:useBean>
        <jsp:useBean id="CR" class="Controles.ControladorRecibo" scope="page"></jsp:useBean> 
         <!--Información:-->
         <%
             ResultSet RsM = cn.IniciarConexion().executeQuery("select * from muebles where Existencias > 0;");
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
    <h2 align="center">Eleccion de mueble</h2>  
          <table  border="4" width="900" align="center">
            <form   method="post" action="#">               
                    <tr>
                    <th>Nombre de Mueble</th>
                    <th><select style="width : 200px;" name="NombreMueble" onchange="CambiarDatos()" <%if(request.getParameter("BtnEx")!=null){ %> hidden <% } %>>
                    <!--Codigo para combobox:--> 
                    <option name="0">Seleccione una opcion</option> 
                    <%
                        while(RsM.next()){          
                    %>
                    <option name="NM"><%=RsM.getString("Nombre")%></option>       
                    <% }%>
                    </select></th> 
                    </tr>                      
                    <%
                    if(request.getParameter("BtnEx")!=null){
                        ControladorRecibo.setNMueble(request.getParameter("NombreMueble"));
                        RsM = cn.IniciarConexion().executeQuery("select * from muebles where Nombre='"+request.getParameter("NombreMueble") +"';");  
                        int Cant = 1;
                        try{
                        RsM.next();
                        Cant = RsM.getInt(6);
                        }catch(SQLException e){}
                        
                     %>     
                    <tr> 
                    <th>Cantidad</th>
                    <th><select name="cantmueble" onchange="CambiarDatos()">
                    <!--Codigo para combobox:-->       
                    <%    for (int i = 1; i <= Cant; i++) { %>              
                    <option name="CM"><%=i%></option>       
                    <% }%>
                        <th><input type="submit" value="Realizar Venta" name="BtnVenta"> </th>
                        </select></th> 
                   <% }%>
                      
                    </tr>      
                    </select></th>   
                    <th><input type="submit" value="Cargar Existencias" name="BtnEx" <%if(request.getParameter("BtnEx")!=null){ %> hidden <% } %>> </th>
                    
                </tr>
            </form>   
        </table>  
        <%        
            if(request.getParameter("BtnVenta")!=null){
                if(request.getParameter("NombreMueble")!=""&&request.getParameter("cantmueble")!=""){
                    int Exis = Integer.valueOf(request.getParameter("cantmueble")); 
                        out.print("<script type='text/javascript'>alert('"+CR.CrearRecibo(ControladorRecibo.getNMueble(), ControladorRecibo.getNit(),Exis,Sesion.getAttribute("user").toString()) +"')</script>");
                        out.print("<script>location.replace('ConfirmacionVenta.jsp');</script>");
                }else{
                out.print("<script type='text/javascript'>alert('Ingrese campos validos')</script>");
                }
            }
        %>
    </body>
</html>
