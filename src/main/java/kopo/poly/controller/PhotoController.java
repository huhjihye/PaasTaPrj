package kopo.poly.controller;

import kopo.poly.service.IPhotoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Controller
@RequestMapping("/photo")
@RequiredArgsConstructor
public class PhotoController {

    private final IPhotoService PhotoService;

    @GetMapping(value = "upload")
    public String upload(){
        log.info(this.getClass().getName()+"업로드 페이지 시작");
        return "photo/upload";
    }

    //재활용 사진 판별하기
    @PostMapping("/insertFile")
    public String insertFile(ModelMap model, @RequestParam("file")MultipartFile mft)throws Exception{
        log.info(this.getClass().getName()+"사진 업로드 시작 ");

        String url = String.valueOf(PhotoService.insertFile(mft));
        model.addAttribute("url", url);

        log.info(this.getClass().getName()+"사진 업로드 종료 ");
        return "photo/upload";
    }




}
