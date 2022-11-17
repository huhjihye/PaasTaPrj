package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShopListDTO {

    private Long shopSeq; //기본키,순번
    private String shopName; //가게 이름
    private String shopAddr; //가게 주소
    private String shopNumber; //가게 전화번호
    private String shopSite; //가게 사이트
    private String shopContents; //가게 간단 소개
    private String imgPath; //가게 이미지 경로
    private String regId; //등록자 아이디
    private String regDt; //등록일
    private String chgId; //수정자 아이디
    private String chgDt; //수정일
}
