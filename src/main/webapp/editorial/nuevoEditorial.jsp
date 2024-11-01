<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDITORIALES</title>

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
		<h3>NUEVO EDITORIAL</h3>
		<form class="row g-3" role="form" action="<%=url%>EditorialController"
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

			<div class="col-md-6 mb-3">
				<label for="nombre" class="form-label">Nombre del Editorial:
				</label> <input type="text" class="form-control" name="nombre" id="nombre"
					value="" required placeholder="Ingresa el nombre del Editorial">
				<span class="input-group-addon"><span
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

			<div class="col-md-6 mb-3">
				<label for="contacto" class="form-label">Contacto del
					Editorial: </label> <input type="text" class="form-control" id="contacto"
					value="" name="contacto" required
					placeholder="Ingresa el contacto del editorial"> <span
					class="input-group-addon"><span
					class="glyphicon 
glyphicon-asterisk"></span></span>

			</div>
			
			<div class="col-md-6 mb-3">
				<label for="telefono" class="form-label">Telefono del Editorial:
				</label> <input type="text" class="form-control" name="telefono" id="telefono"
					value="" required placeholder="Ingresa el telefono del Editorial">
				<span class="input-group-addon"><span
					class="glyphicon 
glyphicon-asterisk"></span></span>
			</div>

			<div class="col-12 text-center">

				<input type="submit" class="btn btn-info" value="Guardar"
					name="Guardar"> <a class="btn btn-danger"
					href="<%=url%>EditorialController?op=listar">Cancelar</a>
			</div>
		</form>
</body>
</html>
</div>

