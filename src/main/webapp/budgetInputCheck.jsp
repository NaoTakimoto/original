<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Category"%>
<%@ page import="dto.Budget"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>目標額確認画面</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>

	<div id="wrapper">
	<div class="left-column">

		<br><br>
		<form action="LoginServlet" method="post" style="display: inline">
			<span class="submit3"><input type="submit" name="logout" value="ログアウト"></span>
		</form>
		<br><br><br>
		<a href ="input.jsp">実績額入力</a><br>
		<a href ="performanceSearch.jsp">実績額検索</a><br>
		<a href ="budgetInput.jsp">目標額入力</a><br>
		<a href ="budgetSearch.jsp">目標額と実績額の比較</a><br>

	</div>



	<div class="right-column">

		<h2>目標額の確認</h2><br>

<%
		String date = (String)request.getAttribute("date");

		if(date != null){

			StringBuilder sb = new StringBuilder();
			sb.append(date);
			sb.insert(4,"年");
			sb.insert(7,"月");
%>

		<%=sb %>
		<br><br>

		<table border="1">
			<tr><th>カテゴリー</th><th>金額</th></tr>

<%
		ArrayList bList = (ArrayList)session.getAttribute("bList");


		for (Object bDataList : bList) {

			Budget b = (Budget)bDataList;

			int categoryID = b.getCategoryID();
			int amount = b.getAmount();


			ArrayList categoryList = (ArrayList) session.getAttribute("categoryList");

			for (Object data :categoryList) {
				Category cData = (Category)data;

				if (cData.getCategoryID() == categoryID) {
					String categoryName = cData.getCategoryName();

%>

		<tr><td><%=categoryName%></td><td><%=amount%></td></tr>

<%
				}
			}
		}
%>
			</table><br>
			<table border="1">
				<tr><th>支出合計</th><td>${sums.eSum}円</td></tr>
				<tr><th>収入合計</th><td>${sums.iSum}円</td></tr>
				<tr><th>貯金額</th><td>${sums.sum}円</td></tr>
			</table><br>

		<h4 style="color: red">${msg}</h4><br>
		<a href= "budgetInput.jsp">戻る</a>　　


		<form action="BudgetInputServlet" method="post" style="display: inline">
<%
			if(request.getAttribute("msg") == null){
%>
				<span class="submit"><input type="submit" name="insert" value="登録"></span>
<%
			} else{
%>
				<span class="submit"><input type="submit" name="update" value="更新"></span>
<%
			}
%>
		</form>


<%

		} else {

%>
			<h4 style="color: red">${okMsg}</h4>
<%
			session.removeAttribute("bList");
		}
%>
	</div>
	</div>
</body>
</html>