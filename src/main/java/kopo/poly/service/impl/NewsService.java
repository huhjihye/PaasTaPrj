package kopo.poly.service.impl;

import kopo.poly.dto.NewsDTO;
import kopo.poly.service.INewsService;
import kopo.poly.util.UrlUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Slf4j
@EnableScheduling
@Service("NewsService")
public class NewsService implements INewsService {



    @Override
    @Scheduled(cron ="0 0 0/1 * * *") //1시간마다 크롤링 스케줄러 설정
    public JSONArray newsList() throws Exception {

        log.info(this.getClass().getName() + "네이버 뉴스 크롤링 시작");

        // 최종 결과를 담을 List 변수 선언
        List<NewsDTO> rList = new ArrayList<>();


        // rDTO는 파싱한 JSON 데이터를 DTO에 담아 ArrayList에 넣음
        NewsDTO rDTO = null;

        // 파이썬 서버 데이터 전송
        // 쿼리 스트링 == REST API 에서 GET 방식 같은 경우 보면
        // newsList를 호출 한다고 했을때 필수로 넣어줘야하는 파라미터 값들이 있어 이걸를 URL에 담어서 전송을 한다
        // ex) http://0.0.0.0:8080/newList?newsId=flora&
        // ? 최초 시작하는 파라미터 값 || 2번쨰 부터 붙는 파라미터 들은 & 연결한다.
        UrlUtil uu = new UrlUtil();

        String url = "http://127.0.0.1:8000"; //호출하는 서버 url
        String api = "/newslist"; //내가 호출하는 주소
        String fullPath = uu.urlReadforString(url + api );  //fullpath = url+api (param == 보낼 데이터) 다 합쳐서 데이터 보내고 결과를 받는다고 생각하기

        log.info("뉴스 데이터 조회 결과는 : " + fullPath);
        log.info("조회결과 타입은 : " + fullPath.getClass());

        JSONArray jsonArray=new JSONArray();

        // fullPath에 데이터가 없으면 1보다 작음
        if (fullPath.length() < 1) {
            log.info("뉴스 데이터 크롤링 결과 조회 데이터 없음");
        } else{
            // JSON 데이터를 파싱하기 위한 객체를 생성
            JSONParser parser = new JSONParser();

            // fullpath를 JSON ARRAY 타입으로 변환
           jsonArray = (JSONArray) parser.parse(fullPath);

        }

        return jsonArray;
    }

    @Scheduled(cron ="0 0 0/1 * * *") //1시간마다 크롤링 스케줄러 설정
    @Override
    public JSONArray enewsList() throws Exception {
        log.info(this.getClass().getName()+"환경부 뉴스 크롤링 시작");

        UrlUtil uu = new UrlUtil();

        String url = "http://127.0.0.1:8000"; //호출하는 서버 url
        String api = "/ennewslist"; //내가 호출하는 주소
        String fullPath = uu.urlReadforString(url + api);  //fullpath = url+api (param == 보낼 데이터) 다 합쳐서 데이터 보내고 결과를 받는다고 생각하기

        log.info("뉴스 데이터 조회 결과는 : " + fullPath);
        log.info("조회결과 타입은 : " + fullPath.getClass());

        JSONArray ejsonArray=new JSONArray();

        // fullPath에 데이터가 없으면 1보다 작음
        if (fullPath.length() < 1) {
            log.info("환경부 뉴스 데이터 크롤링 결과 조회 데이터 없음");
        } else {
            // JSON 데이터를 파싱하기 위한 객체를 생성
            JSONParser eparser = new JSONParser();

            // fullpath를 JSON ARRAY 타입으로 변환
            ejsonArray = (JSONArray) eparser.parse(fullPath);

            }
        return ejsonArray;

    }


}
