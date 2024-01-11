package EverGrowth.com.EverGrowthserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;

public interface UsuarioRepository extends JpaRepository<UsuarioEntity, Long>{
    
 @Modifying
    @Query(value = "ALTER TABLE usuario AUTO_INCREMENT = 1", nativeQuery = true)
    void resetAutoIncrement();

}
