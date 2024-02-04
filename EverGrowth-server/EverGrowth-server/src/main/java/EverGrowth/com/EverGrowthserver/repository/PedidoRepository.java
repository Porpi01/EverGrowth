package EverGrowth.com.EverGrowthserver.repository;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import EverGrowth.com.EverGrowthserver.entity.PedidoEntity;


public interface PedidoRepository extends JpaRepository<PedidoEntity, Long> {

    Page<PedidoEntity> findByUser(Long id, Pageable oPageable);

    @Modifying
    @Query(value = "ALTER TABLE pedido AUTO_INCREMENT = 1", nativeQuery = true)
    void resetAutoIncrement();

  

}
