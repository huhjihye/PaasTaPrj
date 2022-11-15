//package kopo.poly.controller;
//
//import kopo.poly.dto.CheckMarketDTO;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.ResponseEntity;
//import org.springframework.util.LinkedMultiValueMap;
//import org.springframework.util.MultiValueMap;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.client.RestTemplate;
//
//import java.io.UnsupportedEncodingException;
//import java.net.URISyntaxException;
//import java.net.URLEncoder;
//
//@Slf4j
//@RestController
//@RequestMapping(value="/market")
//@RequiredArgsConstructor
//public class CheckMarketController {
//
//    private final RestTemplate restTemplate;
//
//    @GetMapping("test")
//    public String test(CheckMarketDTO CheckDTO) throws URISyntaxException, UnsupportedEncodingException {
//        log.info(this.getClass().getName() + "공공데이터 포털 테스트용");
//
//        String apiUrl = "http://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=i6xokwKsdvlwERvOibTsIL6z/x7Y1f3bZZSapli7HQFff1hKKi0qpR1Avr9aof8KZRK4TA/qzJT37gpPvxCt7Q==";
//
////        //사업자등록번호, 등록일자, 대표자성명 필수 받기
////        StringBuffer sb = new StringBuffer();
//////        sb.append("&b_no="+ CheckDTO.getB_no()).append("&start_dt="+CheckDTO.getStart_dt()).append("&p_nm="+CheckDTO.getP_nm());
////        sb.append(apiUrl).append("&b_no=0000000000").append("&start_dt=20000101").append("&p_nm="+ URLEncoder.encode("홍길동","UTF-8"));
////
////
////        log.info(sb.toString());
////
////        URI uri = new URI(sb.toString());
//
//        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
//        params.add("b_no", "0000000000");
//        params.add("start_dt", "20000101");
//        params.add("p_nm", URLEncoder.encode("홍길동","UTF-8"));
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("contentType","application/json");
//        HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(headers,params);
//
//
//        ResponseEntity<String > response = restTemplate.exchange(apiUrl, HttpMethod.POST, httpEntity, String.class);
//        log.info(response.getBody());
//
//        if (String.valueOf(response.getStatusCode()).equals("200")) {
//            return "success";
//        }else{
//            return "false";
//        }
//    }
//
//
//}
