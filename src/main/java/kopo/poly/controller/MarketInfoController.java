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


    //마켓 회원가입 시작
    @GetMapping(value = "MarketRegForm")
    public String marketRegForm(){
        log.info(this.getClass().getName() + ".market/marketRegForm ok!");

        return "/market/MarketRegFormtest";
    }

    //회원가입로직수행
    @PostMapping(value = "insertMarketInfo")
    public String insertMarketInfo(HttpServletRequest request, ModelMap model) throws Exception{
        log.info(this.getClass().getName() + ".insertMarketInfo start!");

        String msg = "";

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

            pDTO = new MarketInfoDTO();

            pDTO.setMarketId(marketId);
            pDTO.setEmail(EncryptUtil.encAES128CBC(email));
            pDTO.setPassword(EncryptUtil.encHashSHA256(password));
            pDTO.setMarketName(marketName);
            pDTO.setAddr1(addr1);
            pDTO.setAddr2(addr2);

            int res = marketInfoService.insertMarketInfo(pDTO);

            log.info("회원가입 결과(res) : " + res);

            if (res == 1){
                msg = "회원가입 되었습니다.";
            } else if(res == 2){
                msg = "이미 가입된 이메일 주소입니다.";
            } else{
                msg = "오류로 인해 회원가입을 실패했습니다.";
            }
        } catch (Exception e) {
            msg = "실패하셨습니다. : " + e;
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            log.info(this.getClass().getName() + ".insertMarketInfo end!");

            model.addAttribute("msg", msg);

            model.addAttribute("pDTO", pDTO);

            pDTO = null;
        }

        return "/market/MarketRegSuccess";
    }

    @GetMapping(value = "LoginForm")
    public String LoginForm() {
        log.info(this.getClass().getName() + ".market/LoginForm ok!");

        return "/market/LoginForm";
    }

    @PostMapping(value = "getMarketLoginCheck")
    public String getMarketLoginCheck(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception{
        log.info(this.getClass().getName() + "getMarketLoginCheck start!");

        int res = 0;

        MarketInfoDTO pDTO = null;

        try{
            String marketId = CmmUtil.nvl(request.getParameter("marketId"));
            String password = CmmUtil.nvl(request.getParameter("password"));

            log.info("marketId : " + marketId);
            log.info("password : " + password);

            pDTO = new MarketInfoDTO();

            pDTO.setMarketId(marketId);

            pDTO.setPassword(EncryptUtil.encHashSHA256(password));

            res = marketInfoService.getMarketLoginCheck(pDTO);

            log.info("res : " + res);

            if (res == 1) {
                session.setAttribute("SS_MARKET_ID", marketId);
            }

        } catch (Exception e){
            res = 2;
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info (this.getClass().getName() + ".insertMarketInfo End!");

            model.addAttribute("res", String.valueOf(res));

            pDTO = null;
        }

        return "/market/LoginResult";
    }

    //사업자등록증 진위여부 확인
    @GetMapping(value = "CheckMarket")
    public String CheckMarket() {
        log.info(this.getClass().getName() + ".checkmark ok!");

        return "/market/CheckMarket";
    }


}
