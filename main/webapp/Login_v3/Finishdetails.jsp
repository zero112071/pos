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

<script>
	function clearorder() {
		sessionStorage.removeItem("menus");
	}
</script>

</head>

<body>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<a class="navbar-brand" href="Home.jsp">點餐</a>
		<div class="navbar-collapse offcanvas-collapse"
			id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
			</ul>
			<div>
				<form action="<c:url value="/Login_v3/Details.controller" />">
					<button name="classes" value="全部" onclick="clearorder()"
						class="btn btn-outline-success my-2 my-sm-0">返回點餐</button>
				</form>
			</div>
		</div>
	</nav>
	<br />
	<main role="main">
		<div class="container-login100 album py-5 bg-light"
			style="background-image: url('images/bg-01.jpg')">
			<div class="container col-md-7">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					歡迎來到主人~ 一夜餐廳
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<br />

				<div class="center">
					<aside class="col-lg-10">
						<div class="card">
							<div class="table-responsive">
								<table>
									<h3>明細</h3>
									<tr>
										<td>訂單編號: "${detailnum}"</td>
									</tr>
									<br>
									<tr>
										<td>時間: "${time}"</td>
									</tr>
								</table>
								<table class="table table-borderless table-shopping-cart">
									<thead class="text-muted">

										<tr class=" text-uppercase ">
											<th scope="col">品項</th>
											<th scope="col" width="120">數量</th>
											<th scope="col" width="120">價格</th>
											<!-- <th scope="col" class="text-right d-none d-md-block" width="200"></th>  多一列表 -->
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${order}">
											<c:set var="sum" value="${sum + row.total}" />
											<tr class="border">
												<td>
													<figure class="itemside align-items-center">
														<div class="aside">
															<img src="${row.picture}" class="img-sm">
														</div>
														<div class=" col-7">
															<p>${row.food}</p>
														</div>
													</figure>
												</td>
												<td>
													<p>${row.num}</p>
												</td>
												<td>
													<div class="text-center ">
														<var class="price md-7">${row.total}</var>
													</div>
												</td>

											</tr>
										</c:forEach>
										<tr>
											<td></td>
											<td></td>

											<td>
												<dl class=" dlist-align text-capitalize ">
													<dt>總金額:</dt>
													<dd class="text-right ml-3">
														<c:out value="${sum}" />
													</dd>
												</dl>
											</td>
									</tbody>
								</table>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
</body>

</html>