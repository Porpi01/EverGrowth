package EverGrowth.com.EverGrowthserver.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.PedidoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;

import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.helper.DataGenerationHelper;
import EverGrowth.com.EverGrowthserver.repository.UsuarioRepository;
import jakarta.transaction.Transactional;
import EverGrowth.com.EverGrowthserver.repository.PedidoRepository;

@Service
public class PedidoService {

    @Autowired
    PedidoRepository pedidoRepository;

    @Autowired
    UsuarioRepository UsuarioRepository;

    public PedidoEntity get(Long id) {
        return pedidoRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Pedido not found"));
    }

    public Long create(PedidoEntity oPedidoEntity) {
        oPedidoEntity.setId(null);
        return pedidoRepository.save(oPedidoEntity).getId();
    }

    public PedidoEntity update(PedidoEntity oPedidoEntityToSet) {
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

    public Page<PedidoEntity> getPage(Pageable oPageable) {
        return pedidoRepository.findAll(oPageable);
    }

    public Long populate(Integer amount) {
        UsuarioEntity usuario = UsuarioRepository.findById(1L)
                .orElseThrow(() -> new IllegalArgumentException("No se encontró un usuario por defecto con ID 1"));
        for (int i = 0; i < amount; i++) {
            PedidoEntity pedido = new PedidoEntity();
            pedido.setUser(usuario);
            pedido.setEstado_pedido(false);
            pedido.setFecha_entrega(DataGenerationHelper.getRadomDate());
            pedido.setFecha_pedido(LocalDateTime.now());

            pedidoRepository.save(pedido);
        }
        return amount.longValue();
    }
  @Transactional
    public Long empty() {

        pedidoRepository.deleteAll();
        pedidoRepository.resetAutoIncrement();
        pedidoRepository.flush();
        return pedidoRepository.count();
    }


}
