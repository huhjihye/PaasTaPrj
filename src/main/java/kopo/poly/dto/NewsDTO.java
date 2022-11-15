package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NewsDTO {
 //내가 파싱하고자 하는 데이터를 선정, 가져올 때 뭘 가져올지 미리 빼서 key값으로 만들어주는것도 좋음 그래야 안헷갈림
    private String title;  //뉴스 제목
    private String url;  //뉴스 url

}
