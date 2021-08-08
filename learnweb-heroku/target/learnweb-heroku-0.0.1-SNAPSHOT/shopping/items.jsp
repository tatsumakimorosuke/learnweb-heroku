<%@ page import="java.util.List"%>
<%@ page import="shopping.Item"%>
<%@ page import="shopping.ItemsViewModel"%>
<%@ page import="shopping.ItemSummaryView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">


function selectCode(selectedCode) {
		document.getElementById('selectedCode').value = selectedCode
		document.itemSelect.submit();
	}

	</script>



<style type="text/css">
table {
	width: 65%;
	border-collapse: collapse;
}

thead tr {
	border-color: #80cfcf;
}

td {
	border-bottom: 1px solid #242424;
	line-height: 1.00rem;
}


</style>
<title>2st Dev Try</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<section class="features">
	<h2 title="to get hope.no matter what someone say">LIST</h2>
		<div class="container">
		<%
		ItemsViewModel vm = new ItemsViewModel();
		List<Item> items = vm.itemList();
		%>
		<form action="itemDetail" name="itemSelect" method="post">
			<table>
				<col width=15%>
				<col width=45%>
				<col width=25%>
				<col width=15%>
				<thead>
					<tr>
						<td>code</td>
						<td>name</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<!-- Loop Start -->
					<%
					for (Item item : items) {
					%>
					<tr>
						<td><%= item.getProductCd() %></td>
						<td><%= item.getProductNm() %></td>
						<td><button type="button" onclick="selectCode('<%= item.getProductCd() %>')">Details</button></td>
					</tr>
					<!-- Loop End -->
					<% } %>
				</tbody>
			</table>
			<input type="hidden" name="selectedCode" id="selectedCode">
		</form>
		<a href="https://twitter.com/DevGatherWay">MyLearningRecords</a>
	 </div>
</section>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	 <script type="text/javascript" src="js/main.js"></script>
</body>
</html>