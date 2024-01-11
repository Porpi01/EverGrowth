package EverGrowth.com.EverGrowthserver.service;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.ValoracionEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.helper.DataGenerationHelper;
import EverGrowth.com.EverGrowthserver.repository.ProductoRepository;
import EverGrowth.com.EverGrowthserver.repository.UsuarioRepository;
import EverGrowth.com.EverGrowthserver.repository.ValoracionRepository;
import jakarta.transaction.Transactional;

@Service
public class ValoracionService {

    @Autowired
    ValoracionRepository valoracionRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    ProductoRepository productoRepository;

    public ValoracionEntity get(Long id) {
        return valoracionRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Valoracion no encontrada"));
    }

    public Long create(ValoracionEntity ValoracionEntity) {
        ValoracionEntity.setId(null);
        return valoracionRepository.save(ValoracionEntity).getId();
    }

    public ValoracionEntity update(ValoracionEntity ValoracionEntityToSet) {
        return valoracionRepository.save(ValoracionEntityToSet);
    }

    public Long delete(Long id) {
        if (valoracionRepository.findById(id).isPresent()) {
            valoracionRepository.deleteById(id);
            return id;
        } else {
            throw new ResourceNotFoundException("No existe una valoracion con " + id);
        }
    }

    public Page<ValoracionEntity> getPage(Pageable oPageable, String filter) {

        Page<ValoracionEntity> page;

        if (filter == null || filter.isEmpty() || filter.trim().isEmpty()) {
            page = valoracionRepository.findAll(oPageable);
        } else {
            page = valoracionRepository.findByMensaje(
                    filter, oPageable);
        }
        return page;
    }

    public Long populate(Integer amount) {

        UsuarioEntity usuarioporDefecto = usuarioRepository.findById(1L)
                .orElseThrow(() -> new IllegalArgumentException("No se encontró un usuario por defecto con ID 1"));
        ProductoEntity productoporDefecto = productoRepository.findById(9L)
                .orElseThrow(() -> new IllegalArgumentException("No se encontró un producto por defecto con ID 1"));

        for (int i = 0; i < amount; i++) {
            ValoracionEntity valoracion = new ValoracionEntity();
            valoracion.setFecha(LocalDateTime.now());
            valoracion.setMensaje(DataGenerationHelper.getSpeech(1));
            valoracion.setUser(usuarioporDefecto);
            valoracion.setProducto(productoporDefecto);

            valoracionRepository.save(valoracion);
        }
        return amount.longValue();
    }

    @Transactional
    public Long empty() {

        valoracionRepository.deleteAll();
        valoracionRepository.resetAutoIncrement();
        valoracionRepository.flush();
        return valoracionRepository.count();
    }

}
