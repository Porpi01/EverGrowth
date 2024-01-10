package EverGrowth.com.EverGrowthserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.CarritoEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.repository.CarritoRepository;
import EverGrowth.com.EverGrowthserver.repository.ProductoRepository;
import EverGrowth.com.EverGrowthserver.repository.UsuarioRepository;

@Service
public class CarritoService {

    @Autowired
    CarritoRepository carritoRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    ProductoRepository productoRepository;

    public CarritoEntity get(Long id) {
        return carritoRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Carrito no encontrado"));
    }
 
    public Long count(UsuarioEntity user) {
        return carritoRepository.countByUser(user);
    }

    public Long create(CarritoEntity carritoEntity) {
        carritoEntity.setId(null);
        return carritoRepository.save(carritoEntity).getId();
    }

    public CarritoEntity update(CarritoEntity carritoEntityToSet) {

        return carritoRepository.save(carritoEntityToSet);

    }

    public Long delete(Long id) {
        carritoRepository.deleteById(id);
        return id;
    }

    public Page<CarritoEntity> getPage(Pageable oPageable) {
        return carritoRepository.findAll(oPageable);
    }

    public Long populate(Integer amount) {
        UsuarioEntity clientePorDefecto = usuarioRepository.findById(1L)
                .orElseThrow(() -> new IllegalArgumentException("No se encontró un usuario por defecto con ID 1"));

        ProductoEntity productoPorDefecto = productoRepository.findById(9L)
                .orElseThrow(() -> new IllegalArgumentException("No se encontró un producto por defecto con ID 1"));

        for (int i = 0; i < amount; i++) {
            CarritoEntity carrito = new CarritoEntity();
            carrito.setUser(clientePorDefecto);
            carrito.setCantidad(0);
            carrito.setProducto(productoPorDefecto);
            carritoRepository.save(carrito);
        }

        return amount.longValue();
    }

}
