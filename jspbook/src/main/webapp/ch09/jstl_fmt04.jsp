01 <%@ page contentType="text/html; charset=utf-8" %>
02 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
03 <html>
04 <head>
05 <title>Internationalization</title>
06 </head>
07 <body>
08     <jsp:useBean id="now" class="java.util.Date" />
09     <p> 한국 : <fmt:formatDate value="${now}" type="both" dateStyle="full" 
          timeStyle="full" />
10     <p> <fmt:timeZone value="America/New_York">
11         뉴욕 : <fmt:formatDate value="${ now }" type="both" dateStyle="full" 
          timeStyle="full" />
12     </fmt:timeZone>
13     <p> <fmt:timeZone value="Europe/London">
14         런던 : <fmt:formatDate value="${ now }" type="both" dateStyle="full" 
          timeStyle="full" />
15     </fmt:timeZone>
16 </body>
17 </html>