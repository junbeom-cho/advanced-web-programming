---
title: "3주차 — JSP 기본 문법 (스크립트 태그)"
course: "고급웹프로그래밍 (명지대 융합소프트웨어학부)"
week: 3
textbook: "쉽게 배우는 JSP 웹 프로그래밍 2판 · Chapter 02 스크립트 태그: 시작 페이지 만들기"
source: "명지대-고급웹프로그래밍-3주차-JSP기본문법.pdf (슬라이드 38장)"
tags: [고급웹프로그래밍, JSP, 스크립트태그, 선언문, 스크립틀릿, 표현문, 북마켓]
---

# 📘 3주차 — JSP 기본 문법 (스크립트 태그)

> [!NOTE]
> **📚 출처** — 『쉽게 배우는 JSP 웹 프로그래밍(2판)』 Chapter 02 기반 강의자료 (슬라이드 38장)
> **표기 규칙** — 본문 = 강의자료 내용 · `💡 보충` = 강의자료 밖 추가 설명(공식 문서로 검증) · `💻 환경` = Mac·IntelliJ·Tomcat 11 실습 시 참고

## 🎯 학습 목표
- 스크립트 태그의 개념과 특징을 이해합니다.
- 스크립트 태그 구성 요소의 사용법을 익힙니다.
- 스크립트 태그를 이용하여 북마켓의 시작 페이지를 만듭니다.
- 부트스트랩 CSS를 이용하여 북마켓의 시작 페이지를 변경합니다.

## 🗺️ 목차
1. 스크립트 태그의 개요
2. 선언문 태그
3. 스크립틀릿 태그
4. 표현문 태그
5. [북마켓] 시작 페이지 만들기

---

## 1️⃣ 스크립트 태그의 개요
*슬라이드 p.6–9*

- **스크립트 태그**(script tag): `<% ... %>`를 사용하는 태그
- JSP 페이지가 서블릿 프로그램(서블릿 클래스)으로 변환될 때, **JSP 컨테이너**(JSP container)가 자바 코드가 삽입된 스크립트 태그를 처리하고 **나머지는 HTML 코드나 일반 텍스트로 간주**함

### 📌 스크립트 태그의 종류 (표 2-1)

| 스크립트 태그 | 형식 | 설명 |
|---|---|---|
| 선언문(declaration) | `<%! … %>` | 자바 변수나 메소드를 정의하는 데 사용한다. |
| 스크립틀릿(scriptlet) | `<% … %>` | 자바 로직 코드를 작성하는 데 사용한다. |
| 표현문(expression) | `<%= … %>` | 변수, 계산식, 메소드 호출 결과를 문자열 형태로 출력하는 데 사용한다. |

### JSP 페이지의 스크립트 태그 → 자바 서블릿 프로그램 번역 예
📄 `scripting.jsp`
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
    <h2>Scripting Tag</h2>
    <%! int count = 3;

    String makeItLower(String data) {
      return data.toLowerCase();
    } %>

    <%
      for(int i = 1; i <= count; i++) {
         out.println("Java Server Pages " + i + ".<br>");
         }
    %>

    <%= makeItLower("Hello World") %>
</body>
</html>
```
- **코드 포인트**
  - ① **선언문 태그**를 사용하여 자바 변수(`count`)와 메소드(`makeItLower()`) 정의
  - ② **스크립틀릿 태그**로 자바 로직 코드(`for` 반복문) 작성
  - ③ **표현문 태그**로 선언문의 메소드를 호출하여 문자열 형태로 출력
- **실행 결과** (p.9 화면): 제목 `Scripting Tag` 아래에 `Java Server Pages 1.` / `Java Server Pages 2.` / `Java Server Pages 3.` / `hello world`가 한 줄씩 출력

### 번역된 서블릿 프로그램 `scripting_jsp.java`
- 번역 결과는 `톰캣설치 ROOT\work\Catalina\localhost\ROOT\org\apache\jsp\`에 **`scripting_jsp.java`**(번역된 자바 소스)와 **`scripting_jsp.class`**(컴파일된 클래스)로 각각 보관됨

📄 `scripting_jsp.java`
```java
…(생략)…
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class scripting_jsp extends org.apache.jasper.runtime.HttpJspBase
implements org.apache.jasper.runtime.JspSourceDependent,
org.apache.jasper.runtime.JspSourceImports,
org.apache.jasper.runtime.JspSourceDirectives {
    int count = 3;
    String makeItLower(String data) {
        return data.toLowerCase();
    }
…(생략)…
public void _jspService(final jakarta.servlet.http.HttpServletRequest request,
final jakarta.servlet.http.HttpServletResponse response) throws
java.io.IOException, jakarta.servlet.ServletException {
…(생략)…
    for(int i = 0; i <= count; i++) {
        out.println("Java Server Pages " + i + "<br>");
    }
    out.write("\r\n");
    out.write("\r\n");
    out.write("\r\n");
    out.write("    ");
    out.print(makeItLower("Hello World"));
…(생략)…
    }
}
```

**원본 JSP ↔ 번역된 서블릿 대응** (슬라이드의 ①②③ 표시)

| 표시 | `scripting.jsp` (원본) | `scripting_jsp.java` (번역 결과) | 들어가는 위치 |
|---|---|---|---|
| ① 선언부 | `<%! int count = 3; String makeItLower(…) {…} %>` | `int count = 3;` / `String makeItLower(String data) {…}` | 클래스 멤버 (`_jspService()` **밖**) |
| ② 처리부 | `<% for(…) { out.println(…); } %>` | `for(…) { out.println(…); }` — 코드가 그대로 옮겨짐 | `_jspService()` **안** |
| ③ 출력부 | `<%= makeItLower("Hello World") %>` | `out.print(makeItLower("Hello World"));` | `_jspService()` **안** |
| (스크립트 태그 밖) | HTML 태그·줄바꿈·공백 | `out.write("\r\n");`, `out.write("    ");` 등 | `_jspService()` **안** |

> [!WARNING]
> **🔍 검증 — p.9 번역 코드가 p.7 원본과 다름**
> p.7 원본은 `for(int i = 1; …)`·`".<br>"`인데 p.9 번역 코드는 `for(int i = 0; …)`·`"<br>"`로 적혀 있음. 스크립틀릿 코드는 번역 시 그대로 옮겨지므로(② 처리부) 원본과 같아야 하고, p.9의 실행 결과 화면(`Java Server Pages 1.`~`3.`)도 p.7 원본(1부터 시작, 마침표 포함)과 일치함 → **p.7 원본 기준**으로 이해할 것. 근거: 슬라이드 p.7·p.9 대조

> [!TIP]
> **💡 보충 — 번역 규칙은 사양에 정해져 있음 (Jakarta Pages 사양 'Scripting' 장)**
> - 번역된 클래스 = **선언 영역**(클래스 본문) + **`_jspService()` 메소드**
> - 선언 영역: 페이지의 모든 선언문을 **나온 순서대로 이어 붙인 것** → ①
> - `_jspService()` 본문: 템플릿 텍스트·스크립틀릿·표현문을 **페이지에 나온 순서대로** 번역해 넣음
>   - 템플릿 텍스트(HTML·공백·줄바꿈) → `out`으로 내보내는 코드, 공백도 그대로 유지 → 위의 `out.write("\r\n");`
>   - 스크립틀릿 → **코드 조각 그대로** → ②
>   - 표현문 → `out.print(expression)` → ③
> - `_jspService()`는 JSP 페이지 본문에 해당하는 메소드로, JSP 컨테이너가 자동으로 정의하며 페이지 작성자가 직접 정의하면 안 됨
> - 출처: [Jakarta Pages 사양 원문 — Scripting](https://github.com/jakartaee/pages/blob/main/spec/src/main/asciidoc/server-pages-spec-body.adoc), [Tomcat 11 JSP API — HttpJspPage](https://tomcat.apache.org/tomcat-11.0-doc/jspapi/jakarta/servlet/jsp/HttpJspPage.html)

> [!NOTE]
> **💻 환경 — Mac · IntelliJ · Tomcat 11**
> - 슬라이드의 `톰캣설치 ROOT`는 정확히는 Tomcat 인스턴스의 실행 루트인 **CATALINA_BASE**이며, 웹 앱별 작업 폴더를 담는 `work` 폴더가 그 아래에 있음. 기본값은 설치 폴더(CATALINA_HOME)와 같음
> - IntelliJ의 Tomcat 설정에는 CATALINA_BASE를 따로 지정하는 *Tomcat base directory* 항목이 있어, IntelliJ로 실행했다면 설치 폴더의 `work`에서 번역 파일이 안 보일 수 있음
> - 확실한 위치 확인: JSP에 `<%= application.getAttribute("jakarta.servlet.context.tempdir") %>`를 출력 → 표시된 폴더(해당 웹 앱의 작업 폴더) 아래 `org/apache/jsp/`에 `*_jsp.java`·`*_jsp.class`가 있음
> - 출처: [Tomcat 11 Introduction](https://tomcat.apache.org/tomcat-11.0-doc/introduction.html), [Tomcat 11 Host — workDir](https://tomcat.apache.org/tomcat-11.0-doc/config/host.html), [Jasper How-To — scratchdir](https://tomcat.apache.org/tomcat-11.0-doc/jasper-howto.html), [IntelliJ IDEA — Application Servers](https://www.jetbrains.com/help/idea/2025.2/application-servers-settings.html)

---

## 2️⃣ 선언문 태그
*슬라이드 p.11–17*

- **선언문 태그**(declaration tag): 변수나 메소드를 선언하는 태그
  - 변수: **전역변수**로 사용
  - 메소드: **전역 메소드**로 사용

### 📌 구문
```jsp
<%! 자바 코드; %>
```
- 각 행이 **세미콜론(`;`)으로 끝나야 함**

### 사용 예: 전역변수 선언
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<%-- 선언문 태그 [메소드] --%>
<%! int count = 0; %>
<body>
    Page Count is
    <%-- 스크립틀릿 태그 --%>
    <%
        out.println(++count);
    %>
</body>
</html>
```
- **실행 결과**: `Page Count is 1`
- **코드 포인트**: ① `<%! int count = 0; %>` → 전역변수 `count`를 0으로 초기화 ② `out.println(++count);` → 전역변수 `count`를 1 증가시킴

**번역된 서블릿 프로그램** (p.13)
```java
public final class hello_jsp extends org.apache.jasper.runtime.HttpJspBase
implements org.apache.jasper.runtime.JspSourceDependent,
org.apache.jasper.runtime.JspSourceImports, org.apache.jasper.runtime.JspSourceDirectives {
    int count = 0;
    ...
public void _jspService(final jakarta.servlet.http.HttpServletRequest request,
final jakarta.servlet.http.HttpServletResponse response) throws IOException,
ServletException {
        response.setContenType("text/html");
        ...
        out.write("<body>\r\n");
        out.write("Page count is \r\n");
        out.write("     ");
        out.print(++count);
        out.write("\r\n");
        ...
    }
}
```
- **코드 포인트**: ① `int count = 0;` → `_jspService()` **밖**, 클래스 멤버로 선언됨 ② `out.print(++count);` → `_jspService()` **안**에서 요청을 처리할 때 실행됨

> [!WARNING]
> **🔍 검증 — p.12·p.13 코드의 오타와 불일치**
> - p.13 `response.setContenType("text/html");`은 오타 — 실제 메소드는 `setContentType(String type)` ([Tomcat 11 Servlet API — ServletResponse](https://tomcat.apache.org/tomcat-11.0-doc/servletapi/jakarta/servlet/ServletResponse.html))
> - p.13은 클래스명이 `hello_jsp`(scripting.jsp → scripting_jsp처럼 원본이 hello.jsp인 경우의 이름)이고 `"Page count is"`(소문자 c)·`out.print(++count);`로 되어 있어 p.12 원본(`Page Count is`, 스크립틀릿 `out.println(++count);`)과 세부가 다름 → **①은 클래스 멤버, ②는 `_jspService()` 안**이라는 구조만 보면 됨
> - p.12의 주석 `<%-- 선언문 태그 [메소드] --%>`는 실제로는 변수 선언(`int count`) 위에 붙어 있음

### 사용 예: 전역 메소드 선언
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
    Page Count is:
    <%-- 스크립틀릿 태그 --%>
    <%
        out.print(myMethod(0));
    %>
    <%-- 선언문 태그 [메소드] --%>
    <%! public int myMethod(int count) {
            return ++count;
    } %>
</body>
</html>
```
- **코드 포인트**: 선언문 태그로 **전역 메소드 `myMethod()` 설정** → 스크립틀릿 태그에서 **전역 메소드 `myMethod()` 호출**
- **실행 결과**: 슬라이드에 화면은 없음 — `myMethod(0)`이 매개변수 `count`(0)를 1 증가시켜 반환하므로 `Page Count is: 1`

> [!TIP]
> **💡 보충 — 선언문 변수는 '전역변수'가 아니라 서블릿 클래스의 멤버 변수**
> - 선언문은 번역된 클래스의 **멤버**(필드·메소드)가 됨(p.8 ①, p.13 ①). 사양은 이를 "페이지 전역(global to the page)"이라 부르며, 선언은 페이지가 초기화될 때 초기화되고 다른 선언·스크립틀릿·표현문에서 사용 가능 → 위 예처럼 메소드를 **선언보다 앞에서 호출**해도 됨
> - 서블릿 컨테이너는 (분산 환경이 아니면) 서블릿 선언당 **인스턴스를 하나만** 쓰고, 여러 요청을 그 인스턴스의 service 메소드로 **동시에** 보낼 수 있음 → 선언문 변수는 **모든 요청(사용자)이 공유**
> - 그래서 p.12의 `count`는 같은 인스턴스가 유지되는 동안 새로고침할 때마다 2, 3, …으로 계속 증가하지만, p.20·p.25처럼 스크립틀릿에서 선언한 **지역변수**는 요청마다 `_jspService()`가 새로 실행되며 0으로 초기화되므로 항상 1
> - 사양도 선언문에서 변수를 초기화하는 방식은 "여러 요청이 있을 때 주의해서" 쓰라고 함 → 동시 요청이 공유 변수를 바꾸면 값이 꼬일 수 있음
> - 출처: [Jakarta Pages 사양 원문 — Declarations](https://github.com/jakartaee/pages/blob/main/spec/src/main/asciidoc/server-pages-spec-body.adoc), [Jakarta Servlet 6.1 사양 §2.2·§2.3.3.1](https://jakarta.ee/specifications/servlet/6.1/jakarta-servlet-spec-6.1.pdf)

### 🧪 [예제 2-1] 선언문 태그에 전역변수 사용하기
1. 프로젝트 생성하기: 1장에서 생성한 JSPBook 프로젝트 그대로 사용(이후 프로젝트 동일)
2. JSP 페이지 작성하기
3. 프로젝트 실행하기

📄 `JSPBook/src/main/webapp/ch02/declaration01.jsp`
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
    <%! int data = 50; %>
    <%
        out.println("Value of the variable is:" + data);
    %>
</body>
</html>
```
- **실행 결과**: `/ch02/declaration01.jsp` → `Value of the variable is:50`
- **코드 포인트**: 선언문 태그로 전역변수 `data`를 50으로 선언 → 스크립틀릿 태그에서 `out.println()`으로 출력

### 🧪 [예제 2-2] 선언문 태그에 전역 메소드 사용하기 1
📄 `JSPBook/src/main/webapp/ch02/declaration02.jsp`
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
    <%! int sum(int a, int b) {
        return a + b;
    } %>
    <%
        out.println("2 + 3 = " + sum(2, 3));
    %>
</body>
</html>
```
- **실행 결과**: `/ch02/declaration02.jsp` → `2 + 3 = 5`
- **코드 포인트**: 선언문 태그로 전역 메소드 `sum(int a, int b)` 선언 → 스크립틀릿 태그에서 `sum(2, 3)` 호출

### 🧪 [예제 2-3] 선언문 태그에 전역 메소드 사용하기 2
📄 `JSPBook/src/main/webapp/ch02/declaration03.jsp`
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
    <%! String makeItLower(String data) {
        return data.toLowerCase();
    } %>
    <%
        out.println(makeItLower("Hello World"));
    %>
</body>
</html>
```
- **실행 결과**: `/ch02/declaration03.jsp` → `hello world`
- **코드 포인트**: 전역 메소드 `makeItLower()`가 `toLowerCase()`로 소문자 변환 → `"Hello World"`가 `hello world`로 출력

---

## 3️⃣ 스크립틀릿 태그
*슬라이드 p.19–22*

- **스크립틀릿 태그**(scriptlet tag): 자바 코드로 이루어진 **로직 부분**을 표현함
- out 객체를 사용하지 않고도 쉽게 HTML 응답을 만들어냄

### 📌 구문
```jsp
<% 자바 코드; %>
```
- 각 행이 **세미콜론(`;`)으로 끝나야 함**

### 📌 선언문 태그와 스크립틀릿 태그의 비교 (표 2-2)

| 선언문 태그 | 스크립틀릿 태그 |
|---|---|
| 변수뿐만 아니라 메소드를 선언할 수 있다. | 스크립틀릿 태그는 메소드 없이 변수만을 선언할 수 있다. |
| 서블릿 프로그램으로 변환될 때 `_jspService()` 메소드 외부에 배치된다. | 서블릿 프로그램으로 변환될 때 `_jspService()` 메소드 내부에 배치된다. |

### 사용 예: 스크립틀릿 태그로 선언된 지역변수
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<%
    int count = 0;
%>
<body>
    Page Count is
    <%
        out.println(++count);
    %>
</body>
</html>
```
- **실행 결과**: `Page Count is 1`
- **코드 포인트**: `int count = 0;` → **지역변수** `count`를 0으로 초기화 / `out.println(++count);` → 지역변수 `count`를 1 증가시킴

### 🧪 [예제 2-4] 스크립틀릿 태그에 지역변수 사용하기
📄 `JSPBook/src/main/webapp/ch02/scriptlet01.jsp`
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
    <%
        int a = 2;
        int b = 3;
        int sum = a + b;
        out.println("2 + 3 = " + sum);
    %>
</body>
</html>
```
- **실행 결과**: `/ch02/scriptlet01.jsp` → `2 + 3 = 5`
- **코드 포인트**: 스크립틀릿 태그 안에서 지역변수 `a`, `b`, `sum`을 선언·계산한 뒤 `out.println()`으로 출력

### 🧪 [예제 2-5] 스크립틀릿 태그에 0부터 10까지 짝수 출력하기
📄 `JSPBook/src/main/webapp/ch02/scriptlet02.jsp`
```jsp
<html>
<head>
<title>Scripting tag</title>
</head>
<body>
    <%
        for (int i = 0; i <= 10; i++) {
            if (i % 2 == 0)
                out.println(i + "<br>");
        }
    %>
</body>
</html>
```
- **실행 결과**: `/ch02/scriptlet02.jsp` → `0`, `2`, `4`, `6`, `8`, `10`이 한 줄에 하나씩 출력 (이 예제만 `<title>`이 `Scripting tag`)
- **코드 포인트**: `for` 반복문 + `if (i % 2 == 0)`으로 짝수만 골라 출력, `"<br>"`을 붙여 줄을 바꿈

> [!TIP]
> **💡 보충 — `out.println()`의 줄바꿈은 화면에 보이지 않음 → `<br>`이 필요한 이유**
> - `out.println()`은 출력 뒤에 줄 구분 문자(시스템 속성 `line.separator`)를 붙일 뿐이라 **HTML 소스**에서만 줄이 바뀜
> - 브라우저는 소스의 줄바꿈을 공백으로 바꾸고 연속된 공백을 하나로 합쳐 표시함 → 화면에서 줄을 바꾸려면 [예제 2-5]처럼 `<br>`을 함께 출력해야 함
> - 출처: [Tomcat 11 JSP API — JspWriter](https://tomcat.apache.org/tomcat-11.0-doc/jspapi/jakarta/servlet/jsp/JspWriter.html), [MDN — Handling whitespace](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Whitespace_in_the_DOM)

---

## 4️⃣ 표현문 태그
*슬라이드 p.24–30*

- **표현문 태그**(expression tag): 웹 브라우저에 **출력할 부분**을 표현함
- 표현문 태그에 숫자, 문자, 불린(Boolean) 등의 **기본 데이터 타입**과 **자바 객체 타입**도 사용 가능
- 표현문 태그는 **스크립틀릿 태그에서 사용할 수 없음** → 이때는 `out.print()` 메소드를 사용해야 함

### 📌 구문
```jsp
<%= 자바 코드 %>
```
- 각 행을 **세미콜론으로 종료할 수 없음**

### 사용 예
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<%
    int count = 0;
%>
<body>
    Page Count is
    <%=++count %>
</body>
</html>
```
- **실행 결과**: `Page Count is 1`
- **코드 포인트**: 스크립틀릿에서 선언한 지역변수 `count`를 표현문 `<%=++count %>`에서 1 증가시켜 바로 출력 (3️⃣ 사용 예의 `out.println(++count);`와 같은 결과)

### 🧪 [예제 2-6] 표현문 태그로 현재 날짜 출력하기
📄 `JSPBook/src/main/webapp/ch02/expression01.jsp`
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
    <p> Today's date: <%=new java.util.Date() %></p>
</body>
</html>
```
- **실행 결과**: `/ch02/expression01.jsp` → `Today's date: Tue Aug 22 17:26:32 KST 2023` (실행 시각이 출력되므로 매번 다름)
- **코드 포인트**: 표현문 안에서 자바 객체(`java.util.Date`)를 생성해 바로 출력 → 자바 객체 타입도 사용 가능

### 🧪 [예제 2-7] 표현문 태그로 연산 결과 출력하기
📄 `JSPBook/src/main/webapp/ch02/expression02.jsp`
```jsp
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
    <%
        int a = 10;
        int b = 20;
        int c = 30;
    %>
    <%=a + b + c %>
</body>
</html>
```
- **실행 결과**: `/ch02/expression02.jsp` → `60`
- **코드 포인트**: 스크립틀릿에서 선언한 지역변수 `a`, `b`, `c`를 표현문에서 계산식으로 출력

> [!TIP]
> **💡 보충 — 표현문에 세미콜론을 붙이면 안 되는 이유**
> - 표현문 안에는 '문장'이 아니라 하나의 완전한 **식**(expression)이 와야 하며, 요청 처리 시점에 평가된 값이 `String`으로 변환되어 `out`(JspWriter)에 출력됨
> - 번역 시 p.9 ③처럼 `out.print( … )`의 괄호 안에 식이 그대로 들어감 → `<%=a + b + c; %>`라고 쓰면 `out.print(a + b + c;)` 꼴이 되어 오류
> - 객체를 넣으면 `String.valueOf(객체)`로 만든 문자열이 출력됨 → [예제 2-6]의 날짜 문자열
> - `<%=`·`<%!`·`<%` 뒤와 `%>` 앞의 공백은 넣어도 빼도 됨 → `<%=new …%>`, `<%= makeItLower(…) %>` 모두 가능
> - 출처: [Jakarta Pages 사양 원문 — Expressions·Main Section](https://github.com/jakartaee/pages/blob/main/spec/src/main/asciidoc/server-pages-spec-body.adoc), [Tomcat 11 JSP API — JspWriter](https://tomcat.apache.org/tomcat-11.0-doc/jspapi/jakarta/servlet/jsp/JspWriter.html)

### JSP 주석과 HTML 주석
*p.28–30의 NOTE — 슬라이드 머리글은 '3. 웹 프로그래밍 언어의 종류와 특징'으로 되어 있지만 내용은 이번 주 주석 태그 설명*

> [!NOTE]
> **📌 NOTE — JSP 주석과 HTML 주석 태그**
> - **JSP 주석 태그**(comments tag)
>   - JSP 웹 컨테이너가 무시하는 텍스트를 표시함. JSP 페이지의 일부를 주석 처리하여 숨길 때 유용함
>   - 주석은 프로그램 실행에는 영향을 미치지 않지만, 프로그램의 이해 및 소스 코드 분석을 위해 반드시 기술할 것을 권장함
>   - JSP 웹 페이지에서만 사용되며, 웹 브라우저로 출력 결과를 확인하거나 웹 브라우저에서 **소스 보기를 해도 주석 내용이 표시되지 않음** → 화면에 표시되지도 않고 실행되지도 않음
>   - 주석 태그 구문: `<%-- JSP 주석 처리 내용 --%>`
>
> **[적용 예: JSP 웹 페이지에서 주석 처리하기]**
>
> ```jsp
> <html>
> <head>
> <title>A Comment Test</title></head>
> <body>
> <h2>A Test of Comments</h2>
> <%-- This comment will not be visible in the page source --%>
> </body>
> </html>
> ```
>
> 실행 결과: `A Test of Comments`만 출력 — 주석 태그 `<%-- --%>`는 JSP 엔진이 무시하는 내용이므로 웹 브라우저에 출력되지 않음
>
> - **HTML 주석**(`<!-- ~ -->`)
>   - 서블릿으로 변환할 때 주석이 무시되지 않고, 실행되는 페이지에서 주석으로 처리됨 → 주석 안에 포함된 **표현문 태그와 스크립틀릿 태그가 모두 컴파일됨**
>   - 그래서 HTML 주석 안에서 `name` 변수를 쓰는데 `name`이 없다면 변수가 정의되지 않았다는 **오류 메시지를 표시함**. 반면 JSP 주석은 주석문 안의 코드를 모두 무시하므로 `name` 변수가 없어도 오류 메시지를 표시하지 않음

> [!TIP]
> **💡 보충 — 두 주석이 '페이지 소스 보기'에서 보이는가**
>
> | 구분 | JSP 주석 `<%-- --%>` | HTML 주석 `<!-- -->` |
> |---|---|---|
> | JSP 컨테이너 | 내용 전체를 완전히 무시 | 일반 템플릿 텍스트로 취급, 안의 표현문·스크립틀릿은 **처리됨** |
> | 응답 HTML (소스 보기) | 포함 안 됨 | **포함됨** → 소스 보기에 보임 |
> | 브라우저 화면 | 안 보임 | 안 보임 (렌더링할 때 무시) |
>
> - 예: `<!-- 접속 시각: <%= new java.util.Date() %> -->`는 소스 보기에서 시각이 채워진 주석으로 보임 → 사용자에게 보이면 안 되는 내용은 JSP 주석으로 처리할 것
> - JSP 주석은 중첩되지 않음 (`<%-- … <%-- … --%> … --%>` 형태 불가)
> - 출처: [Jakarta Pages 사양 원문 — Comments](https://github.com/jakartaee/pages/blob/main/spec/src/main/asciidoc/server-pages-spec-body.adoc), [MDN — HTML Comments](https://developer.mozilla.org/en-US/docs/Web/HTML/Guides/Comments)

---

## 5️⃣ [북마켓] 시작 페이지 만들기
*슬라이드 p.32–37*

### 프로젝트 로드맵 (그림 2-1 시작 페이지 만들기)
- 북마켓(BookMarket) 프로젝트는 2장 **시작 페이지 만들기**에서 출발해 장마다 기능을 붙여 나감
  - 시작 페이지 만들기(**2장**) → 한글 출력 및 페이지 모듈화하기 → 도서 목록 표시하기 → 도서 상세 정보 표시하기 → 도서 등록 페이지 만들기 → 장바구니 페이지 만들기 → 주문 처리 페이지 만들기
  - 도서 등록 페이지 만들기 → 도서 이미지 등록하기 → 유효성 검사하기 → 다국어 처리하기 → 보안 처리하기
  - 데이터베이스 → 도서 목록 표시하기 / 데이터베이스 → 회원가입/수정/탈퇴 → 게시판
  - 별도 단계: 예외 처리 페이지 만들기, 로그 기록하기

### 프로젝트 실행 결과 (그림 2-2 완성된 북마켓 시작 페이지)
- 주소 `localhost:8080/BookMarket/welcome.jsp`, 탭 제목 `Welcome`
- 화면 구성(위 → 아래): 집 아이콘 + `Home` 메뉴(아래 구분선) → 회색 상자 안의 큰 제목 `Welcome to Book Shopping Mall`과 `BookMarket` → 가운데 정렬된 `Welcome to Web Market!` → 구분선 아래 바닥글 `© BookMarket`

### 🧪 [예제 2-8] 북마켓 시작 페이지 만들기
**1. 시작 페이지 작성하기**

📄 `BookMarket/src/main/webapp/welcome.jsp`
```jsp
<html>
<head>
<title>Welcome</title>
</head>
<body>
    <%! String greeting = "Welcome to Book Shopping Mall";
    String tagline = "Welcome to Web Market!"; %>
    <h1><%=greeting %></h1>
    <h3><%=tagline %></h3>
</body>
</html>
```
- **코드 포인트**: 선언문 태그로 문자열 변수 `greeting`·`tagline` 선언 → 표현문 태그로 `<h1>`·`<h3>`에 출력 (이 단계의 실행 화면은 슬라이드에 없음)

**2. 부트스트랩 CSS 적용하기**
- `<head>`에 **부트스트랩 5.3 버전** CSS를 CDN 링크로 설정: `https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css`
- 아래 코드는 슬라이드 그대로 전사함(슬라이드에서 줄이 넘어간 긴 행은 한 줄로 이음, 오타는 아래 🔍 검증 참고)

📄 `BookMarket/src/main/webapp/welcome.jsp`
```jsp
<html >
<head>
   <link 04 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Welcome</title>
</head>
<body>
<div class="container py-4">
   <header class="pb-3 mb-4 border-bottom">
     <a href="./welcome.jsp" class="d-flex align-items-center text-dark text-decoration-none">
     <svg  width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
     <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6 .646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
     <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13 .5V9.293l6-6Z"/>
     </svg>
            <span class="fs-4">Home</span>
      </a>
   </header>

<%! String greeting = "Welcome to Book Shopping Mall";
String tagline = "Welcome to Web Market!"; %>

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
     <div class="container-fluid py-5">
       <h1 class="display-5 fw-bold"><%=greeting %></h1>
       <p class="col-md-8 fs-4">BookMarket</p>
     </div>
   </div>

   <div class="row align-items-md-stretch   text-center">
     <div class="col-md-12">
       <div class="h-100 p-5">
         <h3><%=tagline %></h3>
       </div>
     </div>
   </div>

   <footer class="pt-3 mt-4 text-body-secondary border-top">
     &copy; BookMarket
   </footer>
 </div>
</body>
</html>
```

**영역별 구성** (슬라이드 p.35–37의 표시, 행 번호는 슬라이드 기준 01–41)

| 표시 | 행 | 코드 | 화면 (p.37) |
|---|---|---|---|
| 부트스트랩 5.3버전 설정 | 03 | `<link … href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">` | — |
| ① 메뉴 영역 | 08–16 | `<header class="pb-3 mb-4 border-bottom">` … `</header>` | 맨 위 메뉴 줄 |
| ⑤ 아이콘 표시 | 10–13 | `<svg … class="bi bi-house-fill" …>` … `</svg>` | 집 아이콘 |
| ⑥ Home 메뉴 표시 | 14 | `<span class="fs-4">Home</span>` | `Home` 글자 |
| ② 중간 타이틀 영역 | 21–26 | `<div class="p-5 mb-4 bg-body-tertiary rounded-3">` … `<%=greeting %>` … `BookMarket` | 회색 상자의 큰 제목과 `BookMarket` |
| ③ 본문 영역 | 28–34 | `<div class="row …">` … `<h3><%=tagline %></h3>` … | 가운데 정렬된 `Welcome to Web Market!` |
| ④ 바닥글 영역 | 36–38 | `<footer class="pt-3 mt-4 text-body-secondary border-top">` … `</footer>` | `© BookMarket` |

- **코드 포인트**: 1단계의 선언문(`greeting`·`tagline`)과 표현문 출력은 그대로 두고, 부트스트랩 클래스로 화면을 메뉴·중간 타이틀·본문·바닥글 영역으로 나누어 꾸밈

> [!WARNING]
> **🔍 검증 — [예제 2-8] 2단계 코드의 오타 2곳**
> - 03행 `<link 04 href=…>`의 `04`는 필요 없는 문자(오타) → 입력할 때는 빼고 `<link href="…" rel="stylesheet">`로 쓸 것
> - 11·12행 SVG `path`의 `l6 .646`과 `2 13 .5`에는 공식 Bootstrap Icons 집 아이콘 경로(`…L8 2.207l6.646 6.647…`, `…0 0 1 2 13.5V9.293…`)에 없는 공백이 들어 있음. SVG는 path 데이터에 오류가 있으면 오류가 난 명령 직전까지만 그리므로, 그대로 입력하면 집 아이콘 일부가 빠질 수 있음 → 두 곳의 공백을 빼고 `l6.646`, `13.5`로 입력할 것
> - 근거: [Bootstrap Icons — house 계열 아이콘의 path](https://icons.getbootstrap.com/icons/house-dash-fill/), [W3C SVG Paths — Error handling in path data](https://w3c.github.io/svgwg/specs/paths/)

---

## 🧠 핵심 요약

| 구분 | 선언문 | 스크립틀릿 | 표현문 |
|---|---|---|---|
| 형식 | `<%! … %>` | `<% … %>` | `<%= … %>` |
| 용도 | 자바 변수·메소드 정의 | 자바 로직 코드 작성 | 변수·계산식·메소드 호출 결과를 문자열로 출력 |
| 선언할 수 있는 것 | 변수 + 메소드 (전역) | 변수만 (지역), 메소드 불가 | — |
| 서블릿 변환 위치 | `_jspService()` **외부** (① 선언부) | `_jspService()` **내부** (② 처리부) | `_jspService()` **내부**, `out.print(…)` (③ 출력부) |
| 세미콜론 | 각 행이 `;`로 끝나야 함 | 각 행이 `;`로 끝나야 함 | `;`로 종료할 수 없음 |

- JSP 컨테이너는 스크립트 태그만 자바 코드로 처리하고, 나머지는 HTML 코드나 일반 텍스트로 간주함
- 번역 결과: `scripting.jsp` → `scripting_jsp.java`·`scripting_jsp.class` (`톰캣설치 ROOT\work\Catalina\localhost\ROOT\org\apache\jsp\`)
- 표현문은 스크립틀릿 안에서 쓸 수 없음 → 스크립틀릿 안에서는 `out.print()`로 출력
- 주석: JSP 주석 `<%-- --%>`는 컨테이너가 무시(소스 보기에도 안 보이고 실행도 안 됨) / HTML 주석 `<!-- -->` 안의 표현문·스크립틀릿은 컴파일됨
- [북마켓] 시작 페이지: 선언문으로 `greeting`·`tagline` 선언 → 표현문으로 출력 → 부트스트랩 5.3 CSS(CDN)로 메뉴·중간 타이틀·본문·바닥글 영역 구성

## ✍️ 시험 대비 체크포인트
- **Q.** 스크립트 태그 3종류의 형식은? → **A.** 선언문 `<%! … %>`, 스크립틀릿 `<% … %>`, 표현문 `<%= … %>` (표 2-1)
- **Q.** JSP 페이지가 서블릿으로 변환될 때 스크립트 태그가 아닌 부분은 어떻게 처리되는가? → **A.** JSP 컨테이너가 HTML 코드나 일반 텍스트로 간주함
- **Q.** 선언문 태그로 선언한 변수와 메소드는 각각 어떻게 사용되는가? → **A.** 변수는 전역변수, 메소드는 전역 메소드로 사용
- **Q.** 선언문 태그와 스크립틀릿 태그의 차이 두 가지는? (표 2-2) → **A.** ① 선언문은 변수와 메소드를 선언할 수 있고, 스크립틀릿은 메소드 없이 변수만 선언 가능 ② 서블릿 변환 시 선언문은 `_jspService()` 외부, 스크립틀릿은 내부에 배치
- **Q.** `scripting.jsp`를 번역한 결과는 어떤 파일로, 어디에 보관되는가? → **A.** `scripting_jsp.java`와 `scripting_jsp.class`로 `톰캣설치 ROOT\work\Catalina\localhost\ROOT\org\apache\jsp\`에 보관
- **Q.** 번역된 서블릿의 ① 선언부·② 처리부·③ 출력부는 각각 원본의 어떤 태그에서 왔는가? → **A.** ① 선언문(클래스 멤버) ② 스크립틀릿(`_jspService()` 안의 코드) ③ 표현문(`out.print(…)`)
- **Q.** 세 태그의 세미콜론 규칙은? → **A.** 선언문·스크립틀릿은 각 행이 세미콜론으로 끝나야 하고, 표현문은 세미콜론으로 종료할 수 없음
- **Q.** 스크립틀릿 태그 안에서 값을 출력하려면? → **A.** 표현문 태그는 스크립틀릿 안에서 쓸 수 없으므로 `out.print()` 메소드를 사용
- **Q.** 표현문 태그에 사용할 수 있는 데이터 타입은? → **A.** 숫자·문자·불린 등 기본 데이터 타입과 자바 객체 타입
- **Q.** p.12(선언문)와 p.20(스크립틀릿)의 `count`는 각각 어떤 변수인가? → **A.** p.12는 전역변수, p.20은 지역변수 (두 예 모두 실행 결과는 `Page Count is 1`)
- **Q.** [예제 2-5]의 실행 결과는? → **A.** 0부터 10까지의 짝수 `0`, `2`, `4`, `6`, `8`, `10`이 한 줄에 하나씩 출력
- **Q.** `int a = 10; int b = 20; int c = 30;` 뒤의 `<%=a + b + c %>` 출력은? → **A.** `60` ([예제 2-7])
- **Q.** JSP 주석 태그의 구문과 특징은? → **A.** `<%-- JSP 주석 처리 내용 --%>` — JSP 컨테이너가 무시하며, 브라우저 출력이나 소스 보기에도 표시되지 않고 실행되지 않음
- **Q.** 주석 안에 정의되지 않은 변수 `name`을 출력하는 코드가 있을 때, HTML 주석과 JSP 주석의 차이는? → **A.** HTML 주석은 안의 표현문·스크립틀릿이 컴파일되므로 변수 미정의 오류가 나고, JSP 주석은 안의 코드를 모두 무시하므로 오류가 나지 않음
- **Q.** [북마켓] 시작 페이지에서 `greeting`·`tagline`은 어떤 태그로 선언·출력하며, 부트스트랩은 어떻게 적용했나? → **A.** 선언문 태그로 선언하고 표현문 태그로 출력, 부트스트랩 5.3(`bootstrap@5.3.1`의 `bootstrap.min.css`)을 CDN `<link>`로 연결

## 🔗 참고 자료
- [Jakarta Pages 사양 원문 (jakartaee/pages · server-pages-spec-body.adoc)](https://github.com/jakartaee/pages/blob/main/spec/src/main/asciidoc/server-pages-spec-body.adoc) — Comments(JSP·HTML 주석), Declarations·Scriptlets·Expressions, Scripting 장의 Declarations Section·Main Section(번역 규칙, `out.print(expression)`)
- [Jakarta Servlet 6.1 사양 (PDF)](https://jakarta.ee/specifications/servlet/6.1/jakarta-servlet-spec-6.1.pdf) — §2.2 서블릿 선언당 인스턴스 1개, §2.3.3.1 동시 요청 처리
- [Tomcat 11 JSP API — HttpJspPage](https://tomcat.apache.org/tomcat-11.0-doc/jspapi/jakarta/servlet/jsp/HttpJspPage.html) — `_jspService()`는 JSP 본문에 해당, 컨테이너가 자동 정의
- [Tomcat 11 JSP API — JspWriter](https://tomcat.apache.org/tomcat-11.0-doc/jspapi/jakarta/servlet/jsp/JspWriter.html) — `println()`의 줄 구분 문자, `print(Object)`의 `String.valueOf`
- [Tomcat 11 Servlet API — ServletResponse](https://tomcat.apache.org/tomcat-11.0-doc/servletapi/jakarta/servlet/ServletResponse.html) — `setContentType(String)` 메소드 이름
- [Tomcat 11 Introduction](https://tomcat.apache.org/tomcat-11.0-doc/introduction.html) — CATALINA_HOME·CATALINA_BASE, `work` 폴더
- [Tomcat 11 Host 설정 — workDir](https://tomcat.apache.org/tomcat-11.0-doc/config/host.html) — `$CATALINA_BASE/work` 아래 앱별 작업 폴더, `jakarta.servlet.context.tempdir`
- [Tomcat 11 Jasper How-To](https://tomcat.apache.org/tomcat-11.0-doc/jasper-howto.html) — `scratchdir` 기본값(웹 앱 작업 폴더), `keepgenerated`, 패키지 `org.apache.jsp`
- [IntelliJ IDEA — Application Servers 설정](https://www.jetbrains.com/help/idea/2025.2/application-servers-settings.html) — Tomcat base directory로 CATALINA_BASE 지정
- [MDN — HTML Comments](https://developer.mozilla.org/en-US/docs/Web/HTML/Guides/Comments) — 주석은 화면에 보이지 않고 코드에만 있음
- [MDN — Handling whitespace](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Whitespace_in_the_DOM) — 소스의 줄바꿈은 공백으로, 연속 공백은 하나로 처리
- [Bootstrap Icons — house-dash-fill](https://icons.getbootstrap.com/icons/house-dash-fill/) — 집 아이콘 path(`l6.646`, `13.5`) 비교
- [W3C SVG Paths — Error handling in path data](https://w3c.github.io/svgwg/specs/paths/) — path 데이터 오류 시 오류 명령 직전까지만 렌더링
