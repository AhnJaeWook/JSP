<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html" charset="EUC-KR">
<title>게시판 내용을 보자용 </title>


</head>

<%
	String idx = request.getParameter("idx");

try{
    String driverName = "oracle.jdbc.driver.OracleDriver"; 
    
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
	ResultSet rs = null;

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, "root", "root");
	out.println("Oracle DataBase Connection Success.");
	
	Statement stmt = con.createStatement();
	String sql = "SELECT * from board where idx = " + idx;
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
	
%>
<body>
	<h1>게시글 조회</h1>
	<table border ="1">
		<tr>
			<th>번호</th>
			<td><%=rs.getString("idx") %></td>
			<th>작성자</th>
			<td><%=rs.getString("writer") %> </td>
			<th>날짜</th> 
			<td><%=rs.getString("regdate") %></td>
			<th>조회수</th>
			<td><%=rs.getString("count") %></td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6"><%=rs.getString("title") %></td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6"><%=rs.getString("content") %></td>
		</tr>
	</table>
	<a href = "delete.jsp?idx=<%=rs.getString("idx") %>">게시글 삭제</a>
	<a href = "modify_write.jsp?idx=<%=rs.getString("idx") %>">게시글 수정</a>
	<a href = "list.jsp">목록으로 </a>

<%	
	}
	con.close();
}catch(Exception e){
	out.println("Oracle Database Connection Problem <hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>



</body>
</html>