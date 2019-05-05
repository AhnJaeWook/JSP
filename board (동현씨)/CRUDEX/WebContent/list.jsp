<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	try{
		String driverName="oracle.jdbc.driver.OracleDriver";
		String url= "jdbc:oracle:thin:@localhost:1521:XE";
		
		ResultSet rs =null;
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url,"board","board");
		out.println("Oracle Database Connect Success.");
		
		Statement stmt = con.createStatement();
		String sql = "select * from board order by idx desc";
		
		rs = stmt.executeQuery(sql);//jdbc접속 하기위한 코드
	
%>
<body>
	<h1>게시판</h1>        <!--HTML문서의 주 내용이 들어가는 부분입니다.  -->
	<table>              <!--헤드라인 글씨를 표현하는 태그입니다.  -->
		<tr>             <!--표 형식의 데이터를 표현하는 태그입니다.  -->
			<td>제목</td> <!--Table Header의 약자로 table태그 내에서.  -->
			<td>날짜</td> <!--강조하고싶은 컬럼을 나타낼때 쓰는말입니다.  -->
			<td>이름</td> 
			<td>아이디</td>
			<td>조회수</td>
		</tr>

<%
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>" + rs.getString("idx") + "</td>");
		out.print("<td> <a href='content.jsp?idx="+rs.getString("idx")+"'>"  +rs.getString("title") + "</a></td>");
		out.print("<td>" + rs.getString("writer") + "</td>");
		out.print("<td>" + rs.getString("regdate") + "</td>");
		out.print("<td>" + rs.getString("count") + "</td>");
		out.print("</tr>");
	}
%>		
	</table>	
	<a href="write.jsp">글쓰기</a>
	<a href="redirect.jsp">삭제하기</a>
<%
	} catch (Exception e) {
		out.println("Oracle Database Connection Something Problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>