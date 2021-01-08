<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>點餐</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/7af529b961.js"></script>
<!-- link css files-->
<link rel="stylesheet" href="css/qbt.css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="js/jquery-3.4.1.js"></script>

<script>
	if (!order) {var order = [];}
	function addorder(food,price,picture) {
		var result = JSON.parse(sessionStorage.getItem("menus")); 
		var foodall = document.querySelectorAll('p[class="food"]');
		var numall = document.querySelectorAll('input[name="quantity"]');
		var num;
		
		for (var i = 0; i < numall.length; i++) {
			if (foodall[i].innerText==food && numall[i].value!="0" ) {
				num = numall[i].value; 
				numall[i].value = 0; 
			}
		}
		
		var menu = new Object();
		menu.food = food;
		menu.price = price;
		menu.num = num;
		menu.total = price*num;
		menu.picture = picture;
		menu.detailnum = "123";
		
		var re = false;
		
		if (result==null) {
			order.push(menu);
			sessionStorage.setItem("menus",JSON.stringify(order));
		} else {
			for (var i = 0; i < result.length; i++) {
				if (result[i].food==food) {
					result[i].num = parseInt(result[i].num)+parseInt(menu.num);
					result[i].total = result[i].price*result[i].num;
					re = true;
					break;
				}
			}
			
			if (re==false) {
				result.push(menu);
			}
			
			sessionStorage.setItem("menus",JSON.stringify(result));
		}
	}
	
	function passorder() {
		var order = sessionStorage.getItem("menus");
		
		$.ajax({
            url:"${pageContext.request.contextPath}/Login_v3/Finish.controller",
            data:order,
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
				<button type="submit" class="btn btn-outline-success my-2 my-sm-0" onclick="passorder()">結帳明細</button>
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
					歡迎來到主人~ 一夜乾餐廳
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<br />
				
				<form action="<c:url value="/Login_v3/Menu.controller" />" method="get">
				<ul class="nav nav-pills">
					<li class="nav-item"><input class="nav-link" type="submit" name="classes" value="全部"></input></li>
					<li class="nav-item"><input class="nav-link" type="submit" name="classes" value="主餐"></input></li>
					<li class="nav-item"><input class="nav-link" type="submit" name="classes" value="副餐"></input></li>
					<li class="nav-item"><input class="nav-link" type="submit" name="classes" value="炸物"></input></li>
					<li class="nav-item"><input class="nav-link active" type="submit" name="classes" value="飲品"></input></li>
				</ul>
				</form>
				<br />
				<div class="row">
					<c:if test="${not empty select}">
						<c:forEach var="row" items="${select}">
							<c:url var="link" value="/Login_v3/Finish.jsp">
								<c:param name="cid" value="${row.cid }" />
								<c:param name="food" value="${row.food }" />
								<c:param name="classes" value="${row.classes }" />
								<c:param name="price" value="${row.price }" />
								<c:param name="picture" value="${row.picture }" />
							</c:url>
							<div class="col-md-3">
								<div class="card mb-4 shadow-sm">
									<img class="card-img-top" name="picture" src="${row.picture}" alt="Card image cap" width="300px" height="205px">
									<div class="card-body">
										<p class="food" name="food">${row.food}</p>
										<p class="card-text" name="price">${row.price}</p>
									</div>
									
									<div class="card-footer">
										<div class="text-right row">
											<div class="def-number-input number-input safari_only col-6">
												<button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
												<input class="quantity" min="0" name="quantity" type="number" max="15" value="0">
												<button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
											</div>
											<button type="button" class="btn btn-primary btn-sm ml-auto col-4" onclick='addorder("${row.food}","${row.price}","${row.picture}")'>下單</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
			</div>
		</div>
	</main>
</body>
</html>