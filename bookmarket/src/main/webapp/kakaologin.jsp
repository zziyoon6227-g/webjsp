<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인</title>
</head>
<body>
    <h2>도서 쇼핑몰 로그인 (Pure JSP)</h2>
    <hr>

    <%
        // 카카오 앱 정보 설정
        String clientId = "5e1d7a36e2210af8f7bfc0e31f09ed6e";
        String redirectUri = "http://localhost:8080/restapiex/index.jsp"; // 변경된 리다이렉트 주소

        // 카카오 인증 URL 생성
        String kakaoAuthUrl = "https://kauth.kakao.com/oauth/authorize"
                            + "?client_id=" + clientId
                            + "&redirect_uri=" + redirectUri
                            + "&response_type=code";
    %>

    <a href="<%= kakaoAuthUrl %>">
        <img src="https://developers.kakao.com/tool/resource/static/img/button/login/kakao_login_medium_narrow.png" alt="카카오 로그인 버튼" />
    </a>

</body>
</html>