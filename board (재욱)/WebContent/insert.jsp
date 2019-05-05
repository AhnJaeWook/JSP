<%@ page import = "java.sql.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<%
	request.setCharacterEncoding("euc-kr");

	int idx = 1;
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String regdate = request.getParameter("regdate");
	String content = request.getParameter("content");
	int count = 9999;
	
	if(title == "" || title == null)out.println("title�� null�Դϴ�.");
	
	if(writer == "" || writer == null)
		out.println("writer�� null�Դϴ�.");
	
	else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
		out.println("�̸��� ������ �ƴմϴ�.");
	
	if(regdate == "" || regdate == null)
		out.println("regdate�� null�Դϴ�.");
	else if(!Pattern.matches("^[0-9]*$", regdate))
		out.println("���������� �ƴմϴ�.");
	
	if(content == "" || content == null) out.println("content�� null�Դϴ�.");
	
	try{
		String driverName = "oracle.jdbc.driver.OracleDriver"; //�����ͺ��̽��� �����ϱ����� ����̹��� �ε��մϴ�.
		String url = "jdbc:oracle:thin:@localhost:1521:XE"; //���� URL������ ��Ʈ��ȣ(oracle��Ʈ), sid(oracle����)
		
		Class.forName(driverName);
		
		Connection con = DriverManager.getConnection(url, "board", "board"); //getCo... : �������� url, id, pw
		
		out.println("Oracle �����ͺ��̽� db�� ���������� �����߽��ϴ�.");
		
		Statement stmt = con.createStatement();
		
		String sql = "INSERT INTO BOARD" + 
						"(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT)" + 
						"VALUES(board_seq.nextval, '"+title+"', '"+writer+"', '"+regdate+"', '1', 'adfsd')"; 
		
		stmt.executeUpdate(sql);
		
		
		con.close();
	}catch(Exception e){
		out.println("Oracle �����ͺ��̽� db ���ӿ� ������ �ֽ��ϴ�.<hr>");
		
		out.println(e.getMessage());
		
		e.printStackTrace();
	}finally{
		out.print("<script>location.href='list_.jsp';</script>");
	}
	
%>

</head>
<body>

</body>
</html>