package EverGrowth.com.EverGrowthserver.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;

public interface CategoriaRepository extends JpaRepository<CategoriaEntity, Long> {
    
    CategoriaEntity findByNombre(String nombre);

    Optional<CategoriaEntity> findById(Long id);
}
