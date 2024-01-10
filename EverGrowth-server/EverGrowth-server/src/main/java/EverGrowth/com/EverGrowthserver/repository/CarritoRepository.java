package EverGrowth.com.EverGrowthserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import EverGrowth.com.EverGrowthserver.entity.CarritoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;

public interface CarritoRepository  extends JpaRepository<CarritoEntity, Long>{
    
      Long countByUser(UsuarioEntity user);

}