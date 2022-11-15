package kopo.poly.controller.rest;

import kopo.poly.dto.MailDTO;
import kopo.poly.service.IMarketInfoService;
import kopo.poly.service.IMarketMailService;
import kopo.poly.util.CmmUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Slf4j
@RequestMapping("/market")
@RequiredArgsConstructor
@Controller
public class MarketMailController {

    private final IMarketInfoService marketInfoService;
    private final IMarketMailService marketMailService;


    private int res =0;
    @ResponseBody
    @PostMapping(value = "sendmail") // 메일 발송하기
    public Map<String, String> sendmail(HttpServletRequest request) throws Exception {
        log.info(this.getClass().getName() + "sendmail start!!");

        String email = CmmUtil.nvl(request.getParameter("email"));
        // 이메일 주소 확인
        log.info("email :" + email);

        Random random = new Random();
        int randomPin = random.nextInt(888888) + 111111; //인증번호

        String title = "반갑습니다. 환영합니다.";
        String contents = "(인증번호 :" + randomPin + ")"; //내용
        log.info("randomPIN: " + randomPin);

        MailDTO mDTO = new MailDTO();
        mDTO.setTomail(email); //이메일 주소
        mDTO.setTitle(title); //제목
        mDTO.setContents(contents); //내용
        mDTO.setRandompin(randomPin); //랜덤인증번호

         int res = marketMailService.doSendmail(mDTO);  //결과값을map으로 받기

        if (res == 1) {
            log.info(this.getClass().getName() + "메일 발송 성공!");
        } else {
            log.info(this.getClass().getName() + "메일 발송 실패!");
        }


        /*jsp에서 실시간으로 res값과 randomPin값을 받기위해 map 형태로 변환*/
        /*AJAX의 반환값은 컨트롤러에서만 바뀌는게 아니라 JSP의 AJAX 구문 datatype도 json이라고 명시해줘야 한다.*/

        Map<String, String> pMap = new HashMap<>();
        pMap.put("res", String.valueOf(res));
        pMap.put("randomPin", String.valueOf(randomPin));

        log.info(this.getClass().getName() + "이메일 보내기 끝!!");
        return pMap;
    }

}
