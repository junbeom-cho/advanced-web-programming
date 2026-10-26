package dao;

import java.util.ArrayList;
import dto.Guide;
import dto.RoadmapStep;

public class GuideRepository {

    private ArrayList<Guide> listOfGuides = new ArrayList<Guide>();
    private ArrayList<RoadmapStep> roadmap = new ArrayList<RoadmapStep>();

    public GuideRepository() {
        Guide pythonGuide = new Guide("python", "Python", "lang", "입문");
        pythonGuide.setLogo("python.svg");
        pythonGuide.setSummary("문법이 간결해서 첫 프로그래밍 언어로 많이 추천하는 언어");
        pythonGuide.setDescription("들여쓰기로 코드 블록을 나누고 문법이 영어 문장처럼 읽혀서, 문법보다 프로그래밍하는 방법 자체에 집중하기 좋습니다. 데이터 분석, 인공지능, 업무 자동화, 웹 서버까지 쓰이는 곳이 넓습니다.");
        pythonGuide.setTarget("프로그래밍을 처음 배우는 사람, 데이터 분석이나 인공지능에 관심 있는 사람");
        pythonGuide.setWeeks(4);
        pythonGuide.setSteps(new String[] {
            "변수와 자료형(숫자, 문자열, 리스트) 익히기",
            "조건문(if)과 반복문(for, while) 연습하기",
            "함수를 만들어 코드를 기능별로 나누기",
            "파일 읽기·쓰기로 작은 프로그램 완성하기"
        });
        pythonGuide.setHelloCode("print(\"Hello, World!\")");
        pythonGuide.setDocName("Python 자습서 (공식 문서 한국어판)");
        pythonGuide.setDocUrl("https://docs.python.org/ko/3/tutorial/");

        Guide javaGuide = new Guide("java", "Java", "lang", "초급");
        javaGuide.setLogo("java.svg");
        javaGuide.setSummary("객체지향을 제대로 배울 수 있고, JSP와 스프링의 바탕이 되는 언어");
        javaGuide.setDescription("클래스와 객체를 중심으로 프로그램을 설계하는 객체지향 언어입니다. 자료형을 엄격하게 검사해서 실수를 컴파일 단계에서 잡아 주고, 서버 개발(JSP, 스프링)과 안드로이드 앱 개발에 널리 쓰입니다.");
        javaGuide.setTarget("웹 서버 개발자를 목표로 하는 사람, JSP나 스프링을 배울 예정인 사람");
        javaGuide.setWeeks(6);
        javaGuide.setSteps(new String[] {
            "JDK를 설치하고 main 메소드로 첫 프로그램 실행하기",
            "변수, 조건문, 반복문, 배열 익히기",
            "클래스와 객체, 생성자, getter/setter 이해하기",
            "상속과 인터페이스, ArrayList 같은 컬렉션 활용하기"
        });
        javaGuide.setHelloCode("public class Hello {\n"
                + "    public static void main(String[] args) {\n"
                + "        System.out.println(\"Hello, World!\");\n"
                + "    }\n"
                + "}");
        javaGuide.setDocName("Learn Java (dev.java 공식 학습 사이트)");
        javaGuide.setDocUrl("https://dev.java/learn/");

        Guide cGuide = new Guide("c", "C", "lang", "초급");
        cGuide.setLogo("c.svg");
        cGuide.setSummary("컴퓨터가 메모리를 다루는 방식을 가장 가까이서 배울 수 있는 언어");
        cGuide.setDescription("포인터로 메모리 주소를 직접 다루기 때문에 다른 언어보다 어렵지만, 그만큼 컴퓨터 구조와 운영체제를 이해하는 데 도움이 됩니다. 운영체제, 임베디드 장치, 다른 언어의 실행 환경을 만드는 데 쓰입니다.");
        cGuide.setTarget("컴퓨터 구조를 깊이 이해하고 싶은 사람, 임베디드·시스템 분야에 관심 있는 사람");
        cGuide.setWeeks(6);
        cGuide.setSteps(new String[] {
            "컴파일러를 설치하고 첫 프로그램 빌드하기",
            "자료형, 조건문, 반복문, 배열 익히기",
            "함수와 포인터의 개념 이해하기",
            "구조체와 동적 메모리(malloc, free) 다루기"
        });
        cGuide.setHelloCode("#include <stdio.h>\n"
                + "\n"
                + "int main(void) {\n"
                + "    printf(\"Hello, World!\\n\");\n"
                + "    return 0;\n"
                + "}");
        cGuide.setDocName("코딩 도장 (C 언어 강좌)");
        cGuide.setDocUrl("https://dojang.io/");

        Guide htmlGuide = new Guide("html", "HTML & CSS", "web", "입문");
        htmlGuide.setLogo("html5.svg");
        htmlGuide.setSummary("웹 페이지의 뼈대(HTML)와 디자인(CSS)을 만드는 기본 언어");
        htmlGuide.setDescription("HTML은 제목, 문단, 링크, 이미지 같은 웹 페이지의 구조를 태그로 표시하고, CSS는 색상, 글꼴, 배치 같은 모양을 정합니다. JSP도 결국 HTML을 만들어 브라우저에 보내기 때문에 웹 개발의 출발점입니다.");
        htmlGuide.setTarget("웹 개발을 시작하는 모든 사람");
        htmlGuide.setWeeks(3);
        htmlGuide.setSteps(new String[] {
            "기본 태그(h1, p, a, img, ul)로 문서 만들기",
            "표(table)와 폼(form) 태그 익히기",
            "CSS 선택자와 박스 모델 이해하기",
            "Flexbox나 부트스트랩으로 화면 배치하기"
        });
        htmlGuide.setHelloCode("<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "    <title>Hello</title>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <h1>Hello, World!</h1>\n"
                + "</body>\n"
                + "</html>");
        htmlGuide.setDocName("MDN Web Docs (한국어)");
        htmlGuide.setDocUrl("https://developer.mozilla.org/ko/");

        Guide javascriptGuide = new Guide("javascript", "JavaScript", "web", "초급");
        javascriptGuide.setLogo("javascript.svg");
        javascriptGuide.setSummary("웹 페이지에 동작을 넣는, 브라우저에서 실행되는 언어");
        javascriptGuide.setDescription("버튼을 누르면 내용이 바뀌거나 화면이 움직이는 것처럼, 웹 페이지에 동작을 넣을 때 씁니다. 브라우저에서 바로 실행되기 때문에 따로 설치하지 않아도 개발자 도구(F12)의 콘솔에서 연습할 수 있습니다.");
        javascriptGuide.setTarget("HTML과 CSS를 익히고 웹 화면에 기능을 넣고 싶은 사람");
        javascriptGuide.setWeeks(5);
        javascriptGuide.setSteps(new String[] {
            "변수(let, const)와 자료형 익히기",
            "조건문, 반복문, 함수 작성하기",
            "DOM으로 HTML 요소를 찾고 내용 바꾸기",
            "click 같은 이벤트를 처리해 간단한 기능 만들기"
        });
        javascriptGuide.setHelloCode("console.log(\"Hello, World!\");");
        javascriptGuide.setDocName("모던 JavaScript 튜토리얼");
        javascriptGuide.setDocUrl("https://ko.javascript.info/");

        Guide jspGuide = new Guide("jsp", "JSP", "web", "중급");
        jspGuide.setLogo("tomcat.svg");
        jspGuide.setSummary("HTML 안에 자바 코드를 넣어 서버에서 동적인 웹 페이지를 만드는 기술");
        jspGuide.setDescription("요청이 올 때마다 서버(톰캣)가 JSP를 자바 서블릿으로 바꿔 실행하고, 그 결과로 만든 HTML을 브라우저에 보냅니다. 스크립트 태그, 디렉티브 태그, 액션 태그와 자바빈즈를 함께 쓰면 화면 코드와 데이터 처리 코드를 나눌 수 있습니다. 이 사이트도 JSP로 만들었습니다.");
        jspGuide.setTarget("Java 기초와 HTML을 익히고 서버 개발을 시작하려는 사람");
        jspGuide.setWeeks(4);
        jspGuide.setSteps(new String[] {
            "JDK와 톰캣으로 개발 환경 만들기",
            "스크립트 태그(선언문, 스크립틀릿, 표현문) 익히기",
            "디렉티브 태그로 페이지를 설정하고 모듈화하기",
            "액션 태그와 자바빈즈로 데이터 처리 코드 나누기"
        });
        jspGuide.setHelloCode("<%@ page contentType=\"text/html; charset=utf-8\" %>\n"
                + "<html>\n"
                + "<body>\n"
                + "    <h1><%= \"Hello, World!\" %></h1>\n"
                + "</body>\n"
                + "</html>");
        jspGuide.setDocName("쉽게 배우는 JSP 웹 프로그래밍 2판 (한빛아카데미, 수업 부교재)");
        jspGuide.setDocUrl("");

        Guide gitGuide = new Guide("git", "Git", "tool", "입문");
        gitGuide.setLogo("git.svg");
        gitGuide.setSummary("코드의 변경 기록을 저장하고 되돌릴 수 있게 해 주는 버전 관리 도구");
        gitGuide.setDescription("파일을 고칠 때마다 커밋으로 저장해 두면 언제든 예전 상태로 돌아갈 수 있습니다. GitHub 같은 원격 저장소와 함께 쓰면 여러 사람이 같은 프로젝트를 나눠서 개발할 수 있어서, 개발자라면 꼭 익혀야 하는 도구입니다.");
        gitGuide.setTarget("과제나 팀 프로젝트 코드를 안전하게 관리하고 싶은 모든 사람");
        gitGuide.setWeeks(2);
        gitGuide.setSteps(new String[] {
            "git init으로 저장소 만들기",
            "add와 commit으로 변경 기록 남기기",
            "branch와 merge로 작업을 나누고 합치기",
            "GitHub에 push하고 pull로 받아 오기"
        });
        gitGuide.setHelloCode("git init\n"
                + "git add hello.txt\n"
                + "git commit -m \"Hello, World!\"");
        gitGuide.setDocName("Pro Git (한국어판)");
        gitGuide.setDocUrl("https://git-scm.com/book/ko/v2");

        Guide sqlGuide = new Guide("sql", "SQL", "tool", "초급");
        sqlGuide.setLogo("sql.svg");
        sqlGuide.setSummary("데이터베이스에 데이터를 저장하고 꺼내는 질의 언어");
        sqlGuide.setDescription("회원 정보나 게시글처럼 많은 데이터를 표(테이블) 형태로 저장하고, SELECT, INSERT, UPDATE, DELETE 문으로 원하는 데이터를 다룹니다. 이 사이트는 데이터를 자바 클래스에 저장하지만, 실제 서비스는 대부분 데이터베이스를 씁니다.");
        sqlGuide.setTarget("웹 서비스가 데이터를 어떻게 저장하는지 알고 싶은 사람");
        sqlGuide.setWeeks(3);
        sqlGuide.setSteps(new String[] {
            "테이블, 행, 열의 개념 이해하기",
            "SELECT와 WHERE로 데이터 조회하기",
            "INSERT, UPDATE, DELETE로 데이터 바꾸기",
            "JOIN으로 여러 테이블 연결하기"
        });
        sqlGuide.setHelloCode("SELECT 'Hello, World!' AS greeting;");
        sqlGuide.setDocName("SQLBolt (대화형 SQL 연습)");
        sqlGuide.setDocUrl("https://sqlbolt.com/");

        Guide linuxGuide = new Guide("linux", "Linux 터미널", "tool", "초급");
        linuxGuide.setLogo("linux.svg");
        linuxGuide.setSummary("명령어로 파일과 프로그램을 다루는 터미널 사용법");
        linuxGuide.setDescription("서버 컴퓨터는 대부분 화면 없이 리눅스 터미널로 관리합니다. 폴더 이동, 파일 복사, 권한 설정 같은 기본 명령어를 알면 서버에 웹 애플리케이션을 올리거나 문제를 찾을 때 훨씬 수월합니다.");
        linuxGuide.setTarget("서버 배포나 개발 환경 설정을 혼자 해 보고 싶은 사람");
        linuxGuide.setWeeks(2);
        linuxGuide.setSteps(new String[] {
            "pwd, ls, cd로 폴더 이동하기",
            "mkdir, cp, mv, rm으로 파일 다루기",
            "cat, less, grep으로 파일 내용 찾기",
            "chmod로 권한을 설정하고 간단한 셸 스크립트 만들기"
        });
        linuxGuide.setHelloCode("echo \"Hello, World!\"");
        linuxGuide.setDocName("The Missing Semester of Your CS Education (MIT)");
        linuxGuide.setDocUrl("https://missing.csail.mit.edu/");

        listOfGuides.add(pythonGuide);
        listOfGuides.add(javaGuide);
        listOfGuides.add(cGuide);
        listOfGuides.add(htmlGuide);
        listOfGuides.add(javascriptGuide);
        listOfGuides.add(jspGuide);
        listOfGuides.add(gitGuide);
        listOfGuides.add(sqlGuide);
        listOfGuides.add(linuxGuide);

        RoadmapStep step1 = new RoadmapStep(1, "첫 언어 하나 정하기",
                "처음에는 언어 하나를 끝까지 익히는 것이 중요합니다. 문법이 쉬운 Python이나, 이 수업에서 쓰는 Java 중 하나를 골라 기초 문법을 끝내세요.");
        step1.addGuide(pythonGuide);
        step1.addGuide(javaGuide);

        RoadmapStep step2 = new RoadmapStep(2, "코드 기록 남기기",
                "과제 코드부터 Git으로 관리하는 습관을 들이면, 실수해도 언제든 예전 상태로 되돌릴 수 있습니다.");
        step2.addGuide(gitGuide);

        RoadmapStep step3 = new RoadmapStep(3, "웹 화면 만들기",
                "웹 페이지의 구조와 모양을 HTML과 CSS로 만들고, JavaScript로 동작을 넣어 봅니다.");
        step3.addGuide(htmlGuide);
        step3.addGuide(javascriptGuide);

        RoadmapStep step4 = new RoadmapStep(4, "서버에서 페이지 만들기",
                "Java 문법을 바탕으로 JSP를 배우면 요청에 따라 내용이 바뀌는 동적 웹 페이지를 만들 수 있습니다.");
        step4.addGuide(jspGuide);

        RoadmapStep step5 = new RoadmapStep(5, "데이터 저장하기",
                "회원이나 게시글처럼 계속 남아 있어야 하는 데이터는 데이터베이스에 저장합니다. SQL로 조회와 저장을 연습하세요.");
        step5.addGuide(sqlGuide);

        RoadmapStep step6 = new RoadmapStep(6, "서버 환경 다루기",
                "만든 웹 애플리케이션을 서버에 올리려면 리눅스 터미널을 다룰 줄 알아야 합니다. 컴퓨터 구조까지 깊이 들어가고 싶다면 C 언어도 공부해 보세요.");
        step6.addGuide(linuxGuide);
        step6.addGuide(cGuide);

        roadmap.add(step1);
        roadmap.add(step2);
        roadmap.add(step3);
        roadmap.add(step4);
        roadmap.add(step5);
        roadmap.add(step6);
    }

    public ArrayList<Guide> getAllGuides() {
        return listOfGuides;
    }

    //분류 코드에 맞는 학습 카드 (없거나 모르는 분류면 전체 목록)
    public ArrayList<Guide> getGuidesByCategory(String category) {
        ArrayList<Guide> guidesByCategory = new ArrayList<Guide>();

        for (int i = 0; i < listOfGuides.size(); i++) {
            Guide guide = listOfGuides.get(i);
            if (guide.getCategory().equals(category)) {
                guidesByCategory.add(guide);
            }
        }

        if (guidesByCategory.isEmpty()) {
            return listOfGuides;
        }
        return guidesByCategory;
    }

    public ArrayList<Guide> getGuidesByLevel(String level) {
        ArrayList<Guide> guidesByLevel = new ArrayList<Guide>();

        for (int i = 0; i < listOfGuides.size(); i++) {
            Guide guide = listOfGuides.get(i);
            if (guide.getLevel().equals(level)) {
                guidesByLevel.add(guide);
            }
        }
        return guidesByLevel;
    }

    public Guide getGuideById(String id) {
        Guide guideById = null;

        for (int i = 0; i < listOfGuides.size(); i++) {
            Guide guide = listOfGuides.get(i);
            if (guide.getId().equals(id)) {
                guideById = guide;
                break;
            }
        }
        return guideById;
    }

    //같은 분류에 있는 다른 학습 카드
    public ArrayList<Guide> getRelatedGuides(Guide target) {
        ArrayList<Guide> relatedGuides = new ArrayList<Guide>();

        for (int i = 0; i < listOfGuides.size(); i++) {
            Guide guide = listOfGuides.get(i);
            if (guide.getCategory().equals(target.getCategory()) && !guide.getId().equals(target.getId())) {
                relatedGuides.add(guide);
            }
        }
        return relatedGuides;
    }

    public ArrayList<RoadmapStep> getRoadmap() {
        return roadmap;
    }
}
