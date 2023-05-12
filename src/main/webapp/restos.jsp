<%@page import="entites.Restaurant"%>
<%@page import="services.RestaurantService"%>
<%@page import="entites.Zone"%>
<%@page import="services.ZoneService"%>
<%@page import="entites.Serie"%>
<%@page import="services.SerieService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Restaurants</title>
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

	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid p-4">
				<h1>Gestion Des Restaurants !</h1>
				<form action="RestaurantController" method="get">
					<input type="hidden" name="id"
						value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>" />
					<div class="row mt-3 mb-3">
						<div class="col">
							<input type="text" name="nom"
								value="<%=request.getParameter("nom") == null ? "" : request.getParameter("nom")%>"
								class="form-control" id="nom" placeholder="Nom">
						</div>
						<div class="col">
							<input type="text" name="addresse"
								value="<%=request.getParameter("addresse") == null ? "" : request.getParameter("addresse")%>"
								class="form-control" id="addresse" placeholder="Addresse">
						</div>
					</div>

					<div class="row mt-4 mb-3">
						<div class="col">
							<input type="text" name="latitude"
								value="<%=request.getParameter("latitude") == null ? "" : request.getParameter("latitude")%>"
								class="form-control" id="latitude" placeholder="Latitude">
						</div>
						<div class="col">
							<input type="text" name="longitude"
								value="<%=request.getParameter("longitude") == null ? "" : request.getParameter("longitude")%>"
								class="form-control" id="longitude" placeholder="Longitude">
						</div>
						<div class="col">
							<input type="time" class="form-control" name="hourOpened"
								value="<%=request.getParameter("hourOpened") == null ? "" : request.getParameter("hourOpened")%>">
							<small id="hourOpenedHelpBlock" class="form-text text-muted">
								Heure d'ouverture</small>
						</div>

						<div class="col">
							<input type="time" class="form-control" name="hourClosed"
								value="<%=request.getParameter("hourClosed") == null ? "" : request.getParameter("hourClosed")%>">
							<small id="hourClosedHelpBlock" class="form-text text-muted">
								Heure de femeture</small>
						</div>
					</div>

					<div class="row mt-3 mb-3">
						<div class="col">
							<label for="serie">Serie</label> <select class="form-control"
								name="serie" id="serie">
								<%
								SerieService ss = new SerieService();
								for (Serie s : ss.findAll()) {
								%>
								<%
								if (request.getParameter("serie") == null) {
								%>
								<option value="<%=s.getId()%>"><%=s.getNom()%></option>
								<%
								} else {
								%>
								<%
								if (request.getParameter("serie").equals("" + s.getId())) {
								%>
								<option value="<%=s.getId()%>" selected="selected"><%=s.getNom()%></option>
								<%
								} else {
								%>
								<option value="<%=s.getId()%>"><%=s.getNom()%></option>
								<%
								}
								%>
								<%
								}
								%>
								<%
								}
								%>
							</select>
						</div>

						<div class="col">
							<label for="zone">Zone</label> <select class="form-control"
								name="zone" id="zone">
								<%
								ZoneService zs = new ZoneService();
								for (Zone s : zs.findAll()) {
								%>
								<%
								if (request.getParameter("zone") == null) {
								%>
								<option value="<%=s.getId()%>"><%=s.getVille().getNom() + "-" + s.getNom()%></option>
								<%
								} else {
								%>
								<%
								if (request.getParameter("serie").equals("" + s.getId())) {
								%>
								<option selected="selected" value="<%=s.getId()%>"><%=s.getVille().getNom() + "-" + s.getNom()%></option>
								<%
								} else {
								%>
								<option value="<%=s.getId()%>"><%=s.getVille().getNom() + "-" + s.getNom()%></option>
								<%
								}
								%>
								<%
								}
								%>
								<%
								}
								%>
							</select>
						</div>


					</div>

					<div class="row mt-3 mb-3">
						<div class="col">
							<label for="description">Description</label>
							<textarea class="form-control" name="description"
								id="description" rows="2"><%=request.getParameter("description") == null ? "" : request.getParameter("description")%></textarea>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">
							<button id="add" type="submit" class="btn btn-primary btn-block"><%=request.getParameter("id") == null ? "Ajouter" : "Modifier"%></button>
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
				<table class="table resTab">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nom</th>
							<th scope="col">Serie</th>
							<th scope="col">Zone</th>
							<th scope="col">Specialites</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<!-- Ajoutez ici les lignes du tableau pour chaque ville -->
						<%
						RestaurantService rs = new RestaurantService();
						for (Restaurant v : rs.findAll()) {
						%>
						<tr>
							<td><%=v.getId()%></td>
							<td><%=v.getNom()%></td>
							<td><%=v.getSerie().getNom()%></td>
							<td><%=v.getZone().getVille().getNom() + "-" + v.getZone().getNom()%></td>
							<td><a
								href="RestoSpecController?id=<%=v.getId()%>"
								class="btn btn-primary btn-sm mr-2"> <i class="fas fa-edit"></i>
									Specialites
							</a></td>
							<td><a
								href="RestaurantController?id=<%=v.getId()%>&op=update"
								class="btn btn-primary btn-sm mr-2"> <i class="fas fa-edit"></i>
									Modifier
							</a> <a href="RestaurantController?id=<%=v.getId()%>&op=delete"
								class="btn btn-danger btn-sm"> <i class="fas fa-trash-alt"></i>
									Supprimer
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

</body>
</html>