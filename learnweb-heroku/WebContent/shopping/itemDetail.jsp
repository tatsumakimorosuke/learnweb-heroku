<%@page import="shopping.Item"%>
<%@page import="shopping.ItemDetailViewModel"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
* {
	box-sizing : border-box;
	padding : 0;
}

table {
	width : 75%;
	border-collapse : collapse;
}
thead tr {
	background-color : #80cfcf;
}
td {
	border-bottom : 1px solid #000000;
}
button {
	padding : 0.50rem 1.00rem;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<%
	ItemDetailViewModel vm = (ItemDetailViewModel)request.getAttribute(ItemDetailViewModel.class.getSimpleName());
	Item item = vm.itemDetail();
	%>
	<div><video src="../img/<%= item.getProductImg() %>"playsinline autoplay muted loop width="320" height="240"></video>
	<h2><%= item.getProductNm() %></h2>

	<div style="margin:1.0rem 0;"><%= item.getDescription() %></div>

	</div>
	<a href="items.jsp">Back</a>
</body>
</html>