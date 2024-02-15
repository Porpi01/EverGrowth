package EverGrowth.com.EverGrowthserver.service;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import EverGrowth.com.EverGrowthserver.entity.CarritoEntity;
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

    @Autowired
    CarritoService oCarritoService;

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

    public Page<PedidoEntity> getPage(Pageable oPageable, Long id_usuario) {
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

    public Long generarFactura(Long idPedido) {
        PedidoEntity pedido = get(idPedido);
    
        // Crea una nueva instancia de PedidoEntity para representar la factura
        PedidoEntity factura = new PedidoEntity();
        factura.setId_factura(null);
        factura.setFecha_entrega(pedido.getFecha_entrega());
        factura.setFecha_pedido(pedido.getFecha_pedido());
        factura.setEstado_pedido(false);
    
        pedidoRepository.save(factura);
    
        pedido.setId_factura(factura.getId());
    
        update(pedido);
    
        return factura.getId();
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
    public PedidoEntity realizarCompraProducto(ProductoEntity oProductoEntity, UsuarioEntity oUsuarioEntity,
            int cantidad) {

        sesionService.onlyAdminsOrUsersWithIisOwnData(oUsuarioEntity.getId());

        PedidoEntity oPedidoEntity = new PedidoEntity();

        oPedidoEntity.setUser(oUsuarioEntity);
        oPedidoEntity.setFecha_pedido(LocalDateTime.now());
        oPedidoEntity.setEstado_pedido(false);
        oPedidoEntity.setFecha_entrega(DataGenerationHelper.getRadomDate());

        pedidoRepository.save(oPedidoEntity);

        DetallePedidoEntity oDetallePedidoEntity = new DetallePedidoEntity();
        oDetallePedidoEntity.setId(null);
        oDetallePedidoEntity.setPrecio_unitario(oProductoEntity.getprecio());
        oDetallePedidoEntity.setCantidad(cantidad);
        oDetallePedidoEntity.setPedidos(oPedidoEntity);
        oDetallePedidoEntity.setProductos(oProductoEntity);


        detallePedidoRepository.save(oDetallePedidoEntity);

        oProductoService.actualizarStock(oProductoEntity, cantidad);

        return oPedidoEntity;
    }

    @Transactional
    public PedidoEntity realizarCompraUnicoCarrito(CarritoEntity oCarritoEntity, UsuarioEntity oUsuarioEntity) {

        sesionService.onlyAdminsOrUsersWithIisOwnData(oUsuarioEntity.getId());

        PedidoEntity oPedidoEntity = new PedidoEntity();

        oPedidoEntity.setUser(oUsuarioEntity);
        oPedidoEntity.setFecha_pedido(LocalDateTime.now());
        oPedidoEntity.setEstado_pedido(false);
        oPedidoEntity.setFecha_entrega(DataGenerationHelper.getRadomDate());

        pedidoRepository.save(oPedidoEntity);

        DetallePedidoEntity oDetallePedidoEntity = new DetallePedidoEntity();
        oDetallePedidoEntity.setId(null);
        oDetallePedidoEntity.setPrecio_unitario(oCarritoEntity.getProducto().getprecio());
        oDetallePedidoEntity.setCantidad(oCarritoEntity.getCantidad());
        oDetallePedidoEntity.setPedidos(oPedidoEntity);
        oDetallePedidoEntity.setProductos(oCarritoEntity.getProducto());

        detallePedidoRepository.save(oDetallePedidoEntity);
        ProductoEntity producto = oCarritoEntity.getProducto();
        oProductoService.actualizarStock(producto, oCarritoEntity.getCantidad());

        oCarritoService.delete(oCarritoEntity.getId());

        return oPedidoEntity;
    }

    @Transactional
    public PedidoEntity realizarCompraTodosCarritos(Page<CarritoEntity> carritos, UsuarioEntity oUsuarioEntity) {

        sesionService.onlyAdminsOrUsersWithIisOwnData(oUsuarioEntity.getId());

        PedidoEntity oPedidoEntity = new PedidoEntity();

        oPedidoEntity.setUser(oUsuarioEntity);
        oPedidoEntity.setFecha_pedido(LocalDateTime.now());
        oPedidoEntity.setEstado_pedido(false);
        oPedidoEntity.setFecha_entrega(DataGenerationHelper.getRadomDate());

        pedidoRepository.save(oPedidoEntity);

        carritos = oCarritoService.getCarritoByUsuario(oUsuarioEntity.getId(), PageRequest.of(0, 1000));

        carritos.forEach(carrito -> {
            DetallePedidoEntity oDetallePedidoEntity = new DetallePedidoEntity();
            oDetallePedidoEntity.setId(null);
            oDetallePedidoEntity.setPrecio_unitario(carrito.getProducto().getprecio());
            oDetallePedidoEntity.setCantidad(carrito.getCantidad());
            oDetallePedidoEntity.setPedidos(oPedidoEntity);
            oDetallePedidoEntity.setProductos(carrito.getProducto());
            detallePedidoRepository.save(oDetallePedidoEntity);
            ProductoEntity producto = carrito.getProducto();
            oProductoService.actualizarStock(producto, carrito.getCantidad());
        });

        oCarritoService.deleteByUsuario(oUsuarioEntity.getId());

        return oPedidoEntity;

    }

    public Long cancelarCompra(Long id) {
        PedidoEntity pedido = pedidoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Error: Compra no encontrada."));
        sesionService.onlyAdminsOrUsersWithIisOwnData(pedido.getUser().getId());
        if (pedidoRepository.existsById(id)) {
            Page<DetallePedidoEntity> detallesCompra = detallePedidoRepository.findByPedido(id,
                    PageRequest.of(0, 1000));
            for (DetallePedidoEntity detalleCompra : detallesCompra) {
                ProductoEntity productos = detalleCompra.getProductos();
                int cantidad = detalleCompra.getCantidad();
                oProductoService.actualizarStock(productos, -cantidad);
            }
            detallePedidoRepository.deleteAll(detallesCompra);
            pedidoRepository.deleteById(id);
            return id;
        } else {
            throw new ResourceNotFoundException("Error: La compra no existe.");
        }
    }
}
