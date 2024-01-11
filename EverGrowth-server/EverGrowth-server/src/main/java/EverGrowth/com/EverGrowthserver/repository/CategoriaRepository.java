package EverGrowth.com.EverGrowthserver.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;

public interface CategoriaRepository extends JpaRepository<CategoriaEntity, Long> {
    
    CategoriaEntity findByNombre(String nombre);

    Optional<CategoriaEntity> findById(Long id);

     @Modifying
    @Query(value = "ALTER TABLE categoria AUTO_INCREMENT = 1", nativeQuery = true)
    void resetAutoIncrement();
}
