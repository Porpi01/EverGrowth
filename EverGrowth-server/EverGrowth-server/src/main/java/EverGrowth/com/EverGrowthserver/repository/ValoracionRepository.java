package EverGrowth.com.EverGrowthserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import EverGrowth.com.EverGrowthserver.entity.ValoracionEntity;

public interface ValoracionRepository extends JpaRepository<ValoracionEntity, Long> {
    
 @Modifying
    @Query(value = "ALTER TABLE valoracion AUTO_INCREMENT = 1", nativeQuery = true)
    void resetAutoIncrement();

}
