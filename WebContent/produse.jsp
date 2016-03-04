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
	.top-buffer {
		margin-top:20px;
	}
	.col-border {
		border: 2px solid rgba(10, 20, 50, 0.9);
		border-radius: 5px
	}
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
		<div class="row top-buffer">
			<div class="col-sm-8">
				<h1>List of products</h1>
			</div>
		</div>
		 
		<div class="row top-buffer">
			<div class="col-sm-10 col-md-6">
				
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
							%>
							<%
							List<Produs> produse = dao.getAllProducts();
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
		<div class="row top-buffer">
			<div class="col-xs-12">
				<h3>Adauga produse. Esti liber la baza de date!!</h3>
			</div>
		</div>
		<div class="row top-buffer">
			<div class="col-sm-6 col-border">
				<form class="form-horizontal" role="form" action="produse.jsp" method="get">
					<div class="form-group">
						<label for="numar">Denumire</label> <input type="text"
							class="form-control" id="nume" name="nume">
						<label for="numar">Culoare</label> <input type="text"
							class="form-control" id="culoare" name="culoare">
						<label for="numar">Pret</label> <input type="text"
							class="form-control" id="pret" name="pret">
						<label for="numar">Stoc</label> <input type="text"
							class="form-control" id="stoc" name="stoc">
					</div>
					<button type="submit" class="btn btn-warning" 
					value="AdaugaProdus">Adauga produs</button>
				</form>
				<%
				
				if (request.getParameter("nume") != null ||
						request.getParameter("culoare") != null ||
						request.getParameter("pret") != null || 
						request.getParameter("stoc") != null) {
					String codp = (produse.size()+1) + "";
					String den = request.getParameter("nume");
					String color = request.getParameter("culoare");	
					String pret = request.getParameter("pret");
					String stoc = request.getParameter("stoc");
					
					// produsul ar trebui intr-un try/catch
					Produs produs = new Produs(codp, den, color, pret, stoc);
					dao.adaugaProdus(produs);
				}	
				%>
				
			</div>
		</div>
		<div class="row top-buffer">
			<div class="col-xs-12">
			
			</div>
		</div>
	</div>



</body>
</html>