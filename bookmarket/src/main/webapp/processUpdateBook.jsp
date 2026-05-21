<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, java.io.*, jakarta.servlet.http.Part" %>

<%
    request.setCharacterEncoding("utf-8");

    // ================================
    // 1. DB 연결
    // ================================
    Connection conn = null;
    PreparedStatement pstmt = null;

    Class.forName("oracle.jdbc.OracleDriver");

    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String password = "1234";

    conn = DriverManager.getConnection(url, user, password);

    // ================================
    // 2. 업로드 폴더
    // ================================
    String savePath = "C:\\upload";
    File uploadDir = new File(savePath);
    if (!uploadDir.exists()) uploadDir.mkdir();

    // ================================
    // 3. 일반 파라미터
    // ================================
    String bookId = request.getParameter("bookId");
    String name = request.getParameter("name");
    String unitPrice = request.getParameter("unitPrice");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    String releasedDate = request.getParameter("releasedDate");
    String description = request.getParameter("description");
    String category = request.getParameter("category");
    String unitsInStock = request.getParameter("unitsInStock");
    String condition = request.getParameter("condition");

    // ================================
    // 4. 파일 처리
    // ================================
    String fileName = null;

    for (Part part : request.getParts()) {
        if (part.getName().equals("bookImage") && part.getSize() > 0) {
            fileName = part.getSubmittedFileName();
            part.write(savePath + File.separator + fileName);
        }
    }

    // ================================
    // 5. 기존 파일 유지 처리
    // ================================
    if (fileName == null || fileName.equals("")) {
        String sqlFile = "SELECT b_fileName FROM book WHERE b_id=?";
        PreparedStatement ps = conn.prepareStatement(sqlFile);
        ps.setString(1, bookId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            fileName = rs.getString("b_fileName");
        }
        rs.close();
        ps.close();
    }

    // ================================
    // 6. UPDATE SQL
    // ================================
    String sql =
        "UPDATE book SET " +
        "b_name=?, " +
        "b_unitPrice=?, " +
        "b_author=?, " +
        "b_description=?, " +
        "b_publisher=?, " +
        "b_category=?, " +
        "b_unitsInStock=?, " +
        "b_releaseDate=?, " +
        "b_condition=?, " +
        "b_fileName=? " +
        "WHERE b_id=?";

    pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, name);
    pstmt.setInt(2, Integer.parseInt(unitPrice));
    pstmt.setString(3, author);
    pstmt.setString(4, description);
    pstmt.setString(5, publisher);
    pstmt.setString(6, category);
    pstmt.setInt(7, Integer.parseInt(unitsInStock));
    pstmt.setString(8, releasedDate);
    pstmt.setString(9, condition);
    pstmt.setString(10, fileName);
    pstmt.setString(11, bookId);

    pstmt.executeUpdate();

    response.sendRedirect("books.jsp");

    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
%>