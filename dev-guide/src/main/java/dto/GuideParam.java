package dto;

import java.io.Serializable;

//주소의 요청 파라미터(category, id)를 jsp:setProperty로 받아 두는 자바빈즈
public class GuideParam implements Serializable {

    private static final long serialVersionUID = 1L;

    private String category; //분류 코드 (guides.jsp?category=lang)
    private String id;       //학습 카드 ID (guide.jsp?id=java)

    public GuideParam() {
        super();
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    //jsp:getProperty로 화면에 보여 줄 분류 이름
    public String getCategoryName() {
        return Guide.toCategoryName(category);
    }
}
