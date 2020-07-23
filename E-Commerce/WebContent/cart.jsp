<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*"%>

<%
	try {
		HttpSession s = request.getSession(false);
		if (s.getAttribute("customerId") == null) {
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

	<jsp:include page="includes/header.jsp" />

	<div class="container">
		<h2>Cart</h2>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>Image</th>
					<th>Type</th>
					<th>Price</th>
					<th>Discount</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
					ArrayList productList = (ArrayList) request.getAttribute("productList");
						Integer totalPrice = 0;
						Integer totalDiscount = 0;
						for (int i = 0; i < productList.size(); i++) {
							ArrayList product = (ArrayList) productList.get(i);
							totalPrice = totalPrice + Integer.parseInt(product.get(2).toString());
							totalDiscount = totalDiscount + Integer.parseInt(product.get(3).toString());
				%>
				<tr>
					<td><img src=<%out.print(product.get(1));%> height=75 width=75 /></td>
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
					<td><a href="removeFromCart?productId=<%=product.get(0)%>">Remove</a></td>
				</tr>
				<%
					}
				%>
			
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th>Total</th>
					<th>
						<%
							out.print(totalPrice);
						%> Rs
					</th>
					<th>
						<%
							out.print(totalDiscount);
						%> %
					</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			</tbody>
		</table>
		<a href="/E-Commerce/payment.jsp" type="button"
			class="btn btn-primary btn-block">Click to Pay</a>
	</div>

	<jsp:include page="includes/footer.jsp" />

	<%
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>
