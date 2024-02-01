package EverGrowth.com.EverGrowthserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import EverGrowth.com.EverGrowthserver.entity.CarritoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;

public interface CarritoRepository  extends JpaRepository<CarritoEntity, Long>{
    
      Long countByUser(UsuarioEntity user);
      

    @Modifying
    @Query(value = "ALTER TABLE carrito AUTO_INCREMENT = 1", nativeQuery = true)
    void resetAutoIncrement();

}