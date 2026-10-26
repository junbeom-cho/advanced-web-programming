<%@ page contentType="text/html; charset=utf-8" %>
<%-- [4주차] errorPage: 이 페이지에서 예외가 나면 error.jsp로 이동 --%>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Guide" %>
<jsp:useBean id="guideDAO" class="dao.GuideRepository" scope="application" />
<%-- [5주차] setProperty: 주소의 id 파라미터(guide.jsp?id=java)를 자바빈즈에 저장 --%>
<jsp:useBean id="query" class="dto.GuideParam" />
<jsp:setProperty name="query" property="id" />
<%!
    // 예제 코드를 글자 그대로 보여 주려고 HTML 특수 문자를 바꿈
    String escapeHtml(String text) {
        if (text == null) {
            return "";
        }
        return text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }
%>
<%
    Guide guide = guideDAO.getGuideById(query.getId());
    if (guide == null) {
        if (query.getId() == null) {
            throw new IllegalArgumentException("주소에 학습 카드 ID가 없습니다. 학습 목록에서 카드를 골라 주세요.");
        }
        throw new IllegalArgumentException("'" + query.getId() + "' 학습 카드를 찾을 수 없습니다.");
    }
    String[] steps = guide.getSteps();
    ArrayList<Guide> relatedGuides = guideDAO.getRelatedGuides(guide);
%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/bootstrap-icons.min.css" rel="stylesheet">
<title><%= guide.getName() %> - 개발 입문 가이드</title>
</head>
<body>
<div class="container py-4">
    <jsp:include page="menu.jsp">
        <jsp:param name="active" value="guides" />
    </jsp:include>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-3">
            <img src="<%= guide.getLogoPath() %>" alt="" width="80" height="80" class="mb-3">
            <h1 class="display-5 fw-bold"><%= guide.getName() %></h1>
            <p class="mb-3">
                <span class="badge text-bg-secondary"><%= guide.getCategoryName() %></span>
                <span class="badge text-bg-<%= guide.getLevelColor() %>"><%= guide.getLevel() %></span>
                <span class="badge text-bg-light border"><i class="bi bi-clock me-1" aria-hidden="true"></i>예상 학습 기간 약 <%= guide.getWeeks() %>주</span>
            </p>
            <p class="col-md-9 fs-5 mb-0"><%= guide.getSummary() %></p>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-md-7">
            <h2 class="h4 fw-bold"><i class="bi bi-info-circle text-primary me-2" aria-hidden="true"></i>어떤 기술인가요?</h2>
            <p><%= guide.getDescription() %></p>

            <h2 class="h4 fw-bold mt-4"><i class="bi bi-person-check text-primary me-2" aria-hidden="true"></i>이런 분께 추천해요</h2>
            <p><%= guide.getTarget() %></p>

            <h2 class="h4 fw-bold mt-4"><i class="bi bi-list-ol text-primary me-2" aria-hidden="true"></i>학습 순서</h2>
            <ol class="list-group list-group-numbered">
                <%
                    for (int i = 0; i < steps.length; i++) {
                %>
                <li class="list-group-item"><%= steps[i] %></li>
                <%
                    }
                %>
            </ol>
        </div>
        <div class="col-md-5">
            <h2 class="h4 fw-bold"><i class="bi bi-terminal text-primary me-2" aria-hidden="true"></i>Hello, World!</h2>
            <pre class="bg-dark text-light p-3 rounded-3"><code><%= escapeHtml(guide.getHelloCode()) %></code></pre>

            <h2 class="h4 fw-bold mt-4"><i class="bi bi-book text-primary me-2" aria-hidden="true"></i>추천 자료</h2>
            <%
                if (guide.getDocUrl() == null || guide.getDocUrl().isEmpty()) {
            %>
            <p><%= guide.getDocName() %></p>
            <%
                } else {
            %>
            <p><a href="<%= guide.getDocUrl() %>" target="_blank" rel="noopener"><%= guide.getDocName() %> <i class="bi bi-box-arrow-up-right small" aria-hidden="true"></i></a></p>
            <%
                }
            %>
        </div>
    </div>

    <h2 class="h4 fw-bold mt-5 mb-3"><i class="bi bi-grid text-primary me-2" aria-hidden="true"></i>같은 분류의 다른 학습</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4 mb-4">
        <%
            for (int i = 0; i < relatedGuides.size(); i++) {
                Guide related = relatedGuides.get(i);
        %>
        <jsp:include page="card.jsp">
            <jsp:param name="id" value="<%= related.getId() %>" />
        </jsp:include>
        <%
            }
        %>
    </div>

    <a href="./guides.jsp?category=<%= guide.getCategory() %>" class="btn btn-secondary"><i class="bi bi-arrow-left me-1" aria-hidden="true"></i><%= guide.getCategoryName() %> 목록으로</a>

    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
