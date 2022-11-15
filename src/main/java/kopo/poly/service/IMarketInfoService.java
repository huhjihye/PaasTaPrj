package kopo.poly.service;

import kopo.poly.dto.MarketInfoDTO;
import org.json.simple.JSONArray;

public interface IMarketInfoService {

    int insertMarketInfo(MarketInfoDTO pDTO) throws Exception;

    int getMarketLoginCheck(MarketInfoDTO pDTO) throws Exception;

    JSONArray checkMarketInfo()throws Exception;
}
