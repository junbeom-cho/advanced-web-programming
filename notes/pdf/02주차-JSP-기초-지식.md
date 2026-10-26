---
title: "2주차 — JSP기초지식"
course: "고급웹프로그래밍 (명지대 융합소프트웨어학부)"
week: 2
textbook: "Chapter 01 웹 프로그래밍의 이해"
source: "명지대-고급웹프로그래밍-2주차-JSP기초지식.pdf (슬라이드 57장)"
tags: [고급웹프로그래밍, JSP, 서블릿, 웹서버, 톰캣, 이클립스, JDK, 동적웹프로젝트, 북마켓]
---

# 📘 2주차 — JSP기초지식

> [!NOTE]
> **📚 출처** — Chapter 01 웹 프로그래밍의 이해 (한빛아카데미) 기반 강의자료 (슬라이드 57장)
> PDF 내용만 정리함 (실습 환경 맞춤·외부 보충 없음)

## 🎯 학습 목표
*슬라이드 p.4*

- 웹의 개념과 동작 원리를 이해함
- 서블릿과 JSP의 개념, 특징, 동작 과정을 이해함
- JSP 프로그래밍에 필요한 개발 환경을 구축함
- 동적 웹 프로젝트를 생성하여 간단한 프로그램을 실행함
- 북마켓 프로젝트를 생성함

## 🗺️ 목차
*슬라이드 p.3*

1. 웹과 JSP 프로그래밍의 이해
2. JSP 개발 환경 구축
3. [북마켓] 프로젝트 생성하기

| 목차 | 섹션 표지 | 슬라이드 머리글(소단원) | 예제 | 슬라이드 |
|---|---|---|---|---|
| 1 | Section 01 웹과 웹 프로그래밍의 이해 | 1. 인터넷과 웹의 개요 / 2. 정적 웹 페이지와 동적 웹 페이지 / 3. 서블릿과 JSP / 4. 서블릿과 JSP의 동작 과정 / 5. 서블릿과 JSP 생명 주기 | – | p.5–19 |
| 2 | Section 02 JSP 개발 환경 구축 | 1. 자바 설치하고 환경 설정하기 / 2. 웹 서버와 통합 개발 환경 설치하기 / 3. JSP 애플리케이션 만들고 실행하기 | [예제 1-1]–[예제 1-6] | p.20–49 |
| 3 | Section 03 [북마켓] 프로젝트 생성하기 | [북마켓] 프로젝트 생성하기 | [예제 1-7] | p.50–56 |

---

## 1️⃣ 웹과 웹 프로그래밍의 이해
*슬라이드 p.5–19*

### 1. 인터넷과 웹의 개요
*슬라이드 p.6–7*

- **인터넷**: 컴퓨터가 서로 연결되어 TCP/IP라는 통신 프로토콜을 이용해 정보를 주고받는 전 세계의 컴퓨터 네트워크
- **웹**
  - 인터넷에 연결된 컴퓨터들을 통해 사람들이 정보를 공유할 수 있는 정보 공간
  - 월드 와이드 웹(world wide web)의 줄임말
- **그림 1-1 인터넷과 웹**: '인터넷' 구름 안에 이메일(E-Mail), 웹(WWW), 파일 송수신(FTP), 텔넷(Telnet), … 이 함께 들어 있음
- **웹의 동작 원리**: 웹은 기본적으로 클라이언트/서버 방식으로 동작
- **그림 1-2 서버와 클라이언트의 동작 과정**
  - (a) 서버와 클라이언트: 서버 1대에서 클라이언트 4명에게 연결선이 갈라져 나감
  - (b) 요청 및 응답 과정: 사람 → '요청'(휴대폰 그림) → 건물 → '응답'(음식 그림) → 사람으로 돌아오는 순환 화살표
- **가장 널리 쓰이는 웹 서버**
  - 아파치(Apache)
  - 톰캣(Tomcat)
  - IIS(Internet Information Server)

### 2. 정적 웹 페이지와 동적 웹 페이지
*슬라이드 p.8–10*

- **정적 웹 페이지**
  - 컴퓨터에 저장된 텍스트 파일을 그대로 보는 것
  - HTML(HyperText Markup Language)
- **동적 웹 페이지**
  - 저장된 내용을 다른 변수로 가공 처리하여 보는 것
  - PHP(Personal Home Page), ASP(Active Server Page), JSP

**그림 1-3 정적 웹 페이지의 동작 방식** (p.9)
- 구성: 클라이언트(웹 브라우저) ↔ 인터넷 ↔ 서버(웹 서버, 웹 서버에 준비된 파일 `*.html`)
- ❶ 클라이언트가 웹 페이지 요청
- ❷ 웹 서버가 `*.html` 파일 검색
- ❸ 이미 준비된 HTML 문서를 그대로 전달
- ❹ 웹 브라우저가 HTML 문서를 보여줌

**그림 1-4 동적 웹 페이지의 동작 방식** (p.10)
- 구성: 클라이언트(웹 브라우저) ↔ 인터넷 ↔ 서버(웹 서버) ↔ 웹 애플리케이션 서버 ↔ 데이터베이스
- ❶ 클라이언트가 웹 페이지 요청
- ❷ 웹 서버가 로직 처리를 요청 (웹 서버 → 웹 애플리케이션 서버)
- ❸ 데이터베이스 연동 (웹 애플리케이션 서버 ↔ 데이터베이스)
- ❹ 로직 처리 결과를 보냄 (웹 애플리케이션 서버 → 웹 서버)
- ❺ 요청에 맞게 정제된 HTML 문서를 전달
- ❻ 웹 브라우저가 HTML을 보여줌

### 3. 서블릿과 JSP
*슬라이드 p.11–14 (p.12·p.14 머리글: 3. 웹 프로그래밍 언어의 종류와 특징)*

- **웹 프로그래밍 언어**
  - 클라이언트 측 실행 언어와 서버 측 실행 언어로 구분
  - 자바를 기반으로 하는 JSP는 서버 측 웹 프로그래밍 언어 중 하나
- **서블릿(Servlet)**
  - 자바를 사용하여 웹 페이지를 동적으로 생성하는 서버 측 웹 프로그래밍
  - 웹 서버의 성능을 향상하기 위해 사용되는 자바 클래스의 일종
  - JSP는 HTML 문서 안에 Java 코드를 포함하는 반면, 서블릿은 자바 코드 안에 HTML을 포함함
- **서블릿의 특징**
  - 이식 가능함
  - 효율적이고 확장 가능함
  - 견고함

> [!NOTE]
> **NOTE CGI** (p.12)
> - CGI(Common Gateway Interface) 기술: 웹 서버가 외부 프로그램을 호출하고 HTTP 요청 정보를 외부 프로그램에 넘겨 요청을 처리할 수 있게 함
> - CGI 기술의 문제점
>   - 클라이언트 수가 늘면 응답을 보내는 데 시간이 더 걸림
>   - 요청마다 프로세스를 시작하고, 웹 서버는 시작 프로세스로 제한됨
>   - 플랫폼 의존 언어를 사용함(예 C, C++, perl 등)

- **JSP(Java Server Pages/Jakarta Server Pages)** (p.13)
  - 자바 언어를 기반으로 하는 스크립트 언어
  - HTML 안에 자바 코드를 삽입하여 웹 서버에서 동적으로 웹 페이지를 생성해 웹 브라우저에 전달하는 서버측 스크립트 언어
- **JSP의 특징**
  - 서블릿 기술의 확장
  - 유지 관리가 용이함
  - 빠른 개발이 가능함
  - 개발하면 코드 길이를 줄일 수 있음

> [!NOTE]
> **NOTE 서블릿과 JSP의 차이** (p.14)
>
> | 서블릿 | JSP |
> |---|---|
> | 자바 코드 안에 HTML 태그를 삽입함 | HTML 코드 안에 자바 코드를 삽입함 |
> | HTML 태그를 문자열(`""`)로 처리해야 함 | 자바 코드를 `<% %>` 태그 안에서 처리해야 함 |
> | 자바 코드 수정 시 다시 컴파일하고 배포해야 함 | 키워드가 태그화되어 서블릿에 비해 배우기 쉬움 |

### 4. 서블릿과 JSP의 동작 과정
*슬라이드 p.15–17*

**그림 1-5 서블릿 페이지의 동작 과정** (p.15)
- 구성: 클라이언트(웹 브라우저) ↔ 웹 서버(배포 서술자 → 서블릿 클래스, 그 아래 서블릿 컨테이너)
- ❶ HTTP 요청 (클라이언트 → 웹 서버)
- ❷ 배포 서술자: `web.xml`
- ❸ 서블릿 클래스: `Hello.class` (❷ → ❸ 화살표)
- ❹ HTTP 응답: 가공된 HTML 문서 (웹 서버 → 클라이언트)

**그림 1-6 JSP 페이지의 동작 과정** (p.16)
- 구성: 클라이언트(웹 브라우저) ↔ 웹 서버(JSP 페이지 → 서블릿 프로그램 → 서블릿 클래스, 그 아래 JSP 컨테이너)
- ❶ JSP 요청: `Hello.jsp` (클라이언트 → 웹 서버)
- ❷ 번역: JSP 페이지 `Hello.jsp` → 서블릿 프로그램 `Hello_jsp.java`
- ❸ 컴파일: 서블릿 프로그램 `Hello_jsp.java` → 서블릿 클래스 `Hello_jsp.class`
- ❹ JSP 서블릿 실행 응답: 가공된 HTML 문서 (웹 서버 → 클라이언트)
- ❷ 번역·❸ 컴파일 화살표는 JSP 컨테이너에서 점선으로 이어짐

> [!NOTE]
> **NOTE 서블릿과 JSP의 차이** (p.17) ※ 슬라이드 표기 그대로
> - **웹 서버(Web Server)**: HTTP 프로토콜로 클라이언트(웹 브라우저)의 요청을 받아 HTML이나 오브젝트를 전송함. 웹 서버가 자체적으로 처리할 수 없는 요청은 컨테이너처럼 처리할 수 있는 곳으로 넘겨 처리하기도 함
> - **웹 컨테이너(Web Container)**: JSP와 서블릿을 실행할 수 있는 프로그램으로 서블릿 컨테이너라고도 함. 웹 서버에서 JSP를 요청하면 톰캣은 JSP 파일을 서블릿으로 변환해 컴파일하고, 서블릿의 수행 결과를 웹 서버에 전달함
> - **웹 애플리케이션 서버(Web Application Server)**: 웹에서 사용하는 컴포넌트를 올려놓고 사용하는 서버

### 5. 서블릿과 JSP 생명 주기
*슬라이드 p.18–19*

**그림 1-7 서블릿의 생명 주기** (p.18)

| 단계 | 메서드 |
|---|---|
| ❶ 로딩 | – |
| ❷ 초기화 | `init()` |
| ❸ 실행 | `service()`: `doGet()` `doPost()` |
| ❹ 소멸 | `destroy()` |

- 화살표 흐름: ❶ 로딩 → ❷ 초기화 → ❸ 실행 → ❹ 소멸
- '요청 → 응답' 화살표가 ❸ 실행 단계를 지나감

**그림 1-8 JSP의 생명 주기** (p.19)

| 단계 | 화살표에 표시된 파일 | 메서드 |
|---|---|---|
| ❶ 번역 | `Hello.jsp` → `Hello_jsp.java` | – |
| ❷ 컴파일 | `Hello_jsp.java` → `Hello_jsp.class` | – |
| ❸ 로딩 및 초기화 | – | `jspInit()` |
| ❹ 실행 | – | `_jspService()` |
| ❺ 소멸 | – | `jspDestroy()` |

- '요청 → 응답' 화살표가 ❹ 실행 단계를 지나감

---

## 2️⃣ JSP 개발 환경 구축
*슬라이드 p.20–49*

*캡처 설명에서 **굵은 글씨**는 슬라이드 캡처에 파란 테두리로 강조된 항목임*

### 1. 자바 설치하고 환경 설정하기
*슬라이드 p.21–22*

- **JSP 개발 환경 도구**
  - 자바 개발환경: JDK
  - 웹서버: 톰캣
  - 통합 개발 환경: 이클립스

**표 1-1 JSP 개발 환경 도구**

| 요소 | 프로그램명 | 설명 |
|---|---|---|
| 자바 개발 환경 | JDK | JSP는 HTML 코드 내에 자바 코드를 작성하기 때문에 자바 개발 도구인 JDK가 반드시 설치되어 있어야 한다. |
| 웹 서버 | 톰캣 | 웹 프로그래밍 언어로 작성된 웹 페이지가 실행되어 웹 브라우저에 나타나도록 하기 위해 웹 컨테이너를 설치해야 한다. JSP 웹 컨테이너로 자주 사용되는 것 중에서 가장 유명한 것은 톰캣이다. 톰캣은 오픈소스 프로젝트로서 무료로 누구나 사용할 수 있다. |
| 통합 개발 환경 | 이클립스 | JSP 코드를 작성한 후 이를 컴파일하여 오류를 검사하고 실행 결과를 확인할 수 있는 통합 개발 환경(IDE)으로 개발자들에게 가장 인기 있는 이클립스를 선택하여 설치한다. |

- **자바 개발 키트**: JDK(Java Development Kit)
- **자바 실행 환경**: JRE(Java Runtime Environment)
- **그림 1-9 JDK와 JRE의 관계** (p.22): JDK 상자 안에 JRE, JRE 상자 안에 JVM이 들어 있는 그림
  - JDK: 컴파일러, 디버거, 애플릿뷰어 등
    - JRE: 클래스 로더, 자바 API, 실행 시간 라이브러리 등
      - JVM: JIT, 자바 인터프리터 등

### 🧪 [예제 1-1] JDK 설치하기
*슬라이드 p.23–26*

**1. 오라클 사이트에 접속하기** (p.23)
- `http://www.oracle.com/kr/java`에 접속
- [리소스]-[Java 다운로드]를 클릭
- 캡처: 주소창 `oracle.com/kr/java/`, 상단 메뉴(제품·산업·**리소스**·고객·파트너·개발자·이벤트·기업) → 펼친 고객지원/다운로드 영역(고객 다운로드, 개발자 다운로드, **Java 다운로드**, Java Runtime Environment(JRE) 고객 다운로드)

**2. JDK SE 개발 키트 선택하기** (p.24)
- Java Downloads 화면의 Java SE 개발 키트에서 Java 20 설치
- 플랫폼 탭에서 [Windows]를 선택한 후 [x64 Installer]의 파일을 다운로드
- 캡처: 주소창 `oracle.com/kr/java/technologies/downloads/#jdk20-windows`
  - 상단 탭 Java downloads / Tools and resources / Java archive, 제목 "Java 20 and Java 17 available now"
  - 안내: JDK 20은 Java SE 플랫폼의 최신 릴리스, JDK 17 LTS는 최신 장기 지원 릴리스
  - [JDK 20] 탭 선택 → JDK Development Kit 20.0.1 downloads
  - 안내: JDK 20 바이너리는 Oracle No-Fee Terms and Conditions에 따라 무료 사용·재배포 가능, 2023년 9월 JDK 21로 대체될 때까지 업데이트됨
  - 플랫폼 탭 Linux / macOS / **Windows**

| Product/file description | File size | Download |
|---|---|---|
| x64 Compressed Archive | 180.81 MB | `https://download.oracle.com/java/20/latest/jdk-20_windows-x64_bin.zip` (sha256) |
| x64 Installer | 159.95 MB | **`https://download.oracle.com/java/20/latest/jdk-20_windows-x64_bin.exe` (sha256)** |
| x64 MSI Installer | 158.74 MB | `https://download.oracle.com/java/20/latest/jdk-20_windows-x64_bin.msi` (sha256) |

**3. 자바 설치하기** (p.25)
- Java(TM) SE Development Kit 20.0.1 (64-bit) 설치 마법사 창 3개가 겹친 캡처
  - 시작 화면(Welcome to the Installation …, 20.0.1 — 글자 일부 가려짐) → **[Next >]**
  - 설치 위치 화면(Install Java(TM) SE…, `C:\Program Files…`, 420MB 사용 안내 — 일부 가려짐) → **[Next]**
  - 완료 화면(창 제목 "Java(TM) SE Development Kit 20.0.1 (64-bit) - Complete", "Java(TM) SE Development Kit 20.0.1 (64-bit) Successfully Installed", [Next Steps] 버튼) → **[Close]**

**4. 자바 설치 위치 확인하기** (p.26)
- 탐색기 `내 PC > Windows10 (C:) > Program Files > Java`에 `jdk-20` 폴더 (1개 항목)

### 🧪 [예제 1-2] 자바 환경 변수 설정하기
*슬라이드 p.27–29*

**1. [환경 변수] 대화상자 열기** (p.27)
- **코드 포인트**: ❶ 탐색기의 [내 PC] → ❷ 메뉴의 [속성(R)] → ❸ [시스템] 창(경로 표시줄: 제어판 > 시스템 및 보안 > …)의 [고급 시스템 설정] → ❹ [시스템 속성] 대화상자 [고급] 탭의 [환경 변수(N)...]
- 캡처 속 [시스템] 창의 Windows 버전: Windows 10 Home

**2. 자바 환경 변수 설정하기** (p.28)
- **코드 포인트**
  - ❶ [환경 변수] 대화상자 시스템 변수 영역의 [새로 만들기(W)...]
  - ❷ [시스템 변수 편집]: 변수 이름(N) `JAVA_HOME`, 변수 값(V) `C:\Program Files\Java\jdk-20`
  - ❸ [확인]
  - ❹ 시스템 변수 목록에서 `Path` 선택
  - ❺ [편집(I)...]
  - ❻ [환경 변수 편집]의 [새로 만들기(N)]
  - ❼ `%JAVA_HOME%` 추가
  - ❽ [확인]
  - ❾ [환경 변수] 대화상자의 [확인]
- 캡처 속 기존 값
  - 사용자 변수(YKH): OneDrive `C:\Users\YKH\OneDrive`, Path `C:\Users\YKH\AppData\Local\Microsoft...`, TEMP, TMP
  - 시스템 변수: Path `C:\ProgramData\Oracle\Java\javapath;C:...`, PATHEXT `.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.W...`
  - [환경 변수 편집] 목록: `C:\ProgramData\Oracle\Java\javapath`, `%SystemRoot%\system32`, `%SystemRoot%`, `%SystemRoot%\System32\Wbem`, `%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\`, `%JAVA_HOME%`(❼에서 추가)

**2. 자바에 설정한 환경 변수 확인하기** (p.29) ※ 슬라이드 표기 그대로
- [명령 프롬프트] 창에 `javac -version` 입력
- **실행 결과**: `C:\Users\user>javac -version` → `javac 20.0.1` (창 첫 줄 `Microsoft Windows [Version 10.0.19044.2728]`)

### 2. 웹 서버와 통합 개발 환경 설치하기
*슬라이드 p.30*

- **웹 서버 — 톰캣**
  - 아파치 소프트웨어재단에서 개발한 웹 애플리케이션 서버
  - 자바 만들어진 웹 페이지를 구동하기 위한 엔진 ※ 슬라이드 표기 그대로
- **통합 개발 환경 — 이클립스**
  - 자바 통합 개발 환경(IDE) 중 가장 많이 사용되는 개발 도구
  - 자바를 기반으로 애플리케이션을 개발하기 위해 이클립스를 사용

### 🧪 [예제 1-3] 톰캣 설치하기
*슬라이드 p.31–32*

**1. 아파치 사이트에 접속 및 다운로드하기** (p.31)
- `http://tomcat.apache.org`
- 캡처: 왼쪽 메뉴 Download(Which version?, Tomcat 11 (alpha), **Tomcat 10**, Tomcat 9, Tomcat 8) → 10.1.9 항목 Binary Distributions의 Core 목록(zip, tar.gz, 32-bit Windows zip, **64-bit Windows zip (pgp, sha512)**, 32-bit/64-bit Windows Service Installer)

**2. `apache-tomcat-10.1.9-windows-x64.zip`의 압축을 풀고 하위에 있는 `apache-tomcat-10.1.9` 폴더를 C 드라이브로 옮기기** (p.31)
- 캡처: 탐색기 `내 PC > Windows10 (C:)`에 **`apache-tomcat-10.1.9`** 폴더

> [!NOTE]
> **NOTE 톰캣 버전에 따른 주의 사항** (p.32)
> - **톰캣 9버전 이하를 사용하는 경우**: 기존 자바EE의 API 패키지명 `javax.*`와 기존에 제공되는 자바 라이브러리(`*.jar`)를 그대로 사용하면 됨
> - **톰캣 10버전 이상을 사용하는 경우**: 기존 자바EE에서 변경된 자카르타EE의 API 패키지명 `Jakarta.*`를 사용하므로, 기존 API 패키지명 `javax.*`를 `Jakarta.*`로 변경해야 하고 기존에 제공되는 자바 라이브러리(`*.jar`)는 마이그레이션해서 사용해야 함
> - 이 책은 톰캣 10버전을 사용하며, 이전 자바 라이브러리를 마이그레이션하는 방법은 7장에서 다룸
> - 톰캣 9버전 사용자를 위해 기존 버전의 라이브러리도 제공함 → 자바 라이브러리의 마이그레이션 전·후 파일을 모두 제공

### 🧪 [예제 1-4] 이클립스 다운로드하고 설치하기
*슬라이드 p.33–36*

**1. 이클립스 사이트에 접속하기** (p.33)
- `http://www.eclipse.org/downloads/`
- 캡처: 주소창 `eclipse.org/downloads/`, "Get Eclipse IDE 2023-03" 아래 [Download x86_64] 버튼과 **[Download Packages]** 링크 (오른쪽에 Eclipse Temurin 소개와 [Download Now])

**2. 이클립스 설치 파일 다운로드하기** (p.34)
- 왼쪽 캡처: 주소창 `eclipse.org/downloads/packages/`, Eclipse IDE for Enterprise Java and Web Developers(518 MB, 406,483 DOWNLOADS) 항목의 **Windows x86_64** (그 외 macOS x86_64 | AArch64, Linux x86_64 | AArch64)
  - 패키지 설명: Java·Web 애플리케이션 개발자용 도구 — Java IDE와 JavaScript, TypeScript, JavaServer Pages and Faces, Yaml, Markdown, Web Services, JPA and Data Tools, Maven and Gradle, Git 등 포함
- 오른쪽 캡처: 주소창 `eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2023-03/...`, **[Download]** 버튼
  - Download from: Korea, Republic Of - Kakao Corp. (https)
  - File: `eclipse-jee-2023-03-R-win32-x86_64.zip` (SHA-512)

**3. 설치 완료하고 실행하기** (p.34)
- 탐색기 `내 PC > Windows10 (C:) > eclipse` (11개 항목): dropins, features, p2, plugins, readme, .eclipseproduct, artifacts, **eclipse**(이클립스 아이콘), eclipse, eclipsec

**4. 이클립스 작업 공간 설정하기** (p.35)
- [Eclipse Launcher] — Select a directory as workspace
- Workspace: `C:\Users\YKH\eclipse-workspace` → **[Launch]**
- Use this as the default and do not ask again: 체크 안 됨

**5. 이클립스 실행 화면** (p.36)
- 창 제목 `eclipse-workspace - Eclipse IDE`, Welcome 탭의 "Eclipse IDE for Enterprise Java and Web Developers" 배너 오른쪽 **[Hide]**
- 겹쳐진 작업 화면
  - Project Explorer: 작업 공간에 프로젝트가 없다는 안내와 Create a Maven project, Create a Java EE EAR project, Create a Dynamic Web project, Create an EJB project, Create a Connector project, Create a Java EE application client project, Create a deployable web project, Create a JPA project, Create a project..., Import projects... 링크
  - 오른쪽 Outline, 아래 Markers · Properties · Servers · Data Source Explorer · Snippets · Terminal 탭

### 🧪 [예제 1-5] 이클립스와 톰캣 서버 연동하기
*슬라이드 p.37–40*

**1. Servers 프로젝트 생성하기** (p.37)
- **[File]**-**[New]**-**[Other...]**(Ctrl+N)
- New 하위 메뉴: Maven Project, Enterprise Application Project, Dynamic Web Project, EJB Project, Connector Project, Application Client Project, Static Web Project, JPA Project, Project..., Servlet, Session Bean (EJB 3.x), Message-Driven Bean (EJB 3.x), Web Service, Folder, File, Example..., Other...

**2. 웹 서버 유형 설정하기** (p.38)
- [Select a wizard] (Define a new server): Wizards 목록 Server 폴더의 **[Server]** → **[Next >]**
- [New Server] (Define a New Server / Choose the type of server to create)
  - Select the server type: Apache 아래 Tomcat v3.2 Server부터 Tomcat v10.1 Server까지 나열, [Tomcat v10.1 Server] 선택
  - 설명: J2EE, Java EE, Jakarta EE 웹 프로젝트와 서버 구성을 로컬 Tomcat 서버에 게시·실행
  - Server's host name: `localhost`
  - Server name: **`Tomcat v10.1 Server at localhost`**
  - **[Next >]**

**3. 웹 서버 위치와 JRE 설정하기** (p.39)
- [New Server] — Tomcat Server (Specify the installation directory)
  - Name: `Apache Tomcat v10.1`
  - Tomcat installation directory: **`C:\apache-tomcat-10.1.9`** + **[Browse...]**
  - 그 아래 `apache-tomcat-10.1.5` [Download and Install...] 표시
  - JRE: `Workbench default JRE` ([Installed JREs...])
  - **[Finish]**

**4. 연동 확인하기** (p.40)
- Project Explorer: `Servers > Tomcat v10.1 Server at localhost-config` 아래 `catalina.policy`, `catalina.properties`, `context.xml`, `server.xml`, `tomcat-users.xml`, `web.xml`
- Servers 탭: **`Tomcat v10.1 Server at localhost [Stopp…`** (캡처에서 잘림)
- [Preferences] > Server > Runtime Environments: Server Runtime Environments 목록에 **Name `Apache Tomcat v10.1` / Type `Apache Tomcat v10.1`**

### 3. JSP 애플리케이션 만들고 실행하기
*슬라이드 p.41–42*

- **프로젝트 만들고 실행하기 — 그림 1-10 JSP 애플리케이션 개발 과정** (p.41): 프로젝트 생성하기 → JSP 페이지 작성하기 → 프로젝트 실행하기
- **동적 웹 프로젝트의 구조 — 그림 1-11 동적 웹 프로젝트의 구조** (p.42)

```text
src
└─ main
   └─ webapp
      ├─ WEB-INF
      │  ├─ classes ── class 파일
      │  ├─ lib ────── jar 같은 라이브러리 파일
      │  └─ web.xml
      ├─ JSP 파일
      └─ 정적 리소스 (html, 이미지, css ...)
```

### 🧪 [예제 1-6] 프로젝트 만들고 실행하기
*슬라이드 p.43–49*

📄 `JSPBook/src/main/webapp/hello.jsp`
```jsp
<html>
<head>
<title>Welcome</title>
</head>
<body>
    <h1>Hello JSP!!</h1>
    Hello! Java Server Pages.
</body>
</html>
```
- **실행 결과**: `http://localhost:8080/JSPBook/hello.jsp` → 큰 제목 "Hello JSP!!", 그 아래 "Hello! Java Server Pages." 표시 (p.49, 이클립스 안 브라우저의 Welcome 탭)

**[프로젝트 생성하기]**

**1. 동적 웹 프로젝트 생성하기** (p.43)
- **[File]**-**[New]**-**[Dynamic Web Project]**

**2. 프로젝트 이름 설정하기** (p.44)
- [New Dynamic Web Project]
  - Project name: **`JSPBook`**
  - Project location: Use default location 체크, Location `C:\Users\user\eclipse-workspace\JSPBook`
  - Target runtime: **`Apache Tomcat v10.1`**
  - Dynamic web module version: `5.0`
  - **[Finish]**
- 생성된 Project Explorer: `JSPBook` 아래 Deployment Descriptor: JSPBook, JAX-WS Web Services, Java Resources, build, `src > main > java`, `src > main > webapp`(META-INF, WEB-INF > lib, web.xml) / 별도로 Servers

**3. 프로젝트 구성 설정하기** (p.45)
- [Properties for JSPBook] → **[Project Facets]**
  - Configuration: `<custom>`
  - 체크된 facet: **Dynamic Web Module `5.0`**, Java `17`, JavaScript `1.0`
  - 체크 안 된 facet: Axis2 Web Services, CXF 2.x Web Services 1.0, JavaServer Faces 2.3, JAX-RS (REST Web Services) 1.1, JAXB 2.2, JPA 2.2, WebDoclet (XDoclet) 1.2.3
  - **[Runtimes]** 탭에서 **`Apache Tomcat v10.1`** 체크
  - **[Apply and Close]**

**[JSP 페이지 작성하기]**

**4. JSP 파일 생성하기** (p.46)
- **코드 포인트**: ❶ Project Explorer의 `JSPBook` → ❷ [New] → ❸ [File] → [Create New File] 대화상자에서 ❹ parent folder `JSPBook/src/main/webapp` → ❺ File name `hello.jsp` → ❻ [Finish]

**5. JSP 파일 생성하기** (p.47) ※ 슬라이드 표기 그대로
- `hello.jsp` 편집기에 위 코드 작성 (편집기 행 번호 1–9)

**[프로젝트 실행하기]**

**6. 톰캣 서버에 등록하기** (p.48)
- **코드 포인트**: ❶ [Servers] 탭 → ❷ `Tomcat v10.1 Server at localhost` → ❸ 메뉴의 [Add and Remove...] → ❹ Available의 `JSPBook` → ❺ [Add >] → ❻ (Configured로 `JSPBook` 이동 후) [Finish] → ❼ Servers 뷰 도구 모음의 실행(▶) 아이콘
- 등록 후 Servers 뷰: `Tomcat v10.1 Server at localhost [Stopped, Republish]` 아래 `JSPBook`

**7. 실행 결과 확인하기** (p.49)
- 도구 모음 실행 버튼 드롭다운 → **[Run As]** → **[1 Run on Server]** (Alt+Shift+X, R)
- [Run On Server]: Choose an existing server 선택, `localhost` > `Tomcat v10.1 Server at localhost` (State: Stopped) → **[Finish]**
  - 대화상자 설명: Apache Tomcat v10.1은 J2EE 1.2, 1.3, 1.4, Java EE 5, 6, 7, 8, Jakarta EE 9, 10 웹 모듈을 지원
- [Server] 대화상자(서버 재시작 여부 질문): **[Restart server]** 선택 → **[OK]**
- 결과 화면: 위 **실행 결과** 참고

---

## 3️⃣ [북마켓] 프로젝트 생성하기
*슬라이드 p.50–56*

- **프로젝트 실행 결과 — 그림 1-12 북마켓 프로젝트의 실행** (p.51): 브라우저 탭 `Welcome`, 주소창 `localhost:8080/BookMarket/welcome.jsp`, 화면에 큰 제목 "Welcome to Book Shopping Mall"과 그 아래 "Welcome to Web Market!" 표시

### 🧪 [예제 1-7] 북마켓 프로젝트 만들기
*슬라이드 p.52–56*

📄 `BookMarket/src/main/webapp/welcome.jsp`
```jsp
<html>
<head>
<title>Welcome</title>
</head>
<body>
    <h1>Welcome to Book Shopping Mall</h1>
    <h3>Welcome to Web Market!</h3>
</body>
</html>
```
- **실행 결과**: `localhost:8080/BookMarket/welcome.jsp` → 큰 제목 "Welcome to Book Shopping Mall", 그 아래 "Welcome to Web Market!" 표시 (p.51 그림 1-12)

**[프로젝트 생성하기]**
- [예제 1-6]과 같은 방법으로 BookMarket 프로젝트를 만들고 실행함

**1. 동적 웹 프로젝트 생성하기** (p.52)

**2. 프로젝트 이름 설정하기** (p.52)
- [New Dynamic Web Project]
  - Project name: **`BookMarket`**
  - Use default location 체크, Location `C:\Users\user\eclipse-workspace\BookMarket`
  - Target runtime: **`Apache Tomcat v10.1`**
  - Dynamic web module version: `6.0`
  - Configuration: `Default Configuration for Apache Tomcat v10.1` ([Modify...]) — Apache Tomcat v10.1 런타임용 기본 구성이며 추가 facet은 나중에 설치할 수 있다는 설명
  - EAR membership: Add project to an EAR 체크 안 됨 (EAR project name `EAR`)
  - Working sets: Add project to working sets 체크
  - **[Finish]**
- 오른쪽 Project Explorer 캡처는 `JSPBook` 구조(Deployment Descriptor: JSPBook 등)로 표시됨

**[JSP 페이지 작성하기]**

**3. JSP 파일 생성하기** (p.53)
- [Create New File]: parent folder `BookMarket/src/main/webapp` (트리의 **webapp**), File name **`welcome.jsp`** → **[Finish]**

**4. JSP 페이지 코드 작성하기** (p.54)
- 위 `welcome.jsp` 코드 작성

**[프로젝트 실행하기]**

**5. 톰캣 서버에 등록하기** (p.55)
- [Add and Remove...]: Available의 **`BookMarket`** → **[Add >]** → Configured에 `BookMarket`, `JSPBook` → **[Finish]**
- If server is started, publish changes immediately: 체크됨

**6. 실행 결과 확인하기** (p.56)
- 창 제목 `eclipse-workspace - BookMarket/src/main/webapp/welcome.jsp - Eclipse IDE`
- 도구 모음 실행 버튼 드롭다운 → **[Run As]** → **[1 Run on Server]** (Alt+Shift+X, R)
- Servers 뷰: `Tomcat v10.1 Server at localhost [Started, Restart]` 아래 `JSPBook [Synchronized]`, `BookMarket [Synchronized]`

---

## 🧠 핵심 요약

- **인터넷과 웹**: 인터넷은 TCP/IP로 정보를 주고받는 전 세계 컴퓨터 네트워크, 웹(WWW)은 인터넷에 연결된 컴퓨터로 정보를 공유하는 정보 공간이며 클라이언트/서버 방식으로 동작함
- **대표 웹 서버**: 아파치(Apache), 톰캣(Tomcat), IIS(Internet Information Server)
- **정적 웹 페이지**: 저장된 텍스트 파일(HTML)을 그대로 보여 줌 — 요청 → `*.html` 검색 → 준비된 HTML 그대로 전달 → 브라우저 표시
- **동적 웹 페이지**: 저장된 내용을 가공 처리해 보여 줌(PHP, ASP, JSP) — 웹 서버가 웹 애플리케이션 서버에 로직 처리를 요청하고, 웹 애플리케이션 서버는 데이터베이스와 연동함
- **서블릿 vs JSP**: 서블릿은 자바 코드 안에 HTML, JSP는 HTML 안에 자바 코드(`<% %>`) / JSP는 서블릿 기술의 확장
- **CGI의 문제점**: 클라이언트 증가 시 응답 지연, 요청마다 프로세스 시작, 플랫폼 의존 언어 사용
- **동작 과정**: 서블릿은 HTTP 요청 → 배포 서술자 `web.xml` → 서블릿 클래스 `Hello.class` → HTTP 응답 / JSP는 `Hello.jsp` → 번역 `Hello_jsp.java` → 컴파일 `Hello_jsp.class` → 실행 응답(JSP 컨테이너)
- **생명 주기**: 서블릿은 로딩 → `init()` → `service()`(`doGet()`, `doPost()`) → `destroy()` / JSP는 번역 → 컴파일 → `jspInit()` → `_jspService()` → `jspDestroy()`
- **웹 서버·웹 컨테이너·웹 애플리케이션 서버**: 웹 서버는 HTTP 요청을 받아 HTML·오브젝트 전송, 웹 컨테이너(서블릿 컨테이너)는 JSP·서블릿 실행, 웹 애플리케이션 서버는 웹 컴포넌트를 올려놓고 사용하는 서버
- **개발 환경**: JDK(자바 개발 환경) + 톰캣(웹 서버) + 이클립스(통합 개발 환경) / JDK 안에 JRE, JRE 안에 JVM
- **슬라이드 실습 값**: JDK 20.0.1(`C:\Program Files\Java\jdk-20`, `JAVA_HOME` 등록 후 Path에 `%JAVA_HOME%` 추가, `javac -version` → `javac 20.0.1`), 톰캣 10.1.9(`C:\apache-tomcat-10.1.9`), Eclipse IDE 2023-03(Enterprise Java and Web Developers), 서버 이름 `Tomcat v10.1 Server at localhost`
- **톰캣 버전 주의**: 9버전 이하는 `javax.*`, 10버전 이상은 `Jakarta.*` 패키지명 사용(기존 라이브러리 마이그레이션 필요)
- **동적 웹 프로젝트**: 개발 과정은 프로젝트 생성 → JSP 페이지 작성 → 프로젝트 실행, 구조는 `src/main/webapp` 아래 `WEB-INF`(classes, lib, web.xml)·JSP 파일·정적 리소스
- **실습 결과 주소**: `http://localhost:8080/JSPBook/hello.jsp`, `localhost:8080/BookMarket/welcome.jsp`

## ✍️ 시험 대비 체크포인트

- **Q.** 인터넷과 웹을 각각 정의하면? → **A.** 인터넷: 컴퓨터가 서로 연결되어 TCP/IP 통신 프로토콜로 정보를 주고받는 전 세계 컴퓨터 네트워크 / 웹: 인터넷에 연결된 컴퓨터들을 통해 정보를 공유하는 정보 공간(world wide web의 줄임말), 클라이언트/서버 방식으로 동작
- **Q.** 정적 웹 페이지와 동적 웹 페이지의 차이와 예는? → **A.** 정적: 저장된 텍스트 파일을 그대로 보여 줌(HTML) / 동적: 저장된 내용을 다른 변수로 가공 처리해 보여 줌(PHP, ASP, JSP)
- **Q.** 동적 웹 페이지 동작 방식에서 웹 서버가 로직 처리를 요청하는 대상은? → **A.** 웹 애플리케이션 서버(데이터베이스와 연동한 뒤 로직 처리 결과를 웹 서버로 보냄)
- **Q.** 서블릿과 JSP는 HTML과 자바 코드를 어떻게 섞어 쓰나? → **A.** 서블릿: 자바 코드 안에 HTML 태그 삽입(HTML 태그를 문자열 `""`로 처리) / JSP: HTML 코드 안에 자바 코드 삽입(`<% %>` 태그 안에서 처리)
- **Q.** 서블릿의 특징 3가지는? → **A.** 이식 가능함, 효율적이고 확장 가능함, 견고함
- **Q.** 슬라이드의 JSP 특징은? → **A.** 서블릿 기술의 확장, 유지 관리가 용이함, 빠른 개발이 가능함, 코드 길이를 줄일 수 있음
- **Q.** CGI 기술의 문제점 3가지는? → **A.** 클라이언트 수가 늘면 응답 시간 증가, 요청마다 프로세스 시작(웹 서버는 시작 프로세스로 제한), 플랫폼 의존 언어 사용(C, C++, perl 등)
- **Q.** 서블릿 동작 과정(그림 1-5)에서 HTTP 요청 다음에 거치는 배포 서술자 파일은? → **A.** `web.xml` (이후 서블릿 클래스 `Hello.class`)
- **Q.** JSP 동작 과정에서 `Hello.jsp`를 번역·컴파일하면 생기는 파일은? → **A.** 번역: `Hello_jsp.java`(서블릿 프로그램), 컴파일: `Hello_jsp.class`(서블릿 클래스)
- **Q.** 서블릿 생명 주기의 단계와 메서드는? → **A.** ❶ 로딩 → ❷ 초기화 `init()` → ❸ 실행 `service()`: `doGet()` `doPost()` → ❹ 소멸 `destroy()`
- **Q.** JSP 생명 주기의 단계와 메서드는? → **A.** ❶ 번역 → ❷ 컴파일 → ❸ 로딩 및 초기화 `jspInit()` → ❹ 실행 `_jspService()` → ❺ 소멸 `jspDestroy()`
- **Q.** 웹 컨테이너의 다른 이름과, JSP 요청 시 톰캣이 하는 일은? → **A.** 서블릿 컨테이너 / JSP 파일을 서블릿으로 변환해 컴파일하고, 서블릿 수행 결과를 웹 서버에 전달함
- **Q.** JDK·JRE·JVM의 관계는? → **A.** JDK(컴파일러, 디버거, 애플릿뷰어 등) 안에 JRE(클래스 로더, 자바 API, 실행 시간 라이브러리 등), JRE 안에 JVM(JIT, 자바 인터프리터 등)
- **Q.** 톰캣 10버전 이상을 쓸 때 API 패키지명은? → **A.** `Jakarta.*` (톰캣 9버전 이하는 `javax.*`), 기존 자바 라이브러리(`*.jar`)는 마이그레이션해서 사용
- **Q.** 동적 웹 프로젝트에서 `WEB-INF` 폴더 아래에 있는 것은? → **A.** `classes`(class 파일), `lib`(jar 같은 라이브러리 파일), `web.xml` — 위치는 `src/main/webapp/WEB-INF`
