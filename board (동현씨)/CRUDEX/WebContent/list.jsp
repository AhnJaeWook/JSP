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
		
		rs = stmt.executeQuery(sql);//jdbc���� �ϱ����� �ڵ�
	
%>
<body>
	<h1>�Խ���</h1>        <!--HTML������ �� ������ ���� �κ��Դϴ�.  -->
	<table>              <!--������ �۾��� ǥ���ϴ� �±��Դϴ�.  -->
		<tr>             <!--ǥ ������ �����͸� ǥ���ϴ� �±��Դϴ�.  -->
			<td>����</td> <!--Table Header�� ���ڷ� table�±� ������.  -->
			<td>��¥</td> <!--�����ϰ���� �÷��� ��Ÿ���� ���¸��Դϴ�.  -->
			<td>�̸�</td> 
			<td>���̵�</td>
			<td>��ȸ��</td>
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
	<a href="write.jsp">�۾���</a>
	<a href="redirect.jsp">�����ϱ�</a>
<%
	} catch (Exception e) {
		out.println("Oracle Database Connection Something Problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>