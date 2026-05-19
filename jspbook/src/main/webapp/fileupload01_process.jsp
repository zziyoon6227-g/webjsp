<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*, java.util.*, jakarta.servlet.http.*" %>
<%
String savePath = "C:\\upload";
File uploadDir = new File(savePath);
if(!uploadDir.exists()) uploadDir.mkdir();

String title = request.getParameter("title");
out.println("제목: " + title + "<br>");

Collection<Part> parts = request.getParts();
for(Part part : parts){
    if(part.getContentType() !=null){
        String fileName = part.getSubmittedFileName();
        if(fileName != null && !fileName.isEmpty()){
            part.write(savePath + File.separator + fileName);
            out.println("파라미터명: " + part.getName() + "<br>");
            out.println("파일명: " + fileName + "<br>");
            out.println("크기: " + part.getSize() + "bytes<br>");
        }
    }
}
%>