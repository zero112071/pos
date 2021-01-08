<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
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

<style>
	.number{ display: inline-block;}
	.css_button {
   padding: 3px 7px;
   border: 1px solid #C7C7C7;
   background: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#FFFFFF));
   background: -webkit-linear-gradient(top, #FFFFFF, #FFFFFF);
   background: -moz-linear-gradient(top, #FFFFFF, #FFFFFF);
   background: -ms-linear-gradient(top, #FFFFFF, #FFFFFF);
   background: -o-linear-gradient(top, #FFFFFF, #FFFFFF);
   background-color: #FFFFFF;
   box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 3px #000000;
   -webkit-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 3px #000000;
   -moz-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 3px #000000;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 10px;
   text-shadow: #000000 1px 1px 0px;
   color: #000000;
   font-size: 10px;
   text-decoration: none;
   font-weight: bold;
   -webkit-transition: 0.2s;
   -moz-transition: 0.2s;
   -o-transition: 0.2s;
   cursor: pointer;
   }
.css_button:hover {
   background: none;
   background-color: #FFFFFF;
   box-shadow: 0px 0px 5px 0px #AAAAAA;
   -webkit-box-shadow: 0px 0px 5px 0px #AAAAAA;
   -moz-box-shadow: 0px 0px 5px 0px #AAAAAA;
   border: 1px solid #ffffff;
   color: #1F6AED;
   }
.css_button:active {
   top: 1px;
   position: relative;
   }
</style>

<script>
	
	function numchange(food,op) {
		var result = JSON.parse(sessionStorage.getItem("menus"));
		
		for (var i = 0; i < result.length; i++) {
			if (result[i].food==food) {
				var num = document.getElementsByClassName("num")[i].innerText;
				if (op=="+") {
					result[i].num = parseInt(num)+1;
					result[i].total = result[i].price * result[i].num;
				}
				if (op=="-" && parseInt(num)>1) {
					result[i].num = parseInt(num)-1;
					result[i].total = result[i].price * result[i].num;
				}
			}
		}
		
		sessionStorage.setItem("menus",JSON.stringify(result));
		
		var update = sessionStorage.getItem("menus");
		$.ajax({
            url:"${pageContext.request.contextPath}/Login_v3/Finish.controller",
            data:update,
            type:"POST",
            //設定接收格式為JSON
            dataType:"json",
            //編碼設定
            contentType:"application/json;charset=utf-8",
            //後臺返回成功後處理資料，data為後臺返回的json格式資料
            success:function(data){
            	window.location.href="<c:url value="/Login_v3/Finish.jsp" />";
            }
        });
	}
	
	function delorder(food) {
		var result = JSON.parse(sessionStorage.getItem("menus"));
		var order = [];
		for (var i = 0; i < result.length; i++) {
			if (result[i].food == food) {
				continue;
			}
			order.push(result[i])
		}
		sessionStorage.setItem("menus",JSON.stringify(order));
		
		var update = sessionStorage.getItem("menus");
		$.ajax({
            url:"${pageContext.request.contextPath}/Login_v3/Finish.controller",
            data:update,
            type:"POST",
            //設定接收格式為JSON
            dataType:"json",
            //編碼設定
            contentType:"application/json;charset=utf-8",
            //後臺返回成功後處理資料，data為後臺返回的json格式資料
            success:function(data){
            	window.location.href="<c:url value="/Login_v3/Finish.jsp" />";
            }
        });
	}
	
	function numch(food) {
		var result = JSON.parse(sessionStorage.getItem("menus"));
		
		for (var i = 0; i < result.length; i++) {
			if (result[i].food==food) {
				var num = document.getElementsByClassName("num")[i].value;
				result[i].num = num;
				result[i].total = result[i].price * result[i].num;
			}
		}
		
		sessionStorage.setItem("menus",JSON.stringify(result));
		
		var update = sessionStorage.getItem("menus");
		$.ajax({
            url:"${pageContext.request.contextPath}/Login_v3/Finish.controller",
            data:update,
            type:"POST",
            //設定接收格式為JSON
            dataType:"json",
            //編碼設定
            contentType:"application/json;charset=utf-8",
            //後臺返回成功後處理資料，data為後臺返回的json格式資料
            success:function(data){
            	window.location.href="<c:url value="/Login_v3/Finish.jsp" />";
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
				<form action="<c:url value="/Login_v3/Menu.controller" />">
				<button name="classes" value="全部" class="btn btn-outline-success my-2 my-sm-0">返回點餐</button>
				</form>
			</div>
		</div>
	</nav>
	<br />
	<main role="main">
		<div class="container-login100 album py-5 bg-light"
			style="background-image: url('images/bg-01.jpg')">
			<div class="container">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					歡迎來到主人~ 一夜餐廳
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<br />
				<form action="<c:url value="/Login_v3/Recipe.controller" />" method="get">
				<div class="center">
					<aside class="col-lg-10">
						<div class="card">
							<div class="table-responsive">
								<table class="table table-borderless table-shopping-cart">
									<thead class="text-muted">
										<tr class=" text-uppercase ">
											<th scope="col">品項</th>
											<th scope="col" width="120">數量</th>
											<th scope="col" width="120">價格</th>
											<th scope="col" width="120">總價</th>
											<th scope="col" class="text-right d-none d-md-block" width="200"></th>
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
													<div>
														<div class="number"><a class="css_button" onclick="numchange('${row.food}','-')">-</a></div>
														&ensp;
														<div class="number"><p class="num">${row.num}</p></div>
														&ensp;
														<div class="number"><a class="css_button" onclick="numchange('${row.food}','+')">+</a></div>
													</div>
												</td>
												
												<td>
													<div class="text-center ">
														<var class="price md-7">${row.price}</var>
													</div>
												</td>
												<td>
													<div class="text-center ">
														<var class="price md-7">${row.total}</var>
													</div>
												</td>
												<td class="text-right d-none d-md-block"><p onclick="delorder('${row.food}')"
													class="btn btn-light btn-round" data-abc="true">取消</p></td>
											</tr>
										</c:forEach>
										<tr>
											<td>
												<dl class=" dlist-align text-capitalize ">
													<dt>總金額:</dt>
													<dd class="text-right ml-3"><c:out value="${sum}"></c:out></dd>
												</dl>
											</td>
											<td></td>
											<td></td>
											<td>
												<input type="submit" name="reaction" value="送出訂單" 
													class="btn btn-out btn-primary btn-square btn-main"
													data-abc="true"></input>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</aside>
				</div>
				</form>
			</div>
		</div>
</body>

</html>