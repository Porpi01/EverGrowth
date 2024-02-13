package EverGrowth.com.EverGrowthserver.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import EverGrowth.com.EverGrowthserver.entity.CarritoEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;

public interface CarritoRepository extends JpaRepository<CarritoEntity, Long> {

  Long countByUser(UsuarioEntity user);

  CarritoEntity findByUserAndProducto(UsuarioEntity usuario, ProductoEntity producto);

  @Query("SELECT c FROM CarritoEntity c WHERE c.producto.id = :productoId")
  Page<CarritoEntity> findByProducto(Long productoId, Pageable pageable);

  @Query("SELECT c FROM CarritoEntity c WHERE c.user.id = :userId")
  Page<CarritoEntity> findByUser(Long userId, Pageable pageable);

  @Modifying
  @Query(value = "ALTER TABLE carrito AUTO_INCREMENT = 1", nativeQuery = true)
  void resetAutoIncrement();

  @Query(value = "SELECT c.cantidad * c.producto.precio FROM carrito c WHERE c.id = ?1", nativeQuery = true)
  Double calcularCosteCarrito(Long id);

  @Query(value = "SELECT SUM(c.cantidad * c.producto.precio) FROM carrito c WHERE c.id_usuario = ?1", nativeQuery = true)
  Double calculateTotalCartCost(Long user_id);

}