<%@ page contentType="text/html; charset=utf-8" %>
<%-- [4주차] isErrorPage: 오류 페이지로 지정해서 exception 내장 객체를 사용 --%>
<%@ page isErrorPage="true" %>
<%!
    // 주소에 들어온 값이 메시지에 섞여 있을 수 있어서 HTML 특수 문자를 바꿔서 출력
    String escapeHtml(String text) {
        if (text == null) {
            return "";
        }
        return text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }
%>
<%
    String message = "알 수 없는 오류가 발생했어요.";
    if (exception != null && exception.getMessage() != null) {
        message = exception.getMessage();
    }
%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/bootstrap-icons.min.css" rel="stylesheet">
<title>오류 - 개발 입문 가이드</title>
</head>
<body>
<div class="container py-4">
    <jsp:include page="menu.jsp" />

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-3">
            <i class="bi bi-exclamation-circle display-4 text-warning" aria-hidden="true"></i>
            <h1 class="display-6 fw-bold mt-3">페이지를 보여 줄 수 없어요</h1>
            <p class="fs-5 mb-0"><%= escapeHtml(message) %></p>
        </div>
    </div>

    <a href="./guides.jsp" class="btn btn-primary"><i class="bi bi-grid me-1" aria-hidden="true"></i>학습 목록으로</a>
    <a href="./welcome.jsp" class="btn btn-outline-secondary"><i class="bi bi-house me-1" aria-hidden="true"></i>홈으로</a>

    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
