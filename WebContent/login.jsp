<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem")!=null){ %>
	<jsp:forward page="main.jsp"></jsp:forward> 
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="loginOk.jsp" method="post">
		아이디: <input type="text" name="id" value="<%if(session.getAttribute("id")!=null) out.println(session.getAttribute("id")); %>"><br/>
		비밀번호: <input type="text" name="pw"><br/>
		<input type="submit" value="로그인"> &nbsp;&nbsp;
		<input type="button" value="회원가입" Onclick="javascript:window.location='join.jsp'">
	</form>
=======
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% if(session.getAttribute("ValidMem")!=null){%>    
	<jsp:forward page="main.jsp"></jsp:forward>
<%}%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Conrenr-Type" content="text/html;charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="joinOk.jsp" method="post" >
아이디: <input type="text" name="id" value="<% if(session.getAttribute("id")!=null)out.println(session.getAttribute("id"));%>"><br/>
비밀번호: <input type="password" name="pw"><br/>
<input type="submit" value="로그인">&nbsp;&nbsp;
<input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'">
</form>
>>>>>>> refs/remotes/origin/master
</body>
</html>