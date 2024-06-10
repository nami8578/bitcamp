<<<<<<< HEAD
<%@ page import="com.javaEdu.ex.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<%
	String id = (String) session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getMember(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 정보 수정</title>
<script language="JavaScript" src="members.js"></script>
</head>
<body>
	<form action="modifyOk.jsp" method="post" name="reg_frm">
		아이디:<%=dto.getId()%><br/>
		비밀번호:<input type="password" name="pw" size="20"><br/>
		비밀번호 확인:<input type="password" name="pw_check" size="20"><br/>
		이름:<%=dto.getName() %><br/>
		메일:<input type="text" name="eMail" size="20" value=<%=dto.geteMail() %>><br/>
		주소:<input type="text" name="address" size="20" value=<%=dto.getAddress() %>><br/>
		<input type="button" value="수정" onClick="updateInfoConfirm()"> &nbsp;&nbsp;&nbsp;
		<input type="reset" value="취소" onClick="javascript:window.location='login.jsp'">
	</form>
=======
<%@page import="login.MemberDto" %>
<%@page import="login.MemberDao" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%
String id=(String)session.getAttribute("id");
MemberDao dao=MemberDao.getInstance();
MemberDto dto=dao.getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Conrenr-Type" content="text/html;charset=utf-8">
<title>Insert title here</title>
<script language="JavaScript"src="members.js"></script>
</head>
<body>
<form action="modifyOk.jsp"method="post"name="reg_frm">
아이디:<%=dto.getId() %><br/>
비밀번호: <input type="password" name="pw" size="20"><br/>
비밀번호 확인: <input type="password" name="pw_check" size="20"><br/>
이름: <%=dto.getName() %><br/>
메일: <input type="text" name="email" size="20" value="<%=dto.getEmail()%>"><br/>
주소: <input type="text" name="address" size="50"value="<%=dto.getAddress() %>"><br/>
<input type="button"value="수정"onclick="updateInfoConfirm()">&ndsp;&ndsp;&ndsp;
<input type="reset"value="취소"onclick="javascript:window.location='login.jsp'">

</form>
>>>>>>> refs/remotes/origin/master

</body>
</html>