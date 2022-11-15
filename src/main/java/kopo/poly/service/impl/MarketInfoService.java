package kopo.poly.service.impl;

import kopo.poly.dto.MarketInfoDTO;
import kopo.poly.repository.MarketInfoRepository;
import kopo.poly.repository.entity.MarketInfoEntity;
import kopo.poly.service.IMarketInfoService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.DateUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@Service("MarketInfoService")
public class MarketInfoService implements IMarketInfoService {

    private final MarketInfoRepository marketInfoRepository;

    @Override
    public int insertMarketInfo(MarketInfoDTO pDTO) throws Exception{

        int res = 0;

        String marketId = CmmUtil.nvl(pDTO.getMarketId());
        String email = CmmUtil.nvl(pDTO.getEmail());
        String password = CmmUtil.nvl(pDTO.getPassword());
        String marketName = CmmUtil.nvl(pDTO.getMarketName());
        String addr1 = CmmUtil.nvl(pDTO.getAddr1());
        String addr2 = CmmUtil.nvl(pDTO.getAddr2());


        log.info("marketId : " + marketId);
        log.info("email : " + email);
        log.info("password : " + password);
        log.info("marketName : " + marketName);
        log.info("addr1 : " + addr1);
        log.info("addr2 : " + addr2);

        Optional<MarketInfoEntity> rEntity = marketInfoRepository.findByMarketId(marketId);
        if (rEntity.isPresent()){
            res = 2;
        } else {
            MarketInfoEntity pEntity = MarketInfoEntity.builder()
                    .marketId(marketId).email(email).password(password).marketName(marketName)
                    .addr1(addr1).addr2(addr2)
                    .regId(marketId).regDt(DateUtil.getDateTime("yyyy-MM-dd hh:mm:ss"))
                    .chgId(marketId).chgDt(DateUtil.getDateTime("yyyy-MM-dd hh:mm:ss"))
                    .build();

            marketInfoRepository.save(pEntity);

            rEntity = marketInfoRepository.findByMarketId(marketId);

            if (rEntity.isPresent()){
                res = 1;
            } else{
                res = 0;
            }
        }

        return res;

    }

    @Override
    public int getMarketLoginCheck(MarketInfoDTO pDTO) throws Exception{
        int res = 0;

        String marketId = CmmUtil.nvl(pDTO.getMarketId());
        String password = CmmUtil.nvl(pDTO.getPassword());

        log.info("marketId : " + marketId);
        log.info("password : " + password);

        Optional<MarketInfoEntity> rEntity = marketInfoRepository.findByMarketIdAndPassword(marketId, password);

        if (rEntity.isPresent()){
            res = 1;
        }

        return res;
    }

    @Override
    public JSONArray checkMarketInfo() throws Exception {
        log.info(this.getClass().getName()+"사업자 등록정보 확인 시작 ");

        String url="http://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=[i6xokwKsdvlwERvOibTsIL6z%2Fx7Y1f3bZZSapli7HQFff1hKKi0qpR1Avr9aof8KZRK4TA%2FqzJT37gpPvxCt7Q%3D%3D]&returnType=JSON";




        return null;
    }

}
