<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>index</title>
    <link rel="stylesheet" href="<c:url value='/member/css/base-style.css'/>">
    <link rel="stylesheet" href="<c:url value='/member/css/main.css'/>">
    <script src="<c:url value='/member/js/mainImages.js'/>"></script>
    <script src="<c:url value='/member/js/member.js'/>"></script>
</head>
<body>
    <header>
        <div class="logo">
            <a class="lg" href="/">Board</a>
        </div>
        <nav>
            <ul>
                <li class="dropdown">
                    <a href="#" onclick="showAddressBookAlert()">Posts</a>
                    <ul class="dropdown-content">
                        <li><a href="#" onclick="showAddressBookAlert()">게시글 작성</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" onclick="showAddressBookAlert()">Address</a>
                    <ul class="dropdown-content">
                        <li><a href="#" onclick="showAddressBookAlert()">연락처 등록</a></li>
                        <li><a href="#" onclick="showAddressBookAlert()">연락처 목록</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" onclick="showAddressBookAlert()">My Page</a>
                    <ul class="dropdown-content">
                        <li><a href="#" onclick="showAddressBookAlert()">내가 쓴 글</a></li>
                        <li><a href="#" onclick="showAddressBookAlert()">내 정보 수정</a></li>
                    </ul>
                </li>
                <li><a href="/member/memberLogin">Sign In</a></li>
            </ul>
        </nav>
    </header>
    
     <main>

        <div class="prev-button"><img src="<c:url value='/member/images/이전이전.png'/>"></div>
        
        <div class="container">
            <div class="carousel">
                <div class="cell"><a href="#"><img src="<c:url value='/member/images/개3.jpg'/>" alt="게시판" /></a></div>
                <div class="cell"><a href="#"><img src="<c:url value='/member/images/다른개.jpg'/>" alt="마이페이지" /></a></div>
                <div class="cell"><a href="#"><img src="<c:url value='/member/mages/개.jpg'/>" alt="login" /></a></div>
            </div>            
        </div>
        
        <div class="next-button"><img src="<c:url value='/member/images/다음다음.png'/>"></div>

    </main>
</body>
</html>
