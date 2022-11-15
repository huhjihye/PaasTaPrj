package kopo.poly.controller.rest;


import kopo.poly.dto.RecycleDTO;
import kopo.poly.service.IRecycleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@Slf4j
@RequestMapping("/photo")
@RequiredArgsConstructor
@RestController
public class RecycleRestController {

        private IRecycleService recycleService;



        @PostMapping("recycleContents")
    public RecycleDTO recycleContents(@RequestParam Map<String,String> rMap)throws Exception{
            log.info(this.getClass().getName()+"recycleContents start");

            RecycleDTO recycleDTO = recycleService.recycleInfo(rMap.get("recycleId"));


            return recycleDTO;
        }
}
