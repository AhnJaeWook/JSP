<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	try {
		String driverName = "ocacle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		ResultSet rs = null;
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "board", "board");
		out.println("Oracle Database Connection Success.");
		Statement stmt = con.createStatement();
		String sql = "select * from board order by idx desc";
		rs = stmt.executeQuery(sql);
%>

<body>
	<h1>게시물 리스트</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
<%
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>" + rs.getString(1) + "</td");
			out.print("<td>" + rs.getString(2) + "</td");
			out.print("<td>" + rs.getString(3) + "</td");
			out.print("<td>" + rs.getString(4) + "</td");
			out.print("<td>" + rs.getString(5) + "</td");
			out.print("</tr>");
		}
%>
	</table>
	<a href="write.jsp">글쓰기</a>
<%
		con.close();
	}catch (Exception e){
	out.println("Oracle Database Connection Something Problem. <hr>");
	out.println(e.getMessage());
	e.printStackTrace();
	}
%>
</body>
</html>