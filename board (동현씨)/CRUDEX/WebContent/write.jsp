<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script>
	alert("test")
	function formCheck() {
		var title = document.forms[0].title.value;
		
		var writer = document.forms[0].writer.value;
		
		var email = document.forms[0].email.value;
		
		var contents = document.forms[0].contents.value;
		
		var password = document.forms[0].password.value;<%--���������մϴ�--%>
		
		if(title == null||title == "") {
			alert('������ �Է��ϼ���');
			document.forms[0].title.focus();
			return false;
		}
		
		if(writer == null || writer== "") {
			alert('�ۼ����� �Է��ϼ���');
			document.forms[0].writer.focus();
			return false;
		}
		
		if(email == null || email == "") {
			alert('�̸����� �Է��ϼ���');
			document.forms[0].email.focus();
			return false;
		}
					
		if(contents == null||contents == "" ) {
			alert('������ �Է��ϼ���');
			document.forms[0].content.focus();
			return false;
		}
		
		
		if(password == null || password == "") {
			alert('�н������� �Է��ϼ���');
			document.forms[0].password.focus();
			return false;
		}
	}

	</script>
</head>
<body>
	<h1>�Խ���</h1>
	<form action="insert.jsp" method="post" onsubmit=" return formCheck();">
		<p>���� : <input type="text" name="title"></p>
		<p>�ۼ��� : <input type="text" name="writer"></p>
		<p>E-mail : <input type="email" name="email"></p>
		<p>���� :<br>&nbsp;  <textarea rows="20" cols="20" name="contents"></textarea></p>
		<p>�н����� : <input type="password" name="password">(�Խù� ���� �� ������ �ʿ�!)</p>
	<input type="submit" value="����ϱ�">
	</form>
</body>
</html>