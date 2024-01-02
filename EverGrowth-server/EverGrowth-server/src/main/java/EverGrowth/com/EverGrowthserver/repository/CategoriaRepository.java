package EverGrowth.com.EverGrowthserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;

public interface CategoriaRepository extends JpaRepository<CategoriaEntity, Long> {
    
}
