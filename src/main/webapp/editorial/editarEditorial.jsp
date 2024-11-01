<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	Editorial edit;
	if (request.getAttribute("editorial") == null)
		edit = new Editorial();
	else {
		edit = (Editorial) request.getAttribute("editorial");
	}
	%>

	<div class="container">
		<form role="form" action="<%=url%>AutoresController" method="POST">
			<input type="hidden" name="op" value="modificar" /> <input
				type="hidden" name="ideditorial" value="<%=edit.getIdEditorial()%>" />
			<h1>REGISTRO DE EDITORIAL</h1>
			Codigo: <input type="text" name="codigo"
				value="<%=edit.getIdEditorial()%>"> <br> Nombre
			Editorial: <input type="text" name="nombre"
				value="<%=edit.getNombre()%>"> <br> Contacto Editorial:
			<input type="text" name="contacto" value="<%=edit.getContacto()%>">
			<br> Telefono de Editorial: <input type="text" name="telefono"
				value="<%=edit.getTelefono()%>"> <br> <input
				type="submit" class="btn btn-info" value="Guardar" name="Guardar">
			<a class="btn btn-danger" href="<%=url%>EditorialController?op=listar">Cancelar</a>
		</form>
</body>
</html>




</div>
