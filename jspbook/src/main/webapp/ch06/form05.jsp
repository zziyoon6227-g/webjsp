<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head>
<title>Form Processing</title>
</head>
<body>

<form action="form05_process.sjsp" name="member" method="post">
    <p> 취미 : 독서<input type="checkbox" name="hobby" value="독서" checked>
              운동<input type="checkbox" name="hobby" value="운동">
              영화<input type="checkbox" name="hobby" value="영화">
    <p> 
    <textarea name="comment" cols="30" rows="3" placeholder="가입 인사를 입력해주세요"></textarea>
</form>

</body>
</html>
