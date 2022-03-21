<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.desafiolatam.entidades.InscripcionDTO2"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmación</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<!-- Estilo propio -->
<style>

body{
height: 500px;
background-image: linear-gradient(to right, rgba(166,166,166,0), rgba(85,85,85,1));
}

nav{
background: rgba(166,166,166,0);
}

</style>

</head>

<!-- 1. Modificar el archivo confirmación.jsp para que sea capaz de obtener desde el objeto
request el nombre, el teléfono, el id de curso y el de forma de pago. -->


<%
InscripcionDTO2 dto2 = (InscripcionDTO2) request.getAttribute("dto2");
%>

<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index">Mantenedor de Cursos</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="index">Inicio</a></li>
				<li><a href="preInscripcion">Inscribir Cursos</a></li>
				<li><a href="preListarInscripciones">Pre Listar
						Inscripciones</a></li>
			</ul>
		</div>
	</nav>

<!-- 3. En el archivo confirmacion.jsp se requiere desplegar los valores enviados desde el
servlet PostInscripcion, de tal manera que se desplieguen al usuario como una especie
de cuadro informativo.-->

	<div class="container">
		<h2>Inscripción Realizada</h2>
		<table class="table">
			<thead>
				<tr>
					<th>Id Inscripcion</th>
					<th>Nombre</th>
					<th>Telefono</th>
					<th>Nombre Curso</th>
					<th>Forma de Pago</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=dto2.getIdInsc()%></td>
					<td><%=dto2.getNombre()%></td>
					<td><%=dto2.getCelular()%></td>
					<td><%=dto2.getCurso()%></td>
					<td><%=dto2.getFormaDePago()%></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>