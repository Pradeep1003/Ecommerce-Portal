<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*"%>

<%
	try {
		HttpSession s = request.getSession(false);
		if (s.getAttribute("adminUsername") == null) {
%>

<script>
	alert('You have not logged in!')
	window.location.href = "Products";
</script>

<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>E-Commerce</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

	<jsp:include page="includes/adminHeader.jsp" />
	<div class="container">
		<br>
		<h2>Add Product</h2>
		<br>
		<form action="AddProducts">
			<div class="custom-file mb-3">
				<label for="image">Image URL:</label> <input type="file"
					name="imgUrl" onchange="readFile(this)" required>
			</div>
			<br>
			<div class="form-group">
				<label for="price">Price:</label> <input type="number"
					class="form-control" id="price" placeholder="Enter price"
					name="price" required>
			</div>
			<div class="form-group">
				<label for="discount">Discount:</label> <input type="number"
					class="form-control" id="discount" placeholder="Enter discount"
					name="discount" required>
			</div>
			<label for="product-type">Product Type:</label> <select
				class="form-control" name="type">
				<option>Mobile</option>
				<option>Laptop</option>
				<option>Iron</option>
			</select> <br>
			<button type="submit" class="btn primary">Submit</button>
		</form>
	</div>
	<jsp:include page="includes/footer.jsp" />

	<%
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>
