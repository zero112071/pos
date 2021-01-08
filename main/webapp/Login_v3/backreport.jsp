<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>結單</title>
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/7af529b961.js"></script>
<!-- link css files-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<!--===============================================================================================-->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--===============================================================================================-->
<link rel="stylesheet" href="css/finsh.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
</head>

<body>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<a class="navbar-brand" href="Home.jsp">點餐</a>
		<div class="navbar-collapse offcanvas-collapse"
			id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
			</ul>
			<div>
				<a href="AllOrder.jsp"><button
						class="btn btn-outline-success my-2 my-sm-0">返回</button></a>
			</div>
		</div>
	</nav>
	<br />
	<main role="main">
		<div class="container-login100 album py-5 bg-light"
			style="background-image: url('images/bg-01.jpg')">
			<div class="container col-md-7">
				<br />
				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link "
						href="<c:url value="/Login_v3/BackLink.controller?linkaddress=Employee"/>">員工管理</a></li>
					<li class="nav-item"><a class="nav-link "
						href="<c:url value="/Login_v3/BackLink.controller?linkaddress=Inventory"/>">庫存管理</a></li>
					<li class="nav-item"><a class="nav-link "
						href="<c:url value="/Login_v3/BackLink.controller?linkaddress=Sales"/>">銷售管理</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="<c:url value="/Login_v3/BackLink.controller?linkaddress=Report"/>">報表管理</a></li>
				</ul>
				<br />
				<div class="center">
					<aside class="col-lg-10">
						<div class="card">
							<div class="table-responsive">
								<table>
									<h3>報表管理</h3>
									<div class="text-center">
										<input class="text-right border border-dark" type="date"
											name="bday"> 到 <input
											class="text-lift border border-dark" type="date" name="bday">
										<button type="button" class="btn btn-outline-info btn-sm">查詢</button>

									</div>
									<div class="row">
										
									
									</div>
								</table>

								</table>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
</body>

</html>