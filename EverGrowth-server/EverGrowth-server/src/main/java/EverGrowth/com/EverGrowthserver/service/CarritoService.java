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

    public Page<CarritoEntity> getPage(Pageable oPageable) {
        sesionService.onlyAdminsOrUsers();
        return carritoRepository.findAll(oPageable);
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

    @Transactional
    public Long empty() {
        sesionService.onlyAdmins();
        carritoRepository.deleteAll();
        carritoRepository.resetAutoIncrement();
        carritoRepository.flush();
        return carritoRepository.count();
    }

    
}
