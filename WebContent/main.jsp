<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 	if(session.getAttribute("ValidMem")==null){
%>
	<jsp:forward page="login.jsp"/>
<%
 	}
	
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
%>	

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
</head>
<body>
	<h1><%=name%>님 안녕하세요.</h1><br/>
	<form action="logout.jsp" method="post">
		<input type="submit" value="로그아웃"> &nbsp;&nbsp;&nbsp;
		<input type="button" value="정보수정" Onclick="javascript:window.location='modify.jsp'">
	</form>
=======
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% if(session.getAttribute("ValidMem")==null){ %>
<<jsp:forward page="login.jsp"/>
<%
}
String name=(String)session.getAttribute("name");
String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Conrenr-Type" content="text/html;charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<h1><%=name%>님 안녕하세요</h1><br/>
<form action="logout.jsp"method="post">
<input type="submit"value="로그아웃">&ndsp;&ndsp;&ndsp;<<input type="button"value="정보수정"onclick="javascript:window.location='modify.jsp'">
</form>

>>>>>>> refs/remotes/origin/master
</body>
</html>