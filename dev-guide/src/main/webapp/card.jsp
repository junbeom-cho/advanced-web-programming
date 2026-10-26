<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Guide" %>
<%-- [5주차] useBean: application 영역에 이미 있는 guideDAO를 찾아서 같이 씀 --%>
<jsp:useBean id="guideDAO" class="dao.GuideRepository" scope="application" />
<%
    // [5주차] jsp:param으로 넘어온 학습 카드 ID
    Guide guide = guideDAO.getGuideById(request.getParameter("id"));
    if (guide != null) {
%>
<div class="col">
    <div class="card h-100 shadow-sm">
        <div class="card-body">
            <div class="d-flex align-items-center gap-3 mb-3">
                <img src="<%= guide.getLogoPath() %>" alt="" width="48" height="48">
                <div>
                    <h5 class="card-title fw-bold mb-1"><%= guide.getName() %></h5>
                    <span class="badge text-bg-secondary"><%= guide.getCategoryName() %></span>
                    <span class="badge text-bg-<%= guide.getLevelColor() %>"><%= guide.getLevel() %></span>
                </div>
            </div>
            <p class="card-text text-body-secondary"><%= guide.getSummary() %></p>
        </div>
        <div class="card-footer bg-transparent border-top-0 d-flex justify-content-between align-items-center">
            <small class="text-body-secondary"><i class="bi bi-clock me-1" aria-hidden="true"></i>약 <%= guide.getWeeks() %>주</small>
            <a href="./guide.jsp?id=<%= guide.getId() %>" class="btn btn-outline-primary btn-sm">자세히 보기 <i class="bi bi-arrow-right" aria-hidden="true"></i></a>
        </div>
    </div>
</div>
<%
    }
%>
