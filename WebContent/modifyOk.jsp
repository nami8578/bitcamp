<<<<<<< HEAD
<%@ page import="com.javaEdu.ex.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" class="com.javaEdu.ex.MemberDto" scope="page"/>
<jsp:setProperty name="dto" property="*"/>

<%
	String id = (String) session.getAttribute("id");
	dto.setId(id);
	MemberDao dao = MemberDao.getInstance();
	int ri = dao.updateMember(dto);
	
	if(ri == 1){
%>
	<script language="javascript">
		alert("정보수정 되었습니다.");
		document.location.href="main.jsp";
	</script>
<%
	} else{
%>
	<script language="javascript">
		alert("정보수정 실패 입니다.");
		history.go(-1);
	</script>
<%
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 정보 업데이드</title>
=======
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
>>>>>>> refs/remotes/origin/master
</head>
<body>

</body>
</html>