package dto;

import java.io.Serializable;
import java.util.ArrayList;

public class RoadmapStep implements Serializable {

    private static final long serialVersionUID = 1L;

    private int step;           //단계 번호
    private String title;       //단계 제목
    private String description; //단계 설명
    private ArrayList<Guide> guides = new ArrayList<Guide>(); //이 단계에서 볼 학습 카드

    public RoadmapStep() {
        super();
    }

    public RoadmapStep(int step, String title, String description) {
        this.step = step;
        this.title = title;
        this.description = description;
    }

    public void addGuide(Guide guide) {
        guides.add(guide);
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<Guide> getGuides() {
        return guides;
    }

    public void setGuides(ArrayList<Guide> guides) {
        this.guides = guides;
    }
}
