<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWebGB.beans.Editorial"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDITORIALES</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body>

	<%
	String url = "http://localhost:8080/proyectoWebGB/";
	%>

	<script>
		function eliminar(id) {
			if (confirm("Desea eliminar el registro?") == true) {
				location.href = "AutoresController?op=eliminar&id=" + id;
			} else {

			}
		}
	</script>

	<div class="container"></div>
	<a type="button" class="btn btn-primary"
		href="<%=url%>EditorialController?op=nuevo">NUEVO EDITORIAL</a>
	<a type="button" class="btn btn-primary"
		href="<%=url%>AutoresController?op=listar">VER AUTORES </a>

	<table class="table table-dark table-striped" border="1">
		<thead>

			<th>Cod Editorial</th>
			<th>Nombre</th>
			<th>Contacto</th>
			<th>Telefono</th>
			<th>Operaciones</th>

		</thead>

		<tbody>
			<%
				List<Editorial> listaEditorial = (List<Editorial>) request.getAttribute("listaEditorial");

				if (listaEditorial != null) {
					for (Editorial edit : listaEditorial) {
				%>

			<tr>
				<td><%=edit.getIdEditorial()%></td>
				<td><%=edit.getNombre()%></td>
				<td><%=edit.getContacto()%></td>
				<td><%=edit.getTelefono()%></td>
				<td><a
					href="<%=url%>EditorialController?op=obtener&id=<%=edit.getIdEditorial()%>"
					class="btn btn-warning ">Modificar</a> <!-- <a
						href="<%=url%>EditorialController?op=eliminar&id=<%=edit.getIdEditorial()%>">Eliminar</a>
						 --> <a href="javascript:eliminar('<%=edit.getIdEditorial()%>')"
					class="btn btn-danger">Eliminar</a></td>
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
				<td>No hay datos</td>

			</tr>
			<%
			}
			%>
		</tbody>


	</table>
</body>
</html>
</div>

