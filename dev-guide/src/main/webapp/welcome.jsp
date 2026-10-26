<%@ page contentType="text/html; charset=utf-8" %>
<%-- [4주차] page 디렉티브 import: 스크립트에서 쓸 자바 클래스 --%>
<%@ page import="java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.Locale" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="dto.Guide" %>
<%-- [5주차] useBean: 학습 카드 데이터를 가진 자바빈즈를 application 영역에서 찾거나 만듦 --%>
<jsp:useBean id="guideDAO" class="dao.GuideRepository" scope="application" />
<%-- [3주차] 선언문: 모든 요청이 함께 쓰는 변수와 메소드 --%>
<%!
    String greeting = "개발 입문 가이드에 오신 것을 환영합니다";
    String tagline = "무엇부터 배워야 할지 막막할 때, 여기서 시작하세요.";
    int visitCount = 0;

    String[] tips = {
        "에러 메시지가 길면 맨 아래쪽 Caused by 부분부터 읽어 보세요. 진짜 원인이 거기 있는 경우가 많아요.",
        "코드를 크게 고치기 전에 Git으로 커밋해 두면 언제든 되돌릴 수 있어요.",
        "변수 이름은 a, b보다 count, userName처럼 의미가 드러나게 지으세요.",
        "30분 넘게 막히면 무엇을 시도했는지 정리해서 질문하세요. 정리하다가 답을 찾기도 해요.",
        "같은 코드를 세 번 복사했다면 메소드로 묶을 때가 된 거예요.",
        "중간값을 System.out.println으로 찍어 보는 것도 훌륭한 디버깅 방법이에요.",
        "블로그 글보다 공식 문서를 먼저 찾아보는 습관을 들이세요.",
        "조금 만들고 바로 실행해 보세요. 한 번에 많이 고칠수록 오류를 찾기 어려워져요.",
        "JSP에서 한글이 깨지면 page 디렉티브의 charset=utf-8부터 확인하세요.",
        "IntelliJ에서 Ctrl+Space를 누르면 자동 완성 목록이 나와요."
    };

    // 1년 중 몇째 날인지에 따라 하루에 팁 하나를 고름
    String getTodayTip(int dayOfYear) {
        return tips[dayOfYear % tips.length];
    }

    // 접속한 시각에 맞는 인사말
    String getTimeGreeting(int hour) {
        if (hour >= 5 && hour < 12) {
            return "좋은 아침이에요!";
        } else if (hour >= 12 && hour < 18) {
            return "좋은 오후예요!";
        } else if (hour >= 18 && hour < 23) {
            return "좋은 저녁이에요!";
        }
        return "늦은 시간까지 공부하시네요!";
    }
%>
<%-- [3주차] 스크립틀릿: 요청이 올 때마다 실행되는 코드 --%>
<%
    visitCount++;
    Calendar now = Calendar.getInstance();
    int dayOfYear = now.get(Calendar.DAY_OF_YEAR);
    String today = new SimpleDateFormat("yyyy년 M월 d일 (E) a h:mm", Locale.KOREA).format(new Date());

    ArrayList<Guide> allGuides = guideDAO.getAllGuides();
    Guide todayGuide = allGuides.get(dayOfYear % allGuides.size());
    ArrayList<Guide> starterGuides = guideDAO.getGuidesByLevel("입문");
%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/bootstrap-icons.min.css" rel="stylesheet">
<title>개발 입문 가이드</title>
</head>
<body>
<div class="container py-4">
    <%-- [5주차] include 액션 태그 + param: 메뉴를 모듈화하고 현재 메뉴를 전달 --%>
    <jsp:include page="menu.jsp">
        <jsp:param name="active" value="home" />
    </jsp:include>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-3">
            <%-- [3주차] 표현문: 선언문 메소드와 스크립틀릿 변수의 값을 출력 --%>
            <p class="text-body-secondary mb-2"><i class="bi bi-clock me-1" aria-hidden="true"></i><%= getTimeGreeting(now.get(Calendar.HOUR_OF_DAY)) %> 지금은 <%= today %>입니다.</p>
            <h1 class="display-5 fw-bold"><%= greeting %></h1>
            <p class="col-md-8 fs-5"><%= tagline %></p>
            <a href="./roadmap.jsp" class="btn btn-primary btn-lg"><i class="bi bi-signpost-split me-2" aria-hidden="true"></i>학습 로드맵 보기</a>
        </div>
    </div>

    <div class="row g-4 mb-4">
        <div class="col-md-8">
            <div class="h-100 p-4 border rounded-3">
                <h2 class="h5 fw-bold"><i class="bi bi-lightbulb text-warning me-2" aria-hidden="true"></i>오늘의 개발 팁</h2>
                <p class="fs-5 mb-0"><%= getTodayTip(dayOfYear) %></p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="h-100 p-4 border rounded-3 text-center">
                <h2 class="h5 fw-bold"><i class="bi bi-eye text-primary me-2" aria-hidden="true"></i>방문 횟수</h2>
                <p class="display-6 fw-bold mb-0"><%= visitCount %></p>
                <p class="text-body-secondary small mb-0">서버가 켜진 뒤 이 페이지를 연 횟수</p>
            </div>
        </div>
    </div>

    <h2 class="h4 fw-bold mb-3"><i class="bi bi-star text-warning me-2" aria-hidden="true"></i>오늘의 추천 학습</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4 mb-4">
        <%-- [5주차] include 액션 태그 + param: 카드 한 칸을 card.jsp로 모듈화 --%>
        <jsp:include page="card.jsp">
            <jsp:param name="id" value="<%= todayGuide.getId() %>" />
        </jsp:include>
    </div>

    <h2 class="h4 fw-bold mb-3"><i class="bi bi-rocket-takeoff text-primary me-2" aria-hidden="true"></i>처음이라면 여기서 시작하세요</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
            for (int i = 0; i < starterGuides.size(); i++) {
                Guide guide = starterGuides.get(i);
        %>
        <jsp:include page="card.jsp">
            <jsp:param name="id" value="<%= guide.getId() %>" />
        </jsp:include>
        <%
            }
        %>
    </div>

    <%-- [4주차] include 디렉티브: 모든 페이지에 같은 바닥글 --%>
    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
