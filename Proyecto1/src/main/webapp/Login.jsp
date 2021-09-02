<%-- 
    Document   : IndexJSP
    Created on : 29/08/2021, 03:24:20
    Author     : branp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Set"%>
<%@page import="Usuarios.ValidadorDeLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Mi Mueblería</title>
            <!--Scripts:-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

        <link rel="stylesheet" type="text/css" href="resources/index.css" th:href="@{/resources/index.css}">
    </head>
    <body> 
                <div class="modal-dialog text-center">
                    <div class="col-sm-8 main-section">
                        <div class="modal-content">
                            <div class="col-12 user-img">
                                <img src="resources/Imagenes/avatar.png" th:src="@{img/avatar.png}"/>
                            </div>
                            <form class="col-12" th:action="@{/login}" method="get">
                                <div class="form-group" id="user-group">
                                    <input type="text" class="form-control" placeholder="Nombre de usuario" name="user" value=""/>
                                </div>
                                <div class="form-group" id="contrasena-group">
                                    <input type="password" class="form-control" placeholder="Contrasena" name="pass"/>
                                </div>
                                <button type="submit" class="btn btn-primary" name="Comprobar"><i class="fas fa-sign-in-alt"></i>  Ingresar </button>
                            </form>
                            
                            <div th:if="${param.error}" name="Alerta" class="alert alert-danger" role="alert" hidden>
                                Invalid username and password.
                            </div>
                            <div id="Creador">
                                <p> Hecho por: Brandon Pinto</p>
                            </div>
                        </div>
                    </div>
                </div>                                   
    </body>
    <% 
        if(request.getParameter("Comprobar")!=null){
            String CampoU = request.getParameter("user");
            String CampoP = request.getParameter("pass");
            out.print("Campo 1: "+CampoU);
            if(!(CampoU.equals(""))&&!(CampoP.equals(""))){
                String user = request.getParameter("user");
                String Contra = request.getParameter("pass");
                ValidadorDeLogin Inicio = new ValidadorDeLogin(user,Contra);
                int[] Us = Inicio.ComprobarUsuario();
                if(Us[0]==1){
                    switch(Us[1]){
                        case -1:
                            out.print("Contraseña incorrecta");
                            break;
                        case 1:
                            out.print("fabrica");
                            break;
                        case 2:
                            response.sendRedirect("Menus/Ventas.jsp");
                            break;
                        case 3:
                            out.print("financiacion xdxd");
                            break;
                        default:
                            break;
                    }
                }else if(Us[0]==0){
                    out.print("El usuario a sido inhabilitado, porfavor comuniquese con administración si existe un error");
                }else{
                    out.print("No se encontró un usuario en el sistema con ese nombre");
                    }
            }else{  
                out.print("llene los campos deseados mamon");
            }
        }
    %>
</html>
