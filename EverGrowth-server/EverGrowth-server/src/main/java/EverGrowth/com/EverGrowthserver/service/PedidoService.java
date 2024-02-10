package EverGrowth.com.EverGrowthserver.service;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.DetallePedidoEntity;
import EverGrowth.com.EverGrowthserver.entity.PedidoEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.helper.DataGenerationHelper;
import EverGrowth.com.EverGrowthserver.repository.UsuarioRepository;
import jakarta.transaction.Transactional;
import EverGrowth.com.EverGrowthserver.repository.DetallePedidoRepository;
import EverGrowth.com.EverGrowthserver.repository.PedidoRepository;

@Service
public class PedidoService {

    @Autowired
    PedidoRepository pedidoRepository;

    @Autowired
    UsuarioRepository UsuarioRepository;

    @Autowired
    UsuarioService UsuarioService;

    @Autowired
    SesionService sesionService;

    @Autowired
    ProductoService oProductoService;

    @Autowired
    DetallePedidoRepository detallePedidoRepository;

    public PedidoEntity get(Long id) {
        return pedidoRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Pedido not found"));
    }

    public Long create(PedidoEntity oPedidoEntity) {
        oPedidoEntity.setId(null);
        return pedidoRepository.save(oPedidoEntity).getId();
    }

    public PedidoEntity update(PedidoEntity oPedidoEntityToSet) {
        sesionService.onlyAdmins();
        return pedidoRepository.save(oPedidoEntityToSet);
    }

    public Long delete(Long id) {
        if (pedidoRepository.findById(id).isPresent()) {
            pedidoRepository.deleteById(id);
            return id;
        } else {
            throw new ResourceNotFoundException("El pedido con el ID " + id + " no existe");
        }
    }

   
    public Page<PedidoEntity> getPage(Pageable oPageable,  Long id_usuario) {
    sesionService.onlyAdmins();
      
        if (id_usuario == 0) {
                return pedidoRepository.findAll(oPageable);
            } else {
                return pedidoRepository.findByUser(id_usuario, oPageable);
            }
            }
        
    
    public Long populate(Integer cantidad) {
        sesionService.onlyAdmins();

        for (int i = 0; i < cantidad; i++) {
            PedidoEntity pedido = new PedidoEntity();
            pedido.setUser(UsuarioService.getOneRandom());
            pedido.setEstado_pedido(false);
            pedido.setFecha_entrega(DataGenerationHelper.getRadomDate());
            pedido.setFecha_pedido(LocalDateTime.now());

            pedidoRepository.save(pedido);
        }
        return pedidoRepository.count();
    }

    public PedidoEntity getOneRandom() {

        Pageable oPageable = PageRequest.of((int) (Math.random() * pedidoRepository.count()), 1);
        return pedidoRepository.findAll(oPageable).getContent().get(0);
    }

    @Transactional
    public Long empty() {

        sesionService.onlyAdmins();
        pedidoRepository.deleteAll();
        pedidoRepository.resetAutoIncrement();
        pedidoRepository.flush();
        return pedidoRepository.count();
    }

    
    @Transactional
    public PedidoEntity sumarProducto(ProductoEntity oProductoEntity, UsuarioEntity oUserEntity, int cantidad) {

        sesionService.onlyAdminsOrUsersWithIisOwnData(oUserEntity.getId());

        PedidoEntity oPedidoEntity = new PedidoEntity();

        oPedidoEntity.setUser(oUserEntity);
        oPedidoEntity.setFecha_entrega(DataGenerationHelper.getRadomDate());
        oPedidoEntity.setFecha_pedido(LocalDateTime.now());

        pedidoRepository.save(oPedidoEntity);

        DetallePedidoEntity detallePedidoEntity = new DetallePedidoEntity();
        detallePedidoEntity.setId(null);
        detallePedidoEntity.setProductos(oProductoEntity);
        detallePedidoEntity.setPedidos(oPedidoEntity);
        detallePedidoEntity.setCantidad(cantidad);
        detallePedidoEntity.setPrecio_unitario(oProductoEntity.getprecio());
        
        detallePedidoRepository.save(detallePedidoEntity);

        oProductoService.actualizarStock(oProductoEntity, cantidad);
        return oPedidoEntity;
    }

}
