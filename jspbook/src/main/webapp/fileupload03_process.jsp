<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*, java.util.*, jakarta.servlet.http.*" %>

<%
//1.저장 경로 설정 및 폴더 생성
String savePath = "C:\\upload";
File uploadDir = new File(savePath);
if(!uploadDir.exists()) uploadDir.mkdir();

//2.모든 파라미터 이름 출력
Enumeration<String> params = request.getParameterNames();
while(params.hasMoreElements()){
    String pName = params.nextElement();
    String pValue = request.getParameter(pName);
    out.println(pName + "=" + pValue + "<br>");
}
out.println("-----------------------------------------------<br>");

//3.특정 파라미터 값 읽기
String name1 = request.getParameter("name");
String subject1 = request.getParameter("subject");

String name2 = request.getParameter("name2");
String subject2 = request.getParameter("subject2");

String name3 = request.getParameter("name3");
String subject3 = request.getParameter("subject3");

//4.파일 처리 및 출력
// 파일 1처리
Part part1 = request.getPart("file1");
String filename1 = (part1 != null) ? part1.getSubmittedFileName() : "";
if(!filename1.isEmpty()) part1.write(savePath + File.separator +filename1);
out.println("작성자1 : " + name1 + ", 제목1 : " + subject1 + ", 업로드 된 파일명1 : "+ filename1 + "<br>");

// 파일 2처리
Part part2 = request.getPart("file2");
String filename2 = (part2 != null) ? part2.getSubmittedFileName() : "";
if(!filename2.isEmpty()) part2.write(savePath + File.separator +filename2);
out.println("작성자2 : " + name2 + ", 제목2 : " + subject2 + ", 업로드 된 파일명2 : "+ filename2 + "<br>");

// 파일 3처리
Part part3 = request.getPart("file3");
String filename3 = (part3 != null) ? part3.getSubmittedFileName() : "";
if(!filename3.isEmpty()) part3.write(savePath + File.separator +filename3);
out.println("작성자3 : " + name3 + ", 제목3 : " + subject3 + ", 업로드 된 파일명3 : "+ filename3 + "<br>");
%>