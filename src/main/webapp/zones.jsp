<%@page import="services.ZoneService"%>
<%@page import="entites.Zone"%>
<%@page import="entites.Ville"%>
<%@page import="services.VilleService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="fr">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Zones</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">

	<!-- Header -->
	<jsp:include page="/WEB-INF/template/headerAdmin.jsp" />

	<!-- SideNav -->
	<jsp:include page="/WEB-INF/template/sideNavAdmin.jsp"></jsp:include>

	<!-- SideNav Content -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid p-4">
				<h1>Gestion Des Zones</h1>
				<form action="ZoneController" method="get">
					<input type="hidden" name="id"
						value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>" />
					<div class="form-group">
						<label for="zoneName">Nom de la zone</label> <input type="text"
							class="form-control" name="zoneName" id="zoneName"
							value="<%=request.getParameter("zoneName") == null ? "" : request.getParameter("zoneName")%>">
					</div>
					<div class="form-group">
						<label for="city">Ville</label> <select class="form-control"
							id="city" name="city">
							<%
							VilleService vs = new VilleService();
							for (Ville v : vs.findAll()) {
							%>
							<%
							if (request.getParameter("city") != null) {
							%>
							<%
							Boolean isSelected = false;
							%>
							<%
							isSelected = request.getParameter("city").equals(v.getId() + "") ? true : false;
							%>
							<%
							if (isSelected == true) {
							%>
							<option selected="selected" value="<%=v.getId()%>"><%=v.getNom()%></option>
							<%
							} else {
							%>
							<option value="<%=v.getId()%>"><%=v.getNom()%></option>
							<%
							}
							%>
							<%
							} else {
							%>
							<option value="<%=v.getId()%>"><%=v.getNom()%></option>
							<%
							}
							%>
							<%
							}
							%>

						</select>
					</div>
					<div class="row mt-5 mb-1">

						<div class="col md-3">
							<button type="submit" class="btn btn-primary btn-block"><%=request.getParameter("id") == null ? "Ajouter" : "Modifier"%></button>
						</div>
						<div class="col">
							<div class="form-group">
								
								<input type="text" class="searchInput form-control"
									onchange="searchFunction()" placeholder="search...">
							</div>
						</div>

					</div>

				</form>

				<br>

				<h2>Liste des zones</h2>
				<table class="table resTab">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nom</th>
							<th scope="col">Ville</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<%
						ZoneService zs = new ZoneService();
						for (Zone zone : zs.findAll()) {
						%>
						<tr>
							<th scope="row"><%=zone.getId()%></th>
							<td><%=zone.getNom()%></td>
							<td><%=zone.getVille().getNom()%></td>
							<td><a href="ZoneController?id=<%=zone.getId()%>&op=delete"
								class="btn btn-danger btn-sm"> <i class="fas fa-trash-alt"></i>
									Supprimer
							</a> <a href="ZoneController?id=<%=zone.getId()%>&op=update"
								class="btn btn-primary btn-sm mr-2"> <i class="fas fa-edit"></i>
									Modifier
							</a></td>

						</tr>
						<%
						}
						%>

					</tbody>
				</table>


			</div>


		</main>

		<!-- Footer -->
		<jsp:include page="/WEB-INF/template/footerAdmin.jsp"></jsp:include>
	</div>

	<script>
		function searchFunction() {
			const val = document.querySelector('.searchInput').value
					.toLowerCase();
			var table = document.querySelector('.resTab');
			for (var i = 1, row; row = table.rows[i]; i++) {
				//iterate through rows
				//rows would be accessed using the "row" variable assigned in the for loop
				var nom = row.cells[1].innerHTML.toLowerCase();
				if (nom.startsWith(val)) {
					row.style.display = '';
				} else {
					row.style.display = 'none';
				}

			}

		}
	</script>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.16.6/dist/umd/popper.min.js"
		integrity="sha384-Q2XjA0n+bJZPVZ8WpZj1nAJpAEYtRnG8WPU9+4B3tJ5Ht3Kj2gSZM5PZO5NQq5g5E"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
</body>

</html>

