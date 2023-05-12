<%@page import="services.VilleService"%>
<%@page import="services.ZoneService"%>
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
<title>Resto Item</title>
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


<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
	integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
	integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
	crossorigin=""></script>
<script type="text/javascript" src="js/map.js"></script>
</head>
<body onload="init()">
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/template/header.jsp"></jsp:include>
	

	<%
	int restoId = Integer.parseInt(request.getParameter("id"));
	RestaurantService rs = new RestaurantService();
	Restaurant resto = rs.findById(restoId);
	ZoneService zs = new ZoneService();
	VilleService vs = new VilleService();
	%>
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<%
				if (!request.getParameter("p").equals("")) {
				%>
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="images/<%=request.getParameter("p")%>" alt="..." />
				</div>
				<%
				} else {
				%>
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
				</div>
				<%
				}
				%>
				<div class="col-md-6">
					<div class="small mb-1">
						Opens at :
						<%=resto.getHourOpened()%>
						And Closes at
						<%=resto.getHourClosed()%></div>
					<h1 class="display-5 fw-bolder"><%=resto.getNom()%></h1>
					<div class="fs-5 mb-5">
						<!-- <span class="text-decoration-line-through">$45.00</span> -->
						<span><%=resto.getAdresse()%>, <%=resto.getZone().getNom()%>,
							<%=resto.getZone().getVille().getNom()%></span>
					</div>
					<p class="lead"><%=resto.getDescription()%></p>
					<div class="d-flex">
						
						<button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="showMap()">
							<i class="bi-cart-fill me-1" ></i> Show Location
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Map -->
	<style>
		#map { height: 300px; }
	</style>
	
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div id="map"></div>
		</div>
	</section>


	<!-- Related items section-->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">Related products</h2>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Fancy Product</h5>
								<!-- Product price-->
								$40.00 - $80.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View
									options</a>
							</div>
						</div>
					</div>
				</div>
				
				
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




	<!-- 
      The `defer` attribute causes the callback to execute after the full HTML
      document has been parsed. For non-blocking uses, avoiding race conditions,
      and consistent behavior across browsers, consider loading using Promises
      with https://www.npmjs.com/package/@googlemaps/js-api-loader.
      -->

	<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=&callback=initMap"></script> -->
</body>
</html>