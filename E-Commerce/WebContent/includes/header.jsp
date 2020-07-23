<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <div class="jumbotron text-center" style="margin-bottom:0; padding: 2rem 2rem;">
  <h1>E-Commerce</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="Products">E-Commerce</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="Products">Home</a>
        
      <li class="nav-item">
        <a class="nav-link" href="/E-Commerce/AdminLogin.jsp">Admin Login</a>
      </li>
            <%
    	  HttpSession s=request.getSession(false);
      
		if(s.getAttribute("customerId") == null) {
%>
      <li class="nav-item">
        <a class="nav-link" href="/E-Commerce/CustomerLogin.jsp">Customer Login</a>
      </li> 
      <% } %>
        
       </li>
      <li class="nav-item">
        <a class="nav-link" href="Cart">Cart</a>
      </li> 
      <%
      
		if(s.getAttribute("customerId") != null) {
%>
      <li class="nav-item">
        <a class="nav-link" href="Logout">Logout</a>
      </li> 
      <% } %>
    </ul>
  </div>  
</nav>
   