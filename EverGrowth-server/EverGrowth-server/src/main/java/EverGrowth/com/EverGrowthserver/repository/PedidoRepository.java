package EverGrowth.com.EverGrowthserver.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import EverGrowth.com.EverGrowthserver.entity.PedidoEntity;

public interface PedidoRepository extends JpaRepository<PedidoEntity, Long> {

    @Query("SELECT p FROM PedidoEntity p WHERE p.user.id = :userId")
    Page<PedidoEntity> findByUser(Long userId, Pageable pageable);

    @Modifying
    @Query(value = "ALTER TABLE pedido AUTO_INCREMENT = 1", nativeQuery = true)
    void resetAutoIncrement();

}
