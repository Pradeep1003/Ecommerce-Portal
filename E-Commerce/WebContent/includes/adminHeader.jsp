<div class="jumbotron text-center" style="margin-bottom:0; padding: 2rem 2rem;">
  <h1>E-Commerce</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">Admin Panel</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="getProducts">Products</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/E-Commerce/AddProducts.jsp">Add product</a>
      </li>
      <%
    	  HttpSession s=request.getSession(false);
      if(s.getAttribute("adminUsername") != null) {
%>
      <li class="nav-item">
        <a class="nav-link" href="Logout">Logout</a>
      </li> 
      <% } %>
    </ul>
  </div>  
</nav>
   