<%@ page contentType="text/html; charset=utf-8" %>
<%-- [3주차] 선언문: 지금 보고 있는 메뉴에 active 클래스를 붙이는 메소드 --%>
<%!
    String menuClass(String menu, String active) {
        return menu.equals(active) ? "nav-link active" : "nav-link";
    }
%>
<%
    // [5주차] jsp:include의 jsp:param으로 받은 현재 메뉴
    String active = request.getParameter("active");
%>
<header class="pb-3 mb-4 border-bottom">
    <div class="d-flex flex-wrap align-items-center justify-content-between gap-2">
        <a href="./welcome.jsp" class="d-flex align-items-center text-dark text-decoration-none">
            <i class="bi bi-compass fs-3 me-2 text-primary" aria-hidden="true"></i>
            <span class="fs-4 fw-semibold">개발 입문 가이드</span>
        </a>
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="./welcome.jsp" class="<%= menuClass("home", active) %>"><i class="bi bi-house me-1" aria-hidden="true"></i>홈</a></li>
            <li class="nav-item"><a href="./guides.jsp" class="<%= menuClass("guides", active) %>"><i class="bi bi-grid me-1" aria-hidden="true"></i>학습 목록</a></li>
            <li class="nav-item"><a href="./roadmap.jsp" class="<%= menuClass("roadmap", active) %>"><i class="bi bi-signpost-split me-1" aria-hidden="true"></i>로드맵</a></li>
            <li class="nav-item"><a href="./about.jsp" class="<%= menuClass("about", active) %>"><i class="bi bi-info-circle me-1" aria-hidden="true"></i>소개</a></li>
        </ul>
    </div>
</header>
