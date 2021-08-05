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

<%

	String date = (String)request.getAttribute("date");

	StringBuilder sb = new StringBuilder();
	sb.append(date);
	sb.insert(4,"年");
	sb.insert(7,"月");
	sb.insert(10,"日");

%>

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

	<%=sb%>
	<br><br>

	<table border="1">
		<tr><th>カテゴリー</th><th>金額</th><th>変更・削除</th></tr>

<%

		ArrayList pList = (ArrayList)request.getAttribute("pList");
		ArrayList categoryList = (ArrayList)session.getAttribute("categoryList");


		int performanceID = 0;
		int categoryID = 0;
		String categoryName = null;
		int amount = 0;
		int eSumAmount =0;
		int iSumAmount =0;


		for (Object pData :pList) {

			Performance p = (Performance)pData;

			performanceID = p.getPerformanceID();
			categoryID = p.getCategoryID();
			amount = p.getAmount();

			if(categoryID < 10){
				eSumAmount += amount;
			} else {
				iSumAmount += amount;
			}



			for (Object cDataList :categoryList) {

				Category cData = (Category)cDataList;

				if (cData.getCategoryID() == categoryID) {
					categoryName = cData.getCategoryName();
				}
			}

%>

		<tr><td><%=categoryName%></td><td><%=amount%></td>
		<td>

		<form action="ChangeServlet" method="post">
			 <input type="hidden" name="performanceID" value="<%=performanceID%>">
			 <span class="submit2"><input type="submit" value="変更"></span>
		</form>
		<form action="DeleteServlet" method="post">
			 <input type="hidden" name="performanceID" value="<%=performanceID%>">
			 <span class="submit2"><input type="submit" value="削除"></span>
		</form>
		</td></tr>

<%
		}

 %>
		</table>
		<br>

<%
		if(request.getAttribute("categoryID").equals("hidden")){
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