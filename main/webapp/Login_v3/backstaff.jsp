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
	
<script>
	function listpass(eid) {
		$.ajax({
            url:"${pageContext.request.contextPath}/Login_v3/Listpass.controller",
            data:eid,
            type:"POST",
            //設定接收格式為txt
            dataType:"txt",
            //編碼設定
            contentType:"text/html;charset=utf-8",
          //後臺返回成功後處理資料，data為後臺返回的txt格式資料
            success:function(data){
            	
            }
        });		
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
				<a href="Home.jsp"><button 
						class="btn btn-outline-success my-2 my-sm-0">返回點餐</button></a>
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
					<li class="nav-item"><a class="nav-link active"
						href="<c:url value="/Login_v3/BackLink.controller?linkaddress=Employee"/>">員工管理</a></li>
					<li class="nav-item"><a class="nav-link "
						href="<c:url value="/Login_v3/BackLink.controller?linkaddress=Inventory"/>">庫存管理</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Login_v3/BackLink.controller?linkaddress=Sales"/>">銷售管理</a></li>
					<li class="nav-item"><a class="nav-link "
						href="<c:url value="/Login_v3/BackLink.controller?linkaddress=Report"/>">報表管理</a></li>
				</ul>
				<br />
				<div class="center">
					<aside class="col-lg-10">
						<div class="card">
							<div class="table-responsive">
								<table>
									<h3>員工管理</h3>
									<div class="text-right">
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPoll-1">管理</button>
										<!-- Modal: modalPoll -->
										<div class="modal fade right" id="modalPoll-1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true" data-backdrop="false"
											style="padding-top: 20px">
											<div
												class="modal-dialog modal-full-height modal-right modal-notify modal-info"
												role="document" style="padding-top: 50px">
												<div class="modal-content" style="padding-top: 15px">
													<!--Header-->
													<div class="modal-header" style="padding-top: 30px">
														<p class="heading lead">員工管理</p>

														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true" class="white-text">×</span>
														</button>
													</div>

													<!--Body-->
													<form
														action="<c:url value="/Login_v3/Backstaff.controller" />"
														method="get">
														<div style="padding-left: 50px">
															<div class="form-group row" style="padding-top: 20px">
																<label for="inputname" class="col-sm-3 col-form-label">姓名:</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control w-75"
																		name="name" id="inputname" placeholder="姓名" value="${param.name}">
																</div>
															</div>
															<div class="form-group row">
																<label for="inputname" class="col-sm-3 col-form-label">員工編號:</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control w-75"
																	name="eid"	id="inputeid" placeholder="員工編號" value="${param.eid}">
																</div>
															</div>
															<div class="form-group row">
																<label for="inputname" class="col-sm-3 col-form-label">身分證字號:</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control w-75"
																	name="uid"	id="inputuid" placeholder="身分證字號" value="${param.uid}">
																</div>
															</div>
															<div class="form-group row">
																<label for="inputEmail3" class="col-sm-3 col-form-label">密碼:</label>
																<div class="col-sm-9">
																	<input type="password" class="form-control w-75"
																	name="pwd"	id="inputpwd" placeholder="密碼" value="${param.pwd}">
																</div>
															</div>
															<div class="form-group row">
																<label for="inputEmail3" class="col-sm-3 col-form-label">銀行帳戶:</label>
																<div class="col-sm-9">
																	<input type="number" class="form-control w-75"
																	name="bankaccount"	id="inputba" placeholder="銀行帳戶" value="${param.bankaccount}">
																</div>
															</div>

															<div class="form-group row">
																<label for="inputEmail3" class="col-sm-3 col-form-label">位階:</label>
																<div class="col-sm-5">
																	<select class="form-control" name="position"
																		id="exampleFormControlSelect1">
																		<option value="外場人員">外場人員</option>
																		<option value="內場人員">內場人員</option>
																		<option value="經理">經理</option>
																		<option value="總經理">總經理</option>
																	</select>
																</div>
															</div>
														</div>

														<div class="form-group row" style="padding-right: 10px">
															<div class="col-sm-10 offset-sm-2">
																<button type="submit" name="func" value="insert" class="btn btn-primary">新增</button>
																<button type="submit" name="func" value="delete" class="btn btn-primary">刪除</button>
																<button type="submit" name="func" value="update" class="btn btn-primary">修改</button>
															</div>
														</div>
													</form>
													<!--Footer-->
													<div class="modal-footer justify-content-center">
														<a type="button"
															class="btn btn-primary waves-effect waves-light">Send
															<i class="fa fa-paper-plane ml-1"></i>
														</a> <a type="button"
															class="btn btn-outline-primary waves-effect"
															data-dismiss="modal">Cancel</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</table>
								<table class="table table-borderless table-shopping-cart">
									<thead class="text-muted">
										<tr class=" text-uppercase ">
											<th scope="col" width="120">姓名</th>
											<th scope="col" width="120">員工編號</th>
											<th scope="col" width="120">身分證字號</th>
											<th scope="col" width="120">銀行帳戶</th>
											<th scope="col" width="120">位階</th>
											<!-- <th scope="col" class="text-right d-none d-md-block" width="200"></th>  多一列表 -->
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty eselect}">
											<c:forEach var="row" items="${eselect}">
												<c:url var="link" value="/Login_v3/backstaff.jsp">
													<c:param name="name" value="${row.name }" />
													<c:param name="eid" value="${row.eid }" />
													<c:param name="uid" value="${row.uid }" />
													<c:param name="pwd" value="${row.pwd }" />
													<c:param name="bankaccount" value="${row.bankaccount }" />
													<c:param name="position" value="${row.position }" />
												</c:url>
												<tr class="border">
													<td>
														<div class="text-left ">
															<a class="price md-7" href="${link}" >${row.name }</a>
														</div>
													</td>
													<td>
														<div class="text-left ">
															<var class="price md-7">${row.eid }</var>
														</div>
													</td>
													<td>
														<div class="text-left ">
															<var class="price md-7">${row.uid }</var>
														</div>
													</td>
													<td>
														<div class="text-left ">
															<var class="price md-7">${row.bankaccount }</var>
														</div>
													</td>
													<td>
														<div class="text-left ">
															<var class="price md-7">${row.position }</var>
														</div>
													</td>
												</tr>
											</c:forEach>
										</c:if>
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