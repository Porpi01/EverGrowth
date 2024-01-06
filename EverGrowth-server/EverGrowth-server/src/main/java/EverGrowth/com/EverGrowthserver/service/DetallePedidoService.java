package EverGrowth.com.EverGrowthserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.DetallePedidoEntity;
import EverGrowth.com.EverGrowthserver.entity.PedidoEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.repository.DetallePedidoRepository;
import EverGrowth.com.EverGrowthserver.repository.PedidoRepository;
import EverGrowth.com.EverGrowthserver.repository.ProductoRepository;

@Service
public class DetallePedidoService {

    @Autowired
    DetallePedidoRepository detallePedidoRepository;

    @Autowired
    PedidoRepository pedidoRepository;

    @Autowired
    ProductoRepository productoRepository;

    public DetallePedidoEntity get(Long id) {
        return detallePedidoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoria no encontrada"));
    }

    public Long create(DetallePedidoEntity DetallePedidoEntity) {
        DetallePedidoEntity.setId(null);
        return detallePedidoRepository.save(DetallePedidoEntity).getId();
    }

    public DetallePedidoEntity update(DetallePedidoEntity DetallePedidoEntityToSet) {
        return detallePedidoRepository.save(DetallePedidoEntityToSet);
    }

    public Long delete(Long id) {
        if (detallePedidoRepository.findById(id).isPresent()) {
            detallePedidoRepository.deleteById(id);
            return id;
        } else {
            throw new ResourceNotFoundException("No existe un detalle pedido con " + id);
        }
    }

    public Page<DetallePedidoEntity> getPage(Pageable oPageable) {
        return detallePedidoRepository.findAll(oPageable);
    }

    public Long populate(Integer amount) {

        PedidoEntity pedidoporDefecto = pedidoRepository.findById(1L)
                .orElseThrow(() -> new IllegalArgumentException("No se encontró un pedido por defecto con ID 1"));
        ProductoEntity productoporDefecto = productoRepository.findById(1L)
                .orElseThrow(() -> new IllegalArgumentException("No se encontró un producto por defecto con ID 1"));

        for (int i = 0; i < amount; i++) {
            DetallePedidoEntity detallePedido = new DetallePedidoEntity();
            detallePedido.setCantidad(12);
            detallePedido.setPrecio_unitario((float) 0.45);
            detallePedido.setPedidos(pedidoporDefecto);
            detallePedido.setProductos(productoporDefecto);

            detallePedidoRepository.save(detallePedido);
        }
        return amount.longValue();
    }

}
