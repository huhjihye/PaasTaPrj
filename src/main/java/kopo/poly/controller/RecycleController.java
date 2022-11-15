package kopo.poly.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/photo")
public class RecycleController {


    @GetMapping(value="/uploadimg")
    public String uploadimg()throws Exception{
        log.info(this.getClass().getName()+"이미지 업로드 시작 !");

        return "photo/recycle";
    }

    @GetMapping(value="/uploadimg2")
    public String uploadimg2()throws Exception{
        log.info(this.getClass().getName()+"이미지 업로드 시작 !");

        return "photo/upload";
    }


}
