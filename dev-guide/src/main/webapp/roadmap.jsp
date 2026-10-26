<%@ page contentType="text/html; charset=utf-8" %>
<%-- [4주차] taglib 디렉티브: JSTL Core 태그를 접두사 c로 사용 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="guideDAO" class="dao.GuideRepository" scope="application" />
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/bootstrap-icons.min.css" rel="stylesheet">
<title>학습 로드맵 - 개발 입문 가이드</title>
</head>
<body>
<div class="container py-4">
    <jsp:include page="menu.jsp">
        <jsp:param name="active" value="roadmap" />
    </jsp:include>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-3">
            <h1 class="display-5 fw-bold">학습 로드맵</h1>
            <p class="col-md-8 fs-5 mb-0">처음 개발을 시작할 때 추천하는 순서예요. 단계마다 학습 카드를 눌러 자세히 볼 수 있어요.</p>
        </div>
    </div>

    <%-- [4주차] JSTL forEach: guideDAO.getRoadmap()의 단계를 하나씩 반복 --%>
    <c:forEach var="step" items="${guideDAO.roadmap}">
    <div class="card mb-3 shadow-sm">
        <div class="card-body">
            <h2 class="h5 card-title fw-bold">
                <span class="badge text-bg-dark me-2">${step.step}단계</span><c:out value="${step.title}" />
            </h2>
            <p class="card-text text-body-secondary"><c:out value="${step.description}" /></p>
            <c:forEach var="guide" items="${step.guides}">
            <a href="./guide.jsp?id=${guide.id}" class="btn btn-outline-secondary btn-sm me-1 mb-1 d-inline-flex align-items-center gap-2"><img src="${guide.logoPath}" alt="" width="20" height="20"><c:out value="${guide.name}" /></a>
            </c:forEach>
        </div>
    </div>
    </c:forEach>

    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
