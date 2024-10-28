<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWebGB.beans.Autor"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String url = "http://localhost:8080/proyectoWebGB/";
	%>
	<a type="button" href="<%=url%>AutoresController?op=nuevo">Nuevo
		autor</a>

	<table border="1">
		<thead>

			<th>Cod Autor</th>
			<th>Nombre Autor</th>
			<th>Nacionalidad</th>
			<th>Operaciones</th>

		</thead>

		<tbody>
			<%
			List<Autor> listaAutores = (List<Autor>) request.getAttribute("listaAutores");

			if (listaAutores != null) {
				for (Autor autor : listaAutores) {
			%>

			<tr>
				<td><%=autor.getIdAutor()%></td>
				<td><%=autor.getNombre()%></td>
				<td><%=autor.getNacionalidad()%></td>
				<td><a
					href="<%=url%>AutoresController?op=obtener&id=<%=autor.getIdAutor()%>">Modificar</a>
				<a
					href="<%=url%>AutoresController?op=eliminar&id=<%=autor.getIdAutor()%>">Eliminar</a>
				</td>
			</tr>


			<%
			}
			}

			else {
			%>
			<tr>
				<td>No hay datos</td>
				<td>No hay datos</td>
				<td>No hay datos</td>
			</tr>
			<%
			}
			%>
		</tbody>


	</table>



</body>
</html>