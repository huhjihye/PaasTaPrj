package kopo.poly.controller;

import kopo.poly.dto.NewsDTO;
import kopo.poly.dto.NlpDTO;
import kopo.poly.service.INewsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/news")
public class NewsController {

    private final INewsService newsService;



    //환경부+ 네이버 뉴스 크롤링 합치기
    @GetMapping(value="/twonewslist")
    public String twonewslist(ModelMap model)throws Exception{
        log.info(this.getClass().getName()+"네이버 + 환경부 뉴스 크롤링 시작 ");

        NewsDTO newsDTO = null;
        List<NewsDTO> newsDTOList = new ArrayList<>();

        NewsDTO enewsDTO =null;
        List<NewsDTO> enewsDTOList = new ArrayList<>();

        NlpDTO nlpDTO = null;
        List<NlpDTO> nlpDTOList = new ArrayList<>();

        JSONArray jsonArray = newsService.newsList();
        JSONArray ejsonArray = (JSONArray) newsService.enewsList();

        JSONObject Obj = (JSONObject) jsonArray.get(0);
        JSONObject eObj = (JSONObject) ejsonArray.get(0);

        JSONArray newsArray = (JSONArray) Obj.get("news");
        JSONArray nlpArray = (JSONArray) Obj.get("nlp");
        JSONArray enewsArray = (JSONArray) eObj.get("news");

        //네이버 news 꺼내기
        for (int i = 0; i < newsArray.size(); i++) {
            newsDTO = new NewsDTO();
            JSONObject obj = (JSONObject) newsArray.get(i);

            //string으로 강제로 형변환
            newsDTO.setTitle(String.valueOf(obj.get("title")));
            newsDTO.setUrl(String.valueOf(obj.get("url")));

            newsDTOList.add(newsDTO);
        }

        //환경부 news 꺼내기
        for (int i = 0; i < enewsArray.size(); i++) {
            enewsDTO = new NewsDTO();
            JSONObject eobj = (JSONObject) enewsArray.get(i);

            //string으로 강제로 형변환
            enewsDTO.setTitle(String.valueOf(eobj.get("title")));
            enewsDTO.setUrl(String.valueOf(eobj.get("url")));

            enewsDTOList.add(enewsDTO);
        }

        //네이버 nlp명사 꺼내기
        for (int i = 0; i < 30; i++) {

            nlpDTO = new NlpDTO();

            nlpDTO.setWord((String) nlpArray.get(i));

            nlpDTOList.add(nlpDTO);
            log.info(nlpDTOList.get(i).getWord());
        }

        log.info(this.getClass().getName()+"네이버 + 환경부 뉴스 크롤링 끝 ");

        model.addAttribute("newsDTOList",newsDTOList);
        model.addAttribute("nlpDTOList",nlpDTOList);

        model.addAttribute("enewsDTOList", enewsDTOList);


        return "news/newsList";


    }


//    //네이버 뉴스 크롤링
//    @GetMapping(value = "/newslist")
//    public String newslist(ModelMap model) throws Exception {
//        log.info(this.getClass().getName() + "뉴스 크롤링 시작");
//
//
//        NewsDTO newsDTO = null;
//        List<NewsDTO> newsDTOList = new ArrayList<>();
//
//        NlpDTO nlpDTO = null;
//        List<NlpDTO> nlpDTOList = new ArrayList<>();
//
//        JSONArray jsonArray = newsService.newsList();
//
//        JSONObject Obj = (JSONObject) jsonArray.get(0);
//
//        JSONArray newsArray = (JSONArray) Obj.get("news");
//        JSONArray nlpArray = (JSONArray) Obj.get("nlp");
//
//        //news 꺼내기
//        for (int i = 0; i < newsArray.size(); i++) {
//            newsDTO = new NewsDTO();
//            JSONObject obj = (JSONObject) newsArray.get(i);
//
//            //string으로 강제로 형변환
//            newsDTO.setTitle(String.valueOf(obj.get("title")));
//            newsDTO.setUrl(String.valueOf(obj.get("url")));
//
//            newsDTOList.add(newsDTO);
//        }
//
//        for (int i = 0; i < 30; i++) {
//
//            nlpDTO = new NlpDTO();
//
//            nlpDTO.setWord((String) nlpArray.get(i));
//
//            nlpDTOList.add(nlpDTO);
//            log.info(nlpDTOList.get(i).getWord());
//        }
//
//
//        model.addAttribute("newsDTOList",newsDTOList);
//        model.addAttribute("nlpDTOList",nlpDTOList);
//
//        return "news/news";
//
//    }
//
//
//    //환경부 뉴스 크롤링
//    @GetMapping(value = "/enewslist")
//    public String enewslist(ModelMap model) throws Exception {
//        log.info(this.getClass().getName() + "환경부 뉴스 크롤링 시작");
//
//        NewsDTO enewsDTO =null;
//        List<NewsDTO> enewsDTOList = new ArrayList<>();
//
//        JSONArray ejsonArray = (JSONArray) newsService.enewsList();
//
//        JSONObject eObj = (JSONObject) ejsonArray.get(0);
//
//        JSONArray enewsArray = (JSONArray) eObj.get("news");
//
//        //news 꺼내기
//        for (int i = 0; i < enewsArray.size(); i++) {
//            enewsDTO = new NewsDTO();
//            JSONObject eobj = (JSONObject) enewsArray.get(i);
//
//            //string으로 강제로 형변환
//            enewsDTO.setTitle(String.valueOf(eobj.get("title")));
//            enewsDTO.setUrl(String.valueOf(eobj.get("url")));
//
//            enewsDTOList.add(enewsDTO);
//        }
//
//
//        model.addAttribute("enewsDTOList", enewsDTOList);
//        return "news/test";
//    }

}





