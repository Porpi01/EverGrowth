package EverGrowth.com.EverGrowthserver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.CarritoEntity;
import EverGrowth.com.EverGrowthserver.entity.DetallePedidoEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.repository.CarritoRepository;
import EverGrowth.com.EverGrowthserver.repository.ProductoRepository;
import EverGrowth.com.EverGrowthserver.repository.UsuarioRepository;
import jakarta.transaction.Transactional;

@Service
public class CarritoService {

    @Autowired
    CarritoRepository carritoRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    ProductoRepository productoRepository;

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    ProductoService productoService;

    @Autowired
    SesionService sesionService;

    public CarritoEntity get(Long id) {
        return carritoRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Carrito no encontrado"));
    }

    public Long count(UsuarioEntity user) {
        return carritoRepository.countByUser(user);
    }

    public Long create(CarritoEntity carritoEntity) {
        sesionService.onlyAdminsOrUsersWithIisOwnData(carritoEntity.getUser().getId());
        carritoEntity.setId(null);
        return carritoRepository.save(carritoEntity).getId();
    }

    public CarritoEntity update(CarritoEntity carritoEntityToSet) {
        sesionService.onlyAdminsOrUsersWithIisOwnData(carritoEntityToSet.getUser().getId());
        return carritoRepository.save(carritoEntityToSet);

    }

    public Long delete(Long id) {
        carritoRepository.deleteById(id);
        return id;
    }

  public Page<CarritoEntity> getPage(Pageable oPageable, Long id_usuario, Long id_producto) {
        if (id_usuario == 0) {
            if (id_producto == 0) {
                return carritoRepository.findAll(oPageable); 
            } else {
                return carritoRepository.findByProducto(id_producto, oPageable);
            }
        } else {
            if (id_producto == 0) {
                return carritoRepository.findByUser(id_usuario, oPageable);
            } else {
                return Page.empty();
            }
        }
    }

    public Long populate(Integer amount) {

        sesionService.onlyAdmins();
        for (int i = 0; i < amount; i++) {
            CarritoEntity carrito = new CarritoEntity();
            carrito.setUser(usuarioService.getOneRandom());
            carrito.setCantidad(0);
            carrito.setProducto(productoService.getOneRandom());
            carritoRepository.save(carrito);
        }

        return carritoRepository.count();
    }

    public Double calcularCosteCarrito(Long id) {
        return carritoRepository.calcularCosteCarrito(id);
    }

    public Double calcularCosteTotalCarrito(Long usuario_id) {
        return carritoRepository.calculateTotalCartCost(usuario_id);
    }


    @Transactional
    public Long empty() {
        sesionService.onlyAdmins();
        carritoRepository.deleteAll();
        carritoRepository.resetAutoIncrement();
        carritoRepository.flush();
        return carritoRepository.count();
    }

  
    

    
}
