<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 쇼핑몰 메인</title>
<style>
    table { width: 60%; border-collapse: collapse; background-color: #ffffff; }
    th, td { border: 1px solid #dddddd; padding: 8px; text-align: left; }
    th { background-color: #f2f2f2; }
</style>
</head>
<body>
    <h2>도서 쇼핑몰 시스템</h2>
    <hr>

    <%
        // 1. 카카오 로그인 세션 체크
        String userId = (String) session.getAttribute("userId");
        String userNickname = (String) session.getAttribute("userNickname");

        // // [조건 1] 로그인에 성공한 상태일 때
        if (userId != null) {
    %>
        <p style="color: green;"><b><%= userNickname %></b>님(카카오 계정)이 인증되었습니다. <a href="logout.jsp">로그아웃</a></p>
        
        <p>쇼핑몰 메인 서비스에 오신 것을 환영합니다!</p>
    <%
        } else {
    %>
        <p>로그인이 필요한 서비스입니다.</p>
        <a href="login.jsp">로그인 하러 가기</a>
    <%
        }
    %>
</body>
</html>