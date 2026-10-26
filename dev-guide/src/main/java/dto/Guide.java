package dto;

import java.io.Serializable;

public class Guide implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;          //학습 카드 ID (주소에 쓰는 값)
    private String name;        //이름
    private String category;    //분류 코드 (lang, web, tool)
    private String level;       //난이도 (입문, 초급, 중급)
    private String logo;        //로고 이미지 파일 이름 (resources/images/logos 폴더)
    private String summary;     //한 줄 소개
    private String description; //자세한 설명
    private String target;      //추천 대상
    private int weeks;          //예상 학습 기간(주)
    private String[] steps;     //학습 순서
    private String helloCode;   //Hello World 예제 코드
    private String docName;     //추천 자료 이름
    private String docUrl;      //추천 자료 주소 (없으면 빈 문자열)

    public Guide() {
        super();
    }

    public Guide(String id, String name, String category, String level) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.level = level;
    }

    //분류 코드를 화면에 보여 줄 이름으로 바꿈 (모르는 코드면 "전체")
    public static String toCategoryName(String category) {
        if ("lang".equals(category)) {
            return "프로그래밍 언어";
        } else if ("web".equals(category)) {
            return "웹 개발";
        } else if ("tool".equals(category)) {
            return "개발 도구";
        }
        return "전체";
    }

    public String getCategoryName() {
        return toCategoryName(category);
    }

    //난이도에 맞는 부트스트랩 배지 색
    public String getLevelColor() {
        if ("입문".equals(level)) {
            return "success";
        } else if ("초급".equals(level)) {
            return "primary";
        }
        return "warning";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    //img 태그의 src에 넣을 로고 경로
    public String getLogoPath() {
        return "./resources/images/logos/" + logo;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public int getWeeks() {
        return weeks;
    }

    public void setWeeks(int weeks) {
        this.weeks = weeks;
    }

    public String[] getSteps() {
        return steps;
    }

    public void setSteps(String[] steps) {
        this.steps = steps;
    }

    public String getHelloCode() {
        return helloCode;
    }

    public void setHelloCode(String helloCode) {
        this.helloCode = helloCode;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getDocUrl() {
        return docUrl;
    }

    public void setDocUrl(String docUrl) {
        this.docUrl = docUrl;
    }
}
