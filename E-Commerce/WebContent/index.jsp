<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<html lang="en">
<head>
<title>E-Commerce</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 300px;
	margin: auto;
	text-align: center;
	font-family: arial;
}

.title {
	color: grey;
	font-size: 18px;
}

button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}

a {
	text-decoration: none;
	font-size: 22px;
	color: black;
}

button:hover, a:hover {
	opacity: 0.7;
}
</style>
</head>
<body>
	<jsp:include page="includes/header.jsp" />
	<%
		try {

			if (request.getParameter("added") != null && request.getParameter("added").equals("true")) {
	%>

	<script>
		alert('Product Added Sucessfully!')
	</script>

	<%
		}
			HttpSession s = request.getSession(false);
			String customerId = null;
			if (s.getAttribute("customerId") != null) {
				customerId = s.getAttribute("customerId").toString();
			}
			ArrayList productList = (ArrayList) request.getAttribute("productList");

			if (productList == null) {
				response.sendRedirect("Products");
			}
	%>
	<div class="container">
		<form action="SearchProduct">
			<br>
			<div class="form-group">
				<input type="price" class="form-control" id="price"
					placeholder="Search by Product Type" name="productType">
			</div>
			<button type="submit" class="btn btn-primary">Search</button>
		</form>
		<div class="container-fluid">
			<center>
				<h1>All Products</h1>
			</center>
			<br>
			<div class="row">
				<%
					for (int i = 0; i < productList.size(); i++) {
							ArrayList product = (ArrayList) productList.get(i);
				%>
				<div class="col">
					<div class="card">
						<img src="<%out.print(product.get(1));%>" height=200 alt="John"
							style="width: 100%">
						<h1></h1>
						<p class="title">
							Price:
							<%
							out.print(product.get(2));
						%>
							Rs
						</p>
						<p>
							Discount:
							<%
							out.print(product.get(3));
						%>%
						</p>
						<p>
							Product Type:
							<%
							out.print(product.get(4));
						%>
						</p>
						<%
							if (s.getAttribute("customerId") != null) {
						%>
						<p>
							<a
								href="addToCart?productId=<%=product.get(0)%>&customerId=<%=customerId%>">Add
								to Cart</a>
						</p>
						<%
							} else {
						%>
						<a data-toggle="popover" data-content="You have not loggen in!">Add
							to Cart</a>
						<%
							}
						%>
					</div>
				</div>
				<%
					}
					} catch (Exception e) {
						System.out.print(e);
					}
				%>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp" />
</body>
</html>