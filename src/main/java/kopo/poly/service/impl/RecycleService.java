package kopo.poly.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.poly.dto.RecycleDTO;
import kopo.poly.repository.RecycleRepository;
import kopo.poly.repository.entity.RecycleEntity;
import kopo.poly.service.IRecycleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Slf4j
@Service("RecycleService")
public class RecycleService implements IRecycleService {

    private final RecycleRepository recycleRepository;


    @Override
    public RecycleDTO recycleInfo(String recycleId) throws Exception {
        log.info(this.getClass().getName()+".recycleInfo start");

        RecycleEntity rEntity =recycleRepository.findByRecycleId(recycleId);

        RecycleDTO rDTO =new ObjectMapper().convertValue(rEntity, RecycleDTO.class);

        log.info(this.getClass().getName()+".recycleInfo end");
        return rDTO;
    }
}
