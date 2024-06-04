
<%@page import="com.emergentes.entidades.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%
    if(session.getAttribute("listaper") == null){
        ArrayList<Estudiante> lisaux = new ArrayList<Estudiante>();
        session.setAttribute("listaper", lisaux);
    }
    ArrayList<Estudiante> lista = (ArrayList<Estudiante>)session.getAttribute("listaper");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listado de registros</h1>
        <a href="MainServlet?op=nuevo">Nuevo registro</a>
        <table border = "1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Email</th>
                <th>Fecha Nacimiento</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if(lista != null){
                    for(Estudiante item : lista){

            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getApellidos()%></td>
                <td><%= item.getEmail()%></td>
                <td><%= item.getFechaNacimiento()%></td>
                <td>
                    <a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id<%= item.getId() %>"
                       onclick="return(confirm('Esta seguro de eliminar?'))">Eliminar</a>
                </td>
                
            </tr>
        </table>
    </body>
</html>