<%@page import="dao.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="domain.*"%>


<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Magazin - Home</title>
<style>


</style>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Magazin </a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="index.jsp"><span
					class="glyphicon glyphicon-home"></span> Acasa</a></li>
			<li class="active"><a href="#">Produse</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</div>
	</nav>
	<div class="jumbotron" style="text-align: center;">
		<h1>Fancy online shop name here</h1>
		<p>Clear, short, inspirational motto here</p>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h1>List of products</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-10">
				<div class="table-responsive">
					<table class="table table-striped">
						<caption>Our products v0.1</caption>
						<thead>
							<tr>
								<th>No.</th>
								<th>Product</th>
								<th>Color</th>
								<th>Price</th>
								<th>Available</th>
							</tr>
						</thead>
						<tbody> <!--  this should be dynamic -->
							<%!
								Dao dao = new DaoImpl();
								List<Produs> produse = dao.getAllProducts();
							%>
							<%
								for (Produs produs : produse) {
									%> 
									<tr>
										<td><%= produs.getId() %></td>
										<td><%= produs.getName() %></td>
										<td><%= produs.getColor() %></td>
										<td><%= produs.getPrice() %></td>
										<td><%= produs.getStoc() %></td>
									</tr>
									<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-pull-right-3">
				<form class="form-inline" role="form" action="index.jsp" method="get">
					<div class="form-group">
						<label for="numar">Denumire</label> <input type="text"
							class="form-control" id="numar" name="numar">
						<label for="numar">Culoare</label> <input type="text"
							class="form-control" id="numar" name="numar">
						<label for="numar">Pret</label> <input type="text"
							class="form-control" id="numar" name="numar">
						<label for="numar">Stoc</label> <input type="text"
							class="form-control" id="numar" name="numar">
					</div>
					<button type="submit" class="btn btn-success" 
					value="Afiseaza nr la puterea a treia">Adauga produs</button>
				</form>
			</div>
		</div>
	</div>



</body>
</html>