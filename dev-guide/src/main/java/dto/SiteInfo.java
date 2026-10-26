package dto;

import java.io.Serializable;

//소개 페이지에서 jsp:setProperty, jsp:getProperty로 다루는 사이트 정보
public class SiteInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String name;    //사이트 이름
    private String purpose; //만든 목적
    private String course;  //과목
    private String author;  //만든 사람

    public SiteInfo() {
        super();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
