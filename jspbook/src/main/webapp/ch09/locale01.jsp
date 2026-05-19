<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>Internationalization</title>
</head>

<body>

<h3>현재 로케일의 국가, 날짜, 통화</h3>

<%
    // 현재 사용자의 로케일 정보 가져오기
    Locale locale = request.getLocale();

    // 현재 날짜
    Date currentDate = new Date();

    // 날짜 형식
    DateFormat dateFormat =
        DateFormat.getDateInstance(DateFormat.FULL, locale);

    // 숫자 형식
    NumberFormat numberFormat =
        NumberFormat.getNumberInstance(locale);

    // 통화 형식
    NumberFormat currencyFormat =
        NumberFormat.getCurrencyInstance(locale);
%>

<p>국가 : <%= locale.getDisplayCountry() %></p>
<p>날짜 : <%= dateFormat.format(currentDate) %></p>
<p>숫자 (12345.67) : <%= numberFormat.format(12345.67) %></p>


</p>

</body>
</html>