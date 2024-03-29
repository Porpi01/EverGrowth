package EverGrowth.com.EverGrowthserver.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;

public interface ProductoRepository extends JpaRepository<ProductoEntity, Long> {

    @Query("SELECT p FROM ProductoEntity p WHERE p.categoria.id = :categoriaId")
    Page<ProductoEntity> findByCategoria(Long categoriaId, Pageable pageable);




    @Modifying
    @Query(value = "ALTER TABLE producto AUTO_INCREMENT = 1", nativeQuery = true)
    void resetAutoIncrement();

    @Query(value = "SELECT * FROM producto WHERE length(?1) >= 3 AND (nombre LIKE %?1% )", nativeQuery = true)
    Page<ProductoEntity> findByName(String nombre, Pageable oPageable);

}
