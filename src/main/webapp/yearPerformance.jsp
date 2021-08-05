<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Performance"%>
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

		${date}年　　
		<br><br>

	<table border="1">
		<tr><th>カテゴリー</th><th>合計額</th></tr>

<%

		ArrayList pData = (ArrayList)request.getAttribute("pList");
		ArrayList categoryList = (ArrayList)session.getAttribute("categoryList");


		int categoryID = 0;
		String categoryName = null;
		int amountSum = 0;
		int eSumAmount =0;
		int iSumAmount =0;

		for (Object pDataList :pData) {

			Performance p = (Performance)pDataList;

			categoryID = p.getCategoryID();
			amountSum = p.getAmount();

			if(categoryID < 10){
				eSumAmount += amountSum;
			} else {
				iSumAmount += amountSum;
			}


			for (Object cDataList :categoryList) {
				Category cData = (Category)cDataList;

				if (cData.getCategoryID() == categoryID) {
					categoryName = cData.getCategoryName();
				}
			}

%>

		<tr><td><%=categoryName%></td><td><%=amountSum%></td></tr>

<%
		}
%>

	</table>
	<br>

<%
		if( request.getAttribute("categoryID").equals("hidden")){
%>
	<table border="1">
		<tr><th>支出合計</th><th>収入合計</th></tr>
		<tr><td><%=eSumAmount%>　円</td><td><%=iSumAmount%>　円</td></tr>
	</table>
<%
		}
%>
	<br><br>

		<a href ="performanceSearch.jsp">戻る</a>

	</div>
	</div>
</body>
</html>