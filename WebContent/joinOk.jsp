<%@ page import="java.sql.Timestamp"%>
<%@ page import="login.*"%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dto" class="login.MemberDto"/>
<jsp:setProperty name="dto" property="*"/>
<%
dto.setrDate(new Timestamp(System.currentTimeMillis()));
MemberDao dao=MemberDao.getInstance();
if(dao.confirmld(dto.getId())==MemberDao.MEMBER_EXISTENT){
%>
<script language="javascript">
alert("아이디가 이미 존재합니다.");
history.back();
</script>
<%
}else{
	int ri=dao.insertMember(dto);
	if(ri==MemberDao.MEMBER_JOIN_SUCCESS){
		session.setAttribute("id",dto.getId());
%>
	<script language="javascript">
	alert("회원가입을 축하합니다.");
	document.location.href="login.jsp";
	</script>
<%
	}else{
%>
	<script language="javascript">
	alert("회원가입에 실패했습니다.");
	document.location.href="login.jsp";
	</script>
<%
	}
}
%>	



<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>