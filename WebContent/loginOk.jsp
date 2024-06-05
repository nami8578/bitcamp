<%@ page import="login.MemberDto"%>
<%@ page import="login.MemberDao"%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8"); 

String id=request.getParameter("id");
String pw=request.getParameter("pw");

MemberDao dao=MemberDao.getInstance();
int checkNum=dao.userCheck(id,pw);
if(checkNum==-1){

%>

<script language="javascript">
alert("아이디가 존재하지 않습니다.");
history.go(-1);
</script>
<%} %>



<%--<%
	}else{
		String name=dto.getName();
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("ValidMem", "yes");
		response.sendRedirect("main.jsp");
	}


%>--%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Conrenr-Type" content="text/html;charset=utf-8">
<title>loginOK</title>
</head>
<body>

</body>
</html>