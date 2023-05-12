<%@page import="entites.Restaurant"%>
<%@page import="services.RestaurantService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Home</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/template/header.jsp"></jsp:include>

	<%
	RestaurantService rs = new RestaurantService();
	%>

	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<%
				for (Restaurant resto : rs.findAll()) {
				%>
				<div class="col mb-5 shadow-lg p-3 ml-5 bg-white rounded">
					<div class="card h-100">
						<!-- Product image-->
						<%
						if (resto.getPhotos().size() != 0) {
							String url = resto.getPhotos().get(0).getUrl();
							String[] arrOfStr = url.split("/", 10);
							String photoName = arrOfStr[9];
						%>
						<img class="card-img-top" src="images/<%=photoName%>" alt="..." />

						<%
						} else {
						%>
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<%
						}
						%>

						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=resto.getNom()%></h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-info mb-2">
									<!--  <div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>-->
									<div class="small mb-1">
										Opens at :
										<%=resto.getHourOpened()%>
										And Closes at
										<%=resto.getHourClosed()%></div>
								</div>
								<!-- Product price-->
								<%=resto.getAdresse()%>,
								<%=resto.getZone().getNom()%>,
								<%=resto.getZone().getVille().getNom()%>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto" href="ProductController?id=<%=resto.getId()%>">View
										Restaurant</a>
								</div>
							

						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>


		</div>
	</section>

	<!-- Footer-->
	<jsp:include page="/WEB-INF/template/footer.jsp"></jsp:include>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>