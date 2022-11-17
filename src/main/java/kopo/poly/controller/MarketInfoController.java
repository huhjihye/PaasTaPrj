package kopo.poly.controller;

import kopo.poly.dto.MarketInfoDTO;
import kopo.poly.service.IMarketInfoService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.EncryptUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@RequestMapping(value="/market")
@Controller
public class MarketInfoController {
    @Resource(name = "MarketInfoService")
    private IMarketInfoService marketInfoService;


    //마켓 회원가입 페이지 이동
    @GetMapping(value = "MarketRegForm")
    public String MarketRegForm(){
        log.info(this.getClass().getName() + ".market/marketRegForm ok!");

        return "/market/MarketRegFormtest";
    }

    //회원가입로직 처리
    @PostMapping(value = "insertMarketInfo")
    public String insertMarketInfo(HttpServletRequest request, ModelMap model) throws Exception{
        log.info(this.getClass().getName() + ".insertMarketInfo start!");

        //회원가입 결과에 대한 메시지를 전달할 변수 스윗알러트 사용
        String alt_title = "";
        String msg = "";
        String alt_state = "";
        String url = "";

        //웹(회원정보 입력화면)에서 받는 정보를 저장할 변수
        MarketInfoDTO pDTO = null;

        try {

            String marketId = CmmUtil.nvl(request.getParameter("marketId"));
            String email = CmmUtil.nvl(request.getParameter("email"));
            String password = CmmUtil.nvl(request.getParameter("password"));
            String marketName = CmmUtil.nvl(request.getParameter("marketName"));
            String addr1 = CmmUtil.nvl(request.getParameter("addr1"));
            String addr2 = CmmUtil.nvl(request.getParameter("addr2"));

            log.info("marketId : " + marketId);
            log.info("email : " + email);
            log.info("password : " + password);
            log.info("marketName : " + marketName);
            log.info("addr1 : " + addr1);
            log.info("addr2 : " + addr2);

            //웹(회원정보 입력화면)에서 받는 정보를 저장할 변수를 메모리에 올리기
            pDTO = new MarketInfoDTO();

            pDTO.setMarketId(marketId);
            pDTO.setEmail(EncryptUtil.encAES128CBC(email));
            pDTO.setPassword(EncryptUtil.encHashSHA256(password));
            pDTO.setMarketName(marketName);
            pDTO.setAddr1(addr1);
            pDTO.setAddr2(addr2);


            //회원가입
            int res = marketInfoService.insertMarketInfo(pDTO);

            log.info("회원가입 결과(res) : " + res);

            if (res == 1){
                alt_title = "회원가입 성공";
                msg = "회원가입에 성공하셨습니다.";
                alt_state = "success";
                url = "market/MarketloginFormtest";
            } else if(res == 2){
                alt_title = "회원가입 실패";
                msg = "이미 가입된 아이디 입니다.";
                alt_state = "error";
                url = "market/MarketRegFormtest";
            } else{
                alt_title = "회원가입 실패";
                msg = "오류로 인해 회원가입이 실패하였습니다.";
                alt_state = "warning";
                url = "market/MarketRegFormtest";
            }
        } catch (Exception e) {
            log.info("회원가입 로직 실패 :" +e.toString());
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            log.info(this.getClass().getName() + ".insertMarketInfo end!");
            //회원가입 여부 결과 메시지 프론트에 전달

            model.addAttribute("alt_title", alt_title);
            model.addAttribute("msg", msg);
            model.addAttribute("alt_state", alt_state);
            model.addAttribute("url", url);
            model.addAttribute("pDTO", pDTO);

            pDTO = null;
        }
        log.info("controller 회원가입 로직 끝 ");

        return "/sweetalert";
    }



    //사업자 로그인 페이지 이동
    @GetMapping(value = "LoginForm")
    public String LoginForm() {
        log.info(this.getClass().getName() + ".market/LoginForm ok!");

        return "/market/MarketloginFormtest";
    }

    //사업자 로그인 로직 실행
    @PostMapping(value = "getMarketLoginCheck")
    public String getMarketLoginCheck(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception{
        log.info(this.getClass().getName() + "getMarketLoginCheck start!");

        //회원가입 결과에 대한 메시지를 전달할 변수 스윗알러트 사용
        String alt_title = "";
        String msg = "";
        String alt_state = "";
        String url = "";

        //로그인 처리 결과를 저장할 변수 (로그인 성공 :1, 아이디,비밀번호 불일치로 인한 실패 : 0, 시스템 에러 :2)
        int res = 0;

        //웹(회원정보 입력화면)에서 받는 정보를 저장할 변수
        MarketInfoDTO pDTO = null;

        try{
            String marketId = CmmUtil.nvl(request.getParameter("marketId"));
            String password = CmmUtil.nvl(request.getParameter("password"));

            log.info("marketId : " + marketId);
            log.info("password : " + password);

            //웹(회원정보 입력화면)에서 받는 정보를 저장할 변수를 메모리에 올리기
            pDTO = new MarketInfoDTO();

            pDTO.setMarketId(marketId);

            //비밀번호는 절대로 복호화되지 않도록 해시 알고리즘으로 암호화
            pDTO.setPassword(EncryptUtil.encHashSHA256(password));

            //로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위해 marketInfoService 호출하기
            res = marketInfoService.getMarketLoginCheck(pDTO);

            log.info("res : " + res);

            if (res == 1) {//로그인 성공
                session.setAttribute("SS_MARKETID", marketId);

                alt_title = "로그인 성공";
                msg = "로그인에 성공하셨습니다.";
                alt_state = "success";
                url = "index";

            }else if(res == 0) { //로그인 실패
                alt_title = "로그인 실패";
                msg = "아이디와 비밀번호를 확인해주세요.";
                alt_state = "error";
                url = "/MarketloginFormtest";
            }
        } catch (Exception e){
            //저장이 실패되면 사용자에게 보여줄 메시지
            res = 2;
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info (this.getClass().getName() + ".getMarketLoginCheck End!");

            /*
            * 로그인 처리 결과를 jsp에 전달하기 위해 변수 사용
            * 숫자 유형의 데이터 타입은 값을 전달하고 받는데 불편함이 있어
            * 문자 유형(string)으로 강제 형변환하여 jsp에 전달
            * */


            model.addAttribute("alt_title", alt_title);
            model.addAttribute("msg", msg);
            model.addAttribute("alt_state", alt_state);
            model.addAttribute("url", url);
            model.addAttribute("res", String.valueOf(res));

            //변수 초기화(메모리 효율때문에)
            pDTO = null;
        }

        return "/sweetalert";
    }



    //사업자등록증 진위여부 확인
    @GetMapping(value = "CheckMarket")
    public String CheckMarket() {
        log.info(this.getClass().getName() + ".checkmark ok!");

        return "/market/CheckMarket";
    }


}
