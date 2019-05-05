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
		
		var password = document.forms[0].password.value;<%--변수선언합니다--%>
		
		if(title == null||title == "") {
			alert('제목을 입력하세요');
			document.forms[0].title.focus();
			return false;
		}
		
		if(writer == null || writer== "") {
			alert('작성자을 입력하세요');
			document.forms[0].writer.focus();
			return false;
		}
		
		if(email == null || email == "") {
			alert('이메일을 입력하세요');
			document.forms[0].email.focus();
			return false;
		}
					
		if(contents == null||contents == "" ) {
			alert('내용을 입력하세요');
			document.forms[0].content.focus();
			return false;
		}
		
		
		if(password == null || password == "") {
			alert('패스워드을 입력하세요');
			document.forms[0].password.focus();
			return false;
		}
	}

	</script>
</head>
<body>
	<h1>게시판</h1>
	<form action="insert.jsp" method="post" onsubmit=" return formCheck();">
		<p>제목 : <input type="text" name="title"></p>
		<p>작성자 : <input type="text" name="writer"></p>
		<p>E-mail : <input type="email" name="email"></p>
		<p>내용 :<br>&nbsp;  <textarea rows="20" cols="20" name="contents"></textarea></p>
		<p>패스워드 : <input type="password" name="password">(게시물 수정 및 삭제시 필요!)</p>
	<input type="submit" value="등록하기">
	</form>
</body>
</html>