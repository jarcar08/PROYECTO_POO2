<%@page import="com.unu.proyectoWebGB.beans.Autor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min.js"></script>

<script>
	function validateForm() {
		var nombre = document.getElementById("nombre").value;
		var nacionalidad = document.getElementById("contacto").value;

		if (nombre.trim() === "" || nacionalidad.trim() === "") {
			alert("Por favor, completa todos los campos requeridos.");
			return false; // Prevent form submission
		}
		return true; // Allow form submission
	}
</script>



</head>
<body>

	<%
	String url = "http://localhost:8080/proyectoWebGB/";
	%>

	<div class="container">
		<h3>NUEVO AUTOR</h3>
		<form class="row g-3" role="form" action="<%=url%>AutoresController"
			method="POST">
			<!-- onsubmit="return validateForm();"> -->
			<input type="hidden" name="op" value="insertar">

			<!--
			<label
				for="codigo">Codigo del autor:</label>
			<div class="input-group">
				<input type="text" class="form-control" name="codigo" id="codigo"
					value="" placeholder="Ingresa el codigo del autor">
			</div>
			-->

			<div class="col-md-4">
				<label for="nombre" class="form-label">Nombre del autor: </label> <input
					type="text" class="form-control" name="nombre" id="nombre" value=""
					required placeholder="Ingresa el nombre del autor"> <span
					class="input-group-addon"><span
					class="glyphicon 
glyphicon-asterisk"></span></span>
			</div>



			<!-- <label for="nombre">Nombre del autor:</label> <input type="text"
					class="form-control" name="nombre" id="nombre" value=""
					placeholder="Ingresa el nombre del autor"> <span
					class="input-group-addon"><span
					class="glyphicon 
glyphicon-asterisk"></span></span>
 -->


			<div class="col-md-4">
				<label for="contacto" class="form-label">Nacionalidad del
					autor:</label> <input type="text" class="form-control" id="contacto"
					value="" name="nacionalidad" required
					placeholder="Ingresa la nacionalidad del autor"> <span
					class="input-group-addon"><span
					class="glyphicon 
glyphicon-asterisk"></span></span>

			</div>

			<input type="submit" class="btn btn-info" value="Guardar"
				name="Guardar"> <a class="btn btn-danger"
				href="<%=url%>AutoresController?op=listar">Cancelar</a>
		</form>
</body>
</html>
</div>

