package kopo.poly.repository;

import kopo.poly.repository.entity.MarketInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MarketInfoRepository extends JpaRepository<MarketInfoEntity, String> {

    Optional<MarketInfoEntity> findByMarketId(String marketId);

    Optional<MarketInfoEntity> findByMarketIdAndPassword(String marketId, String password);



}
