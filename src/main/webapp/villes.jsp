<%@page import="services.VilleService"%>
<%@page import="entites.Ville"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Villes</title>
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
				<h1>Gestion des villes !</h1>
				<form action="VilleController" method="get">
					<div class="row">
						<input type="hidden" name="id"
							value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>" />
						<div class="form-group">
							<label for="input-name">Nom</label> <input type="text" name="nom"
								value="<%=request.getParameter("nom") == null ? "" : request.getParameter("nom")%>"
								class="form-control" id="nom"
								placeholder="Entrez le nom de la ville">
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
							<th scope="col">Ville</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<!-- Ajoutez ici les lignes du tableau pour chaque ville -->
						<%
						VilleService vs = new VilleService();
						for (Ville v : vs.findAll()) {
						%>
						<tr>
							<td><%=v.getId()%></td>
							<td><%=v.getNom()%></td>
							<td><a href="VilleController?id=<%=v.getId()%>&op=update"
								class="btn btn-primary btn-sm mr-2"> <i class="fas fa-edit"></i>
									Modifier
							</a> <a href="VilleController?id=<%=v.getId()%>&op=delete"
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
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>
