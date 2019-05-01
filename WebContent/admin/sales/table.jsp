<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/admin/static/css/barStyle.css"/>
<link rel="stylesheet" type="text/css" href="/admin/static/css/tableStyle.css"/>
<style>
#table {
	background-color: #4CAF50;
}
</style>
</head>
<%@ include file="/admin/inc/bar.jsp" %>
<body>
	<div>
		<h2>매출 관리</h2>
	</div>
	<div>
		<p class="total">총 매출액 : 100,000원</p>

		<form class="example" action="action_page.php">
			<input type="text" placeholder="Search.." name="search">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>

	<table>
		<tr>
			<th>상품 이름</th>
			<th>상품 가격</th>
			<th>판매 개수</th>
			<th>판매 총액</th>
		</tr>
		<%for(int i=0; i<5; i++){ %>
		<tr>
			<td>Jill</td>
			<td>Smith</td>
			<td>50</td>
			<td>50</td>
		</tr>
		<%} %>
		<tr>
			<td colspan="4">
				<%for(int i=1; i<=10; i++){ %> 
					[<%=i %>] 
				<%} %>
			</td>
		</tr>
	</table>
</body>
</html>
