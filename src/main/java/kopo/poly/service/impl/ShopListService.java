package kopo.poly.service.impl;


import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.poly.dto.ShopListDTO;
import kopo.poly.repository.ShopListRepository;
import kopo.poly.repository.entity.ShopListEntity;
import kopo.poly.service.IShopListService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service("ShopListService")
public class ShopListService implements IShopListService {

    private final ShopListRepository shopListRepository;


    //가게 정보 리스트 가져오기
    @Override
    public List<ShopListDTO> getShopList() {
        log.info(this.getClass().getName()+"가게 정보 리스트 서비스 시작 ! ");


        // 가게 정보 리스트 조회하기
        List<ShopListEntity> rList = shopListRepository.findAll();

        // 엔티티의 값들을 DTO에 맞게 넣어주기
        List<ShopListDTO> nList =new ObjectMapper().convertValue(rList,
                new TypeReference<List<ShopListDTO>>(){
                });

        log.info(this.getClass().getName()+"가게 정보 리스트 서비스 종료");


        return nList;
    }
}
