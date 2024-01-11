package EverGrowth.com.EverGrowthserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import EverGrowth.com.EverGrowthserver.entity.DetallePedidoEntity;

public interface DetallePedidoRepository extends JpaRepository<DetallePedidoEntity, Long> {

     @Modifying
    @Query(value = "ALTER TABLE detalle_pedido AUTO_INCREMENT = 1", nativeQuery = true)
    void resetAutoIncrement();
    
}
