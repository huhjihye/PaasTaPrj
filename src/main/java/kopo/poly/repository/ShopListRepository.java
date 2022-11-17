package kopo.poly.repository;

import kopo.poly.repository.entity.ShopListEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShopListRepository extends JpaRepository<ShopListEntity, Long> {

    //이름으로 가게 존재 여부 체크
    ShopListEntity findByName(Long name);







}
