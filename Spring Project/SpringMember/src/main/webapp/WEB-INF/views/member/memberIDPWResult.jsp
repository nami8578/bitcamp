<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID / PW 찾기 결과</title>
<link rel="stylesheet" href="/member/css/base-style.css">
<link rel="stylesheet" href="/member/css/memberResult.css">
<script type="text/javascript" src="//member/js/member.js"></script>
</head>
<body>
	<c:choose>
        <c:when test="${sessionScope.isLoggedIn == true}">
            <jsp:include page="/WEB-INF/views/member/headerOUT.jsp" flush="true"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/views/member/headerIN.jsp" flush="true"/>
        </c:otherwise>
    </c:choose>

    <div class="container">
      <c:choose>
        <c:when test="${sessionScope.isLoggedIn == true}">
            <jsp:include page="/WEB-INF/views/member/side.jsp" flush="true"/>
        </c:when>
       </c:choose>

		    
        <div class="content">
            <div class="title">
            </div>
            <div class="feild">
           <%-- <!-- <%@ request.getAttribute("result") %> -->  --%>
               <p>${requestScope.result} </p>
            </div>
            <div class="reg-btnn">
            <input type="button" class="btn" value="확인" onclick="window.close()">
            </div>
        </div>  
    </div>
    <jsp:include page="/WEB-INF/views/member/footer.jsp" flush="true"/>
</body>
</html>