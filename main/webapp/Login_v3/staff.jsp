<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

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
<link rel="stylesheet" href="css/finsh.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<!--===============================================================================================-->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>

<body>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<a class="navbar-brand" href="Home.jsp">點餐</a>
		<div class="navbar-collapse offcanvas-collapse"
			id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
			</ul>
			<div>
				<a href="backstaff.jsp"><button
						class="btn btn-outline-success my-2 my-sm-0">返回</button></a>
			</div>
		</div>
	</nav>
	<br />
	<main role="main">
		<div class="container-login100 album py-5 bg-light"
			style="background-image: url('images/bg-01.jpg')">
			<div class="container col-md-7">
				<br /> <br />
				<div class="center ">
					<aside class="col-lg-10">
						<div class="card">
							<div class="table-responsive">
								<form action="<c:url value="/Login_v3/Backstaff.controller" />"
									method="get">
									<div class="form-group row">
										<label for="inputname" class="col-sm-2 col-form-label">姓名:</label>
										<div class="col-sm-10">
											<input type="text" name="name" class="form-control w-75" id="inputname"
												placeholder="姓名" value="${user.name}">
										</div>
									</div>
									<div class="form-group row">
										<label for="inputname" class="col-sm-2 col-form-label">員工編號:</label>
										<div class="col-sm-10">
											<input type="text" name="eid" class="form-control w-75" id="inputeid"
												placeholder="員工編號" value="${user.eid}">
										</div>
									</div>
									<div class="form-group row">
										<label for="inputname" class="col-sm-2 col-form-label">身分證字號:</label>
										<div class="col-sm-10">
											<input type="text" name="uid" class="form-control w-75" id="inputuid"
												placeholder="身分證字號" value="${user.uid}">
										</div>
									</div>
									<div class="form-group row">
										<label for="inputEmail3" class="col-sm-2 col-form-label">密碼:</label>
										<div class="col-sm-10">
											<input type="password" name="pwd" class="form-control w-75" id="inputpwd"
												placeholder="密碼" value="${user.pwd}">
										</div>
									</div>
									<div class="form-group row">
										<label for="inputEmail3" class="col-sm-2 col-form-label">銀行帳戶:</label>
										<div class="col-sm-10">
											<input type="text" name="bankaccount" class="form-control w-75" id="inputbankaccount"
												placeholder="銀行帳戶" value="${user.bankaccount}">
										</div>
									</div>
									<div class="form-group row">
										<label for="inputEmail3" class="col-sm-2 col-form-label">位階:</label>
										<div class="col-sm-5">
											<select name="position" class="form-control" id="selectposition">
												
												<option value="外場人員" >外場人員</option>
												<option value="內場人員" >內場人員</option>
												<option value="經理" >經理</option>
												<option value="總經理" >總經理</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-10 offset-sm-2">
											<button type="submit" name="func" value="insert" class="btn btn-primary">新增</button>
											<button type="submit" name="func" value="delete" class="btn btn-primary">刪除</button>
											<button type="submit" name="func" value="update" class="btn btn-primary">修改</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
</body>

</html>