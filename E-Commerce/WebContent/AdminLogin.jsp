<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Commerce</title>
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

	<%
		if (request.getParameter("credentials") != null && request.getParameter("credentials").equals("false")) {
	%>
	<script>
		alert("Wrong credentials");
	</script>
	<%
		}
	%>
	<div class="container">
		<br> <br> <br>
		<h2>Admin Login</h2>
		<title>E-Commerce</title>
		<form action="AdminLogin" class="was-validated">
			<div class="form-group">
				<label for="uname">Username:</label> <input type="text"
					class="form-control" id="uname" placeholder="Enter username"
					name="username" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="password" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
		</form>
	</div>

</body>
</html>
