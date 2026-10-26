<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Guide" %>
<%-- [5주차] useBean: 학습 카드 데이터를 가진 자바빈즈를 application 영역에서 찾거나 만듦 --%>
<jsp:useBean id="guideDAO" class="dao.GuideRepository" scope="application" />
<%-- [5주차] setProperty: 주소의 category 파라미터(guides.jsp?category=lang)를 자바빈즈에 저장 --%>
<jsp:useBean id="filter" class="dto.GuideParam" />
<jsp:setProperty name="filter" property="category" />
<%!
    // 선택한 분류 버튼만 진하게 표시
    String buttonClass(boolean selected) {
        return selected ? "btn btn-dark" : "btn btn-outline-dark";
    }
%>
<%
    ArrayList<Guide> listOfGuides = guideDAO.getGuidesByCategory(filter.getCategory());
    String current = filter.getCategory();
    boolean showAll = "전체".equals(filter.getCategoryName());
%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/bootstrap-icons.min.css" rel="stylesheet">
<title>학습 목록 - 개발 입문 가이드</title>
</head>
<body>
<div class="container py-4">
    <jsp:include page="menu.jsp">
        <jsp:param name="active" value="guides" />
    </jsp:include>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-3">
            <h1 class="display-5 fw-bold">학습 목록</h1>
            <%-- [5주차] getProperty: 자바빈즈에 저장한 분류를 이름으로 꺼내 출력 --%>
            <p class="col-md-8 fs-5 mb-0">분류 : <jsp:getProperty name="filter" property="categoryName" /> (<%= listOfGuides.size() %>개)</p>
        </div>
    </div>

    <div class="d-flex flex-wrap gap-2 mb-4">
        <a href="./guides.jsp" class="<%= buttonClass(showAll) %>"><i class="bi bi-grid me-1" aria-hidden="true"></i>전체</a>
        <a href="./guides.jsp?category=lang" class="<%= buttonClass("lang".equals(current)) %>"><i class="bi bi-code-slash me-1" aria-hidden="true"></i>프로그래밍 언어</a>
        <a href="./guides.jsp?category=web" class="<%= buttonClass("web".equals(current)) %>"><i class="bi bi-globe me-1" aria-hidden="true"></i>웹 개발</a>
        <a href="./guides.jsp?category=tool" class="<%= buttonClass("tool".equals(current)) %>"><i class="bi bi-tools me-1" aria-hidden="true"></i>개발 도구</a>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <%-- [3주차] 스크립틀릿 반복문 + [5주차] include 액션 태그와 param으로 카드를 반복 출력 --%>
        <%
            for (int i = 0; i < listOfGuides.size(); i++) {
                Guide guide = listOfGuides.get(i);
        %>
        <jsp:include page="card.jsp">
            <jsp:param name="id" value="<%= guide.getId() %>" />
        </jsp:include>
        <%
            }
        %>
    </div>

    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
