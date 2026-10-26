<%@ page contentType="text/html; charset=utf-8" %>
<%-- [5주차] useBean + setProperty(value): 사이트 정보를 자바빈즈에 저장 --%>
<jsp:useBean id="site" class="dto.SiteInfo" />
<jsp:setProperty name="site" property="name" value="개발 입문 가이드" />
<jsp:setProperty name="site" property="purpose" value="프로그래밍을 처음 시작하는 사람이 무엇부터, 어떤 순서로 배우면 좋을지 한눈에 볼 수 있도록 만든 학습 안내 사이트입니다." />
<jsp:setProperty name="site" property="course" value="고급웹프로그래밍" />
<jsp:setProperty name="site" property="author" value="60211700 조준범" />
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/bootstrap-icons.min.css" rel="stylesheet">
<title>소개 - 개발 입문 가이드</title>
</head>
<body>
<div class="container py-4">
    <jsp:include page="menu.jsp">
        <jsp:param name="active" value="about" />
    </jsp:include>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-3">
            <h1 class="display-5 fw-bold">사이트 소개</h1>
            <p class="col-md-8 fs-5 mb-0">이 사이트를 만든 목적과 쓰인 기술을 정리했어요.</p>
        </div>
    </div>

    <div class="row g-4 mb-4">
        <div class="col-md-6">
            <h2 class="h4 fw-bold"><i class="bi bi-info-circle text-primary me-2" aria-hidden="true"></i>이 사이트는</h2>
            <%-- [5주차] getProperty: 자바빈즈에 저장한 값을 꺼내 출력 --%>
            <dl class="row">
                <dt class="col-sm-3">이름</dt>
                <dd class="col-sm-9"><jsp:getProperty name="site" property="name" /></dd>
                <dt class="col-sm-3">목적</dt>
                <dd class="col-sm-9"><jsp:getProperty name="site" property="purpose" /></dd>
                <dt class="col-sm-3">과목</dt>
                <dd class="col-sm-9"><jsp:getProperty name="site" property="course" /></dd>
                <dt class="col-sm-3">만든 사람</dt>
                <dd class="col-sm-9"><jsp:getProperty name="site" property="author" /></dd>
            </dl>
        </div>
        <div class="col-md-6">
            <h2 class="h4 fw-bold"><i class="bi bi-gear text-primary me-2" aria-hidden="true"></i>개발 환경</h2>
            <ul>
                <li>JDK 17</li>
                <li>Apache Tomcat 10.1 (Jakarta EE 10: Servlet 6.0, JSP 3.1)</li>
                <li>Maven</li>
                <li>Bootstrap 5.3.1 (CSS 파일을 프로젝트에 포함)</li>
                <li>Bootstrap Icons 1.11.3, Devicon 2.16.0 (아이콘 파일을 프로젝트에 포함)</li>
                <li>JSTL 3.0 (로드맵 페이지)</li>
            </ul>
            <p class="text-body-secondary small mb-1">학습 카드 데이터는 데이터베이스 없이 자바빈즈(GuideRepository)에 저장했습니다.</p>
            <p class="text-body-secondary small">아이콘과 기술 로고는 MIT 라이선스의 Bootstrap Icons와 Devicon을 썼고, 각 로고의 상표권은 해당 소유자에게 있습니다.</p>
        </div>
    </div>

    <h2 class="h4 fw-bold mb-3"><i class="bi bi-layers text-primary me-2" aria-hidden="true"></i>페이지별로 쓴 JSP 기술</h2>
    <div class="table-responsive">
        <table class="table table-bordered align-middle">
            <thead class="table-light">
                <tr>
                    <th>파일</th>
                    <th>역할</th>
                    <th>쓴 기술</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>index.jsp</td>
                    <td>첫 화면으로 이동</td>
                    <td>forward 액션 태그 (5주차)</td>
                </tr>
                <tr>
                    <td>welcome.jsp</td>
                    <td>인사말, 접속 시각, 오늘의 팁, 방문 횟수, 추천 학습</td>
                    <td>선언문·스크립틀릿·표현문 (3주차), page 디렉티브 import (4주차), useBean·include·param 액션 태그 (5주차)</td>
                </tr>
                <tr>
                    <td>menu.jsp</td>
                    <td>상단 메뉴, 현재 메뉴 표시</td>
                    <td>include 액션 태그와 param (5주차), 선언문 메소드 (3주차)</td>
                </tr>
                <tr>
                    <td>footer.jsp</td>
                    <td>바닥글</td>
                    <td>include 디렉티브 (4주차)</td>
                </tr>
                <tr>
                    <td>guides.jsp</td>
                    <td>분류별 학습 목록</td>
                    <td>useBean·setProperty·getProperty 액션 태그 (5주차), 스크립틀릿 반복문 (3주차)</td>
                </tr>
                <tr>
                    <td>card.jsp</td>
                    <td>학습 카드 한 칸</td>
                    <td>include 액션 태그로 반복 포함, param 전달, application 영역 useBean (5주차)</td>
                </tr>
                <tr>
                    <td>guide.jsp</td>
                    <td>학습 카드 상세</td>
                    <td>setProperty로 요청 값 받기 (5주차), errorPage (4주차), 선언문 메소드 (3주차)</td>
                </tr>
                <tr>
                    <td>roadmap.jsp</td>
                    <td>학습 로드맵</td>
                    <td>taglib 디렉티브와 JSTL (4주차)</td>
                </tr>
                <tr>
                    <td>about.jsp</td>
                    <td>사이트 소개 (이 페이지)</td>
                    <td>setProperty(value)·getProperty 액션 태그 (5주차)</td>
                </tr>
                <tr>
                    <td>error.jsp</td>
                    <td>오류 안내</td>
                    <td>isErrorPage와 exception (4주차)</td>
                </tr>
                <tr>
                    <td>dto, dao 패키지</td>
                    <td>학습 카드·로드맵 데이터</td>
                    <td>자바빈즈 (5주차)</td>
                </tr>
            </tbody>
        </table>
    </div>

    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
