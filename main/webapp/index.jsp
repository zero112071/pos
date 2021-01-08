<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <!-- fontawesome -->
  <script src="https://kit.fontawesome.com/7af529b961.js"></script>
  <!-- link css files-->
  <link rel="stylesheet" href="css/qbt.css">
  <script src="js/jquery-3.4.1.js"></script>
  <script src="js/qbt.js"></script>
</head>

<body>
  <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
    <a class="navbar-brand" href="Home.html">點餐</a>
    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault" ;>
      <ul class="navbar-nav mr-auto">
      </ul>
      <div>
        <a href="/logout"><button class="btn btn-outline-success my-2 my-sm-0">明細/結單</button></a>
      </div>
    </div>
  </nav>
  <br />
  <main role="main">
    <div class="container-login100 album py-5 bg-light" style="background-image: url('images/bg-01.jpg')">
      <div class="container">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          歡迎來到主人~ 一夜餐廳
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <br />
        <ul class="nav nav-pills">
          <li class="nav-item">
            <a class="nav-link active" href="?categoryId=">全部</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="FristOrder.html">主餐</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="SideOrder.html">副食</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="FriedOrder.html">炸物</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="DrinkOrder.html">飲品</a>
          </li>
        </ul>
        <br />
        <div class="row">
          <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
              <img class="card-img-top" src="images/burger.jpg" alt="Card image cap" width="300px" height="205px">
              <div class="card-body">
                <p class="card-text">
                <p class="text-primary">美味蟹堡<span class="badge badge-danger">激推</span></p>
                </p>
                <p class="card-text">$300</p>
              </div>
              <div class="card-footer">
                <div class="def-number-input number-input safari_only">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number" max="10">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
              <img class="card-img-top" src="images/burger.jpg" alt="Card image cap" width="300px" height="205px">
              <div class="card-body">
                <p class="card-text">
                <p class="text-primary">美味蟹堡<span class="badge badge-danger">激推</span></p>
                </p>
                <p class="card-text">$300</p>
              </div>
              <div class="card-footer">
                <div class="def-number-input number-input safari_only">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
              <img class="card-img-top" src="images/burger.jpg" alt="Card image cap" width="300px" height="205px">
              <div class="card-body">
                <p class="card-text">
                <p class="text-primary">美味蟹堡<span class="badge badge-danger">激推</span></p>
                </p>
                <p class="card-text">$300</p>
              </div>
              <div class="card-footer">
                <div class="def-number-input number-input safari_only">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 ">
            <div class="card mb-4 shadow-sm">
              <img class="card-img-top" src="images/burger.jpg" alt="Card image cap" width="300px" height="205px">
              <div class="card-body">
                <p class="card-text">
                <p class="text-primary">美味蟹堡<span class="badge badge-danger">激推</span></p>
                </p>
                <p class="card-text">$300</p>
              </div>
              <div class="card-footer">
                <div class="def-number-input number-input safari_only">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 ">
            <div class="card mb-4 shadow-sm">
              <img class="card-img-top" src="images/burger.jpg" alt="Card image cap" width="300px" height="205px">
              <div class="card-body">
                <p class="card-text">
                <p class="text-primary">美味蟹堡<span class="badge badge-danger">激推</span></p>
                </p>
                <p class="card-text">$300</p>
              </div>
              <div class="card-footer">
                <div class="def-number-input number-input safari_only">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 ">
            <div class="card mb-4 shadow-sm">
              <img class="card-img-top" src="images/burger.jpg" alt="Card image cap" width="300px" height="205px">
              <div class="card-body">
                <p class="card-text">
                <p class="text-primary">美味蟹堡<span class="badge badge-danger">激推</span></p>
                </p>
                <p class="card-text">$300</p>
              </div>
              <div class="card-footer">
                <div class="def-number-input number-input safari_only">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
              <img class="card-img-top" src="images/cola.jpg" alt="Card image cap" width="300px" height="205px">
              <div class="card-body">
                <p class="card-text">
                <p class="text-primary">美味蟹堡<span class="badge badge-danger">激推</span></p>
                </p>
                <p class="card-text">$300</p>
              </div>
              <div class="card-footer">
                <div class="def-number-input number-input safari_only">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
              <img class="card-img-top" src="images/cola.jpg" alt="Card image cap" width="300px" height="205px">
              <div class="card-body">
                <p class="card-text">
                <p class="text-primary">美味蟹堡<span class="badge badge-danger">激推</span></p>
                </p>
                <p class="card-text">$300</p>
              </div>
              <div class="card-footer">
                <div class="def-number-input number-input safari_only">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
              <img class="card-img-top" src="images/cola.jpg" alt="Card image cap" width="300px" height="205px">
              <div class="card-body">
                <p class="card-text">
                <p class="text-primary">美味蟹堡<span class="badge badge-danger">激推</span></p>
                </p>
                <p class="card-text">$300</p>
              </div>
              <div class="card-footer">
                <div class="def-number-input number-input safari_only">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4"></div>
          <div class="col-md-4">
            <nav aria-label="...">
              <ul class="pagination">
                <li class="page-item disabled">
                  <a class="page-link" href="#!" tabindex="-1">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#!">1</a></li>
                <li class="page-item active">
                  <a class="page-link" href="#!">2 <span class="sr-only">(current)</span></a>
                </li>
                <li class="page-item"><a class="page-link" href="#!">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#!">Next</a>
                </li>
              </ul>
            </nav>
          </div>

        </div>
      </div>
    </div>

</body>

</html>