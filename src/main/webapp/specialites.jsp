<%@page import="entites.Specialite"%>
<%@page import="services.SpecialiteService"%>
<%@page import="entites.Restaurant"%>
<%@page import="services.RestaurantService"%>
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
<title>Specialites</title>
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
				<h1>Gestion Des Specialites</h1>
				<form action="SpecialiteController" method="get">

					<input type="hidden" name="id"
						value="<%=request.getParameter("id") == null ? "" : request.getParameter("id")%>" />
					<div class="row mt-3 mb-3">
						<div class="col">
							<label for="nom">Nom</label> <input name="nom"
								class="form-control"
								value="<%=request.getParameter("nom") == null ? "" : request.getParameter("nom")%>">

						</div>

					</div>

					<div class="row mt-3">
						<div class="col">
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

				<h2>Liste Des Specialites</h2>
				<table class="table resTab">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nom</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						SpecialiteService ss = new SpecialiteService();
						for (Specialite specialite : ss.findAll()) {
						%>
						<tr>
							<th scope="row"><%=specialite.getId()%></th>
							<td><%=specialite.getNom()%></td>
							<td><a
								href="SpecialiteController?id=<%=specialite.getId()%>&op=update"
								class="btn btn-primary btn-sm mr-2"> <i class="fas fa-edit"></i>
									Modifier
							</a> <a
								href="SpecialiteController?id=<%=specialite.getId()%>&op=delete"
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