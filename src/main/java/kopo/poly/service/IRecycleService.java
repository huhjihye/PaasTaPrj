package kopo.poly.service;

import kopo.poly.dto.RecycleDTO;

public interface IRecycleService {
    RecycleDTO recycleInfo(String recycleId)throws Exception;
}
