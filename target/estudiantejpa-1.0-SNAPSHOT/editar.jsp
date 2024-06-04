<%@page import="com.emergentes.entidades.Estudiante"%>
<%
    Estudiante reg= (Estudiante) request.getAttribute("miobjper"); 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>Resgistro de persona</h1>
<form action="MainController" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="id" value="<%= reg.getId()%>" size="2" readonly></td>
        </tr>
        <tr>
            <td>Nombres</td>
            <td><input type="text" name="nombre" value="<%= reg != null ? reg.getNombre() : "" %>"></td>
        </tr>
        <tr>
            <td>Apellidos</td>
            <td><input type="text" name="apellidos" value="<%= reg != null ? reg.getApellidos() : "" %>"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" value="<%= reg != null ? reg.getEmail() : "" %>"></td>
        </tr>
        <tr>
            <td>Fecha Nacimiento</td>
            <td><input type="date" name="fechanac" value="<%= reg != null ? reg.getFechaNacimiento() : "" %>"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="enviar"></td>
        </tr>
    </table>
</form>
</body>
</html>
