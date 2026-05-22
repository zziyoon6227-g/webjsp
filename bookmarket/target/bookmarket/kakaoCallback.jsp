<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="com.google.gson.*" %>
<%
    String code = request.getParameter("code");

    if (code == null || code.trim().equals("")) {
        response.sendRedirect("kakaologin.jsp?error=no_code");
        return;
    }

    String accessToken = "";
    String tokenURL = "https://kauth.kakao.com/oauth/token";

    // 1. 토큰 발급 요청
    try {
        URL url = new URL(tokenURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        sb.append("grant_type=authorization_code");
        sb.append("&client_id=key");
        sb.append("&redirect_uri=http://localhost:8080/demo/kakaoCallback.jsp");
        sb.append("&code=").append(code);

        bw.write(sb.toString());
        bw.flush();
        bw.close();

        if (conn.getResponseCode() == 200) {
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String line;
            StringBuilder result = new StringBuilder();
            while ((line = br.readLine()) != null) {
                result.append(line);
            }
            br.close();

            JsonElement element = JsonParser.parseString(result.toString());
            accessToken = element.getAsJsonObject().get("access_token").getAsString();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    // 2. 유저 정보 요청
    if (accessToken != null && !accessToken.equals("")) {
        String userURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(userURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            if (conn.getResponseCode() == 200) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
                String line;
                StringBuilder result = new StringBuilder();
                while ((line = br.readLine()) != null) {
                    result.append(line);
                }
                br.close();

                JsonElement element = JsonParser.parseString(result.toString());
                JsonObject userInfo = element.getAsJsonObject();

                String id = userInfo.get("id").getAsString();
                JsonObject properties = userInfo.getAsJsonObject("properties");
                String nickname = properties.get("nickname").getAsString();

                // 세션 세팅
                session.setAttribute("userId", id);
                session.setAttribute("userNickname", nickname);

                response.sendRedirect("index.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    response.sendRedirect("kakaologin.jsp?error=login_failed");
%>