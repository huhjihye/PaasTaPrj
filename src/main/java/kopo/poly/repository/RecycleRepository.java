package kopo.poly.repository;

import kopo.poly.repository.entity.RecycleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface RecycleRepository extends JpaRepository<RecycleEntity, String> {

   RecycleEntity findByRecycleId (String recycleId);
}
