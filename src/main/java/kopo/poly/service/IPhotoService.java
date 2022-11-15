package kopo.poly.service;

import org.springframework.web.multipart.MultipartFile;

public interface IPhotoService {

    String insertFile(MultipartFile mft) throws Exception;


    //파일이 넣어 올때  이미지 파일을 올리고 서블렛에 매핑이 되서 올라옴 파일을 업로드 할때는 이걸로 받는다. 사실상 파일 경로만 알고 비교 하면 된다. -> 서비스 단으로 뺌


    
}
