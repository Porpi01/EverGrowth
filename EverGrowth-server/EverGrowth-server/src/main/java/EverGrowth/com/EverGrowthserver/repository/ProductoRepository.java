package EverGrowth.com.EverGrowthserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;

public interface ProductoRepository extends JpaRepository<ProductoEntity, Long> {
    
}
