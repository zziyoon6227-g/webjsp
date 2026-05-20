<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.net.URLEncoder" %>

<%
    request.setCharacterEncoding("UTF-8");

    String cartId = request.getParameter("cartId");

    Cookie cartIdCookie = new Cookie("Shipping_cartId", URLEncoder.encode(cartId, "utf-8"));
    Cookie nameCookie = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
    Cookie shippingDateCookie = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
    Cookie countryCookie = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "utf-8"));
    Cookie zipCodeCookie = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
    Cookie addressNameCookie = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));

    cartIdCookie.setMaxAge(24 * 60 * 60);
    nameCookie.setMaxAge(24 * 60 * 60);
    shippingDateCookie.setMaxAge(24 * 60 * 60);
    countryCookie.setMaxAge(24 * 60 * 60);
    zipCodeCookie.setMaxAge(24 * 60 * 60);
    addressNameCookie.setMaxAge(24 * 60 * 60);

    response.addCookie(cartIdCookie);
    response.addCookie(nameCookie);
    response.addCookie(shippingDateCookie);
    response.addCookie(countryCookie);
    response.addCookie(zipCodeCookie);
    response.addCookie(addressNameCookie);

    response.sendRedirect("orderConfirmation.jsp");
%>