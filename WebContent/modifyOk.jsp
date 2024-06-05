<%@page import="login.MemberDto"%>
<%@page import="login.MemberDao"%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<%request.setCharacterEncoding("utf-8"); %>

<jsp:uesBean id="dto" class="com.javaEdu.ex.MemberDto" scope="page"/>
<jsp:setProperty name="dto" property="*"/>
<%

MemberDto dto=new MemberDto();
String id=(String)session.getAttribute("id");
dto.setId(id);

MemberDao dao=MemberDao.getInstance();
int ri=dao.updateMember(dto);

if(ri==1){
%>
<script language="javascript">
alert("정보수정되었습니다.");
document.location.href="main.jsp";
</script>
<%
}else{
%>
<script language="javascript">
alert("실패입니다.");
history.go(-1);
</script>
<%} %>
<!DOCTYPE html public"-//w3c//dtdhtml 4.01 Transitional//en""http://www.w3.org/TR/html4/loose/dtd">
<html>
<head>
<meta http-equiv="Conrenr-Type" content="text/html;charset=utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>