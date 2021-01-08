<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />

<title>Display</title>
</head>
<body>


<h3>Select Product Table Result : ${fn:length(select)} row(s) selected</h3>

<c:if test="${not empty select}">
<table>
	<thead>
	<tr>
		<th>Cid</th>
		<th>Food</th>
		<th>Classes</th>
		<th>Price</th>
		<th>Picture</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${select}">
		<c:url var="link" value="/product.jsp">
			<c:param name="cid" value="${row.cid}" />
			<c:param name="food" value="${row.food}" />
			<c:param name="classes" value="${row.classes}" />
			<c:param name="price" value="${row.price}" />
			<c:param name="picture" value="${row.picture}" />
		</c:url>
	<tr>
		<td>${row.cid}</td>
		<td><a href="${link}">${row.food}</a></td>
		<td>${row.classes}</td>
		<td>${row.price}</td>
		<td>${row.picture}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>

<h3><a href="<c:url value="/product.jsp" />">Product Table</a></h3>
</body>
</html>