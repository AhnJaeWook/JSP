<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html" charset="EUC-KR">
<title> </title>


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
	String sql = "DELETE from board where idx = " + idx;
	rs = stmt.executeQuery(sql);
	
	con.close();
%>
	<script>
		alert("삭제되었습니다.");
		location.href="redirect.jsp";
	</script>

<%
}catch(Exception e){
	// out.println("Oracle Database Connection Problem <hr>");
%>
		<script>
		alert("삭제가 안되었어요.");
		location.href("redirect.jsp");
		</script>
<% 
	out.println(e.getMessage());
	e.printStackTrace();
}
%>



</body>
</html>