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
	window.location.href = "/E-Commerce/AdminDashboard.jsp";
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

	<%
		ArrayList productList = (ArrayList) request.getAttribute("productList");
	%>
	<div class="container">
		<h2>Products</h2>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>Image</th>
					<th>Type</th>
					<th>Price</th>
					<th>Discount</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < productList.size(); i++) {
							ArrayList product = (ArrayList) productList.get(i);
				%>
				<div class="col">
					<tr>
						<td><img src=<%out.print(product.get(1));%> height=75
							width=75 /></td>
						<td>
							<%
								out.print(product.get(4));
							%>
						</td>
						<td>
							<%
								out.print(product.get(2));
							%> Rs
						</td>
						<td>
							<%
								out.print(product.get(3));
							%> %
						</td>
					</tr>
					<%
						}
					%>
				
			</tbody>
		</table>

	</div>

	<jsp:include page="includes/footer.jsp" />

	<%
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>
