<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>Action Tag</title>
</head>
<body>

<h3>이 파일은 first3.jsp입니다. </h3>
<jsp:include page="second2.jsp">
<jsp:param name = "date" value="<%=new java.util.Date() %>" />
</jsp:include>
<p>Jakarta Server Page</p>

</body>
</html>
