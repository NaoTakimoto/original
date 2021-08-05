<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Performance"%>
<%@ page import="dto.Budget"%>
<%@ page import="dto.Category"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果画面</title>
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

		<h2>検索結果</h2>
		<br>

<%
		String date = (String)request.getAttribute("date");

		StringBuilder sb = new StringBuilder();
		sb.append(date);
		sb.insert(4,"年");
		sb.insert(7,"月");
%>

		<%=sb %>
		<br><br>

	<table border="1">
		<tr><th>カテゴリー</th><th>目標額</th><th>実績額</th></tr>

<%
		ArrayList pList = (ArrayList)request.getAttribute("pList");
		ArrayList bList = (ArrayList)request.getAttribute("bList");
		ArrayList categoryList = (ArrayList)session.getAttribute("categoryList");



		String categoryName = null;
		int pAmount = 0;
		int bAmount = 0;


		for (Object cDataList :categoryList) {
			Category cData = (Category)cDataList;
			categoryName = cData.getCategoryName();

			pAmount = 0;


				for (Object bDataList : bList) {
					Budget b = (Budget)bDataList;

					if (b.getCategoryID() == cData.getCategoryID()) {
						bAmount = b.getAmount();
					}
				}

				for (Object pDataList : pList) {
					Performance p = (Performance)pDataList;

					if (p.getCategoryID() == cData.getCategoryID()) {
						pAmount = p.getAmount();
					}
				}

%>
		<tr><td><%=categoryName%></td><td><%=bAmount%></td><td><%=pAmount%></td></tr>

<%
		}
%>
		</table>
			<br>
		<table border="1">
			<tr><th>目標額　合計</th><th>実績額　合計</th></tr>
			<tr><td>支出　${sums.beSum}円</td><td>支出　${sums.peSum}円</td></tr>
			<tr><td>収入　${sums.biSum}円</td><td>収入　${sums.piSum}円</td></tr>
			<tr><td>貯金額　${sums.bSum}円</td><td>貯金額　${sums.pSum}円</td></tr>
		</table>
			<br>

		<h4 style="color: red">${categoryName}${msg}</h4>
		<br>

		<a href= "budgetSearch.jsp">戻る</a>

	</div>
	</div>
</body>
</html>