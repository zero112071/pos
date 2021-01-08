<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="" />

<title>Product</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
}
</script>
</head>
<body>

	<h3>Welcome ${user.name}</h3>

	<h3>Product Table</h3>

	<form action="<c:url value="/Login_v3/Menu.controller" />">
		<table>
			<tr>
				<td>Cid :</td>
				<td><input type="text" name="cid" value="${param.cid}"
					onblur="doBlur()"></td>
				<td>${errors.id}</td>
			</tr>
			<tr>
				<td>Food :</td>
				<td><input type="text" name="food" value="${param.food}"
					onblur="doBlur()"></td>
				<td></td>
			</tr>

			<tr>
				<td>Classes :</td>
				<td><input type="text" name="classes" value="${param.classes}"
					onblur="doBlur()"></td>
				<td>${errors.price}</td>
			</tr>
			<tr>
				<td>Price :</td>
				<td><input type="text" name="price" value="${param.price}"></td>
				<td>${errors.make}</td>
			</tr>
			<tr>
				<td>Picture :</td>
				<td><input type="text" name="picture" value="${param.picture}"></td>
				<td>${errors.expire}</td>
			</tr>
			<tr>
				<td><input type="submit" name="menuaction" value="Insert">
					<input type="submit" name="menuaction" value="Update"></td>
				<td><input type="submit" name="menuaction" value="Delete">
					<input type="submit" name="menuaction" value="Select"> <input
					type="button" value="Clear" onclick="clearForm()"></td>
			</tr>
		</table>

	</form>


	<h3>
		<span class="error">${errors.action}</span>
	</h3>

	<c:if test="${not empty delete}">
		<h3>Delete Product Table Success : ${delete} row deleted</h3>
		<script type="text/javascript">clearForm();</script>
	</c:if>

	<c:if test="${not empty insert}">
		<h3>Insert Product Table Success</h3>
		<table border="1">
			<tr>
				<td>Id</td>
				<td>${insert.id}</td>
			</tr>
			<tr>
				<td>Name</td>
				<td>${insert.name}</td>
			</tr>
			<tr>
				<td>Price</td>
				<td>${insert.price}</td>
			</tr>
			<tr>
				<td>Make</td>
				<td>${insert.make}</td>
			</tr>
			<tr>
				<td>Expire</td>
				<td>${insert.expire}</td>
			</tr>
		</table>
		<script type="text/javascript">clearForm();</script>
	</c:if>

	<c:if test="${not empty update}">
		<h3>Update Product Table Success</h3>
		<table border="1">
			<tr>
				<td>Id</td>
				<td>${update.id}</td>
			</tr>
			<tr>
				<td>Name</td>
				<td>${update.name}</td>
			</tr>
			<tr>
				<td>Price</td>
				<td>${update.price}</td>
			</tr>
			<tr>
				<td>Make</td>
				<td>${update.make}</td>
			</tr>
			<tr>
				<td>Expire</td>
				<td>${update.expire}</td>
			</tr>
		</table>
		<script type="text/javascript">clearForm();</script>
	</c:if>

</body>
</html>