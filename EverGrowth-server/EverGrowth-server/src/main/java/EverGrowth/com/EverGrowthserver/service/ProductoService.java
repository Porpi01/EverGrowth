package EverGrowth.com.EverGrowthserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;
import EverGrowth.com.EverGrowthserver.entity.PedidoEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.helper.DataGenerationHelper;
import EverGrowth.com.EverGrowthserver.repository.CategoriaRepository;
import EverGrowth.com.EverGrowthserver.repository.PedidoRepository;
import EverGrowth.com.EverGrowthserver.repository.ProductoRepository;
import jakarta.servlet.http.HttpServletRequest;

@Service
public class ProductoService {

    @Autowired
    ProductoRepository productoRepository;

    @Autowired
    CategoriaRepository categoriaRepository;

    public ProductoEntity get(Long id) {
        return productoRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Producto not found"));
    }

    public Long create(ProductoEntity oProductoEntity) {
        oProductoEntity.setId(null);
        return productoRepository.save(oProductoEntity).getId();
    }

    public ProductoEntity update(ProductoEntity oProductoEntityToSet) {
        return productoRepository.save(oProductoEntityToSet);
    }

    public Long delete(Long id) {
        productoRepository.deleteById(id);
        return id;
    }

    public Page<ProductoEntity> getPage(Pageable oPageable) {
        return productoRepository.findAll(oPageable);
    }

    public Long populate(Integer amount) {
        CategoriaEntity categoria = categoriaRepository.findById(1L)
                .orElseThrow(() -> new IllegalArgumentException("No se encontró una categoria por defecto con ID 1"));
        for (int i = 0; i < amount; i++) {
            ProductoEntity producto = new ProductoEntity();
            producto.setCategoria(categoria);
            producto.setStock(DataGenerationHelper.generateRandomStock());
            producto.setnombre(DataGenerationHelper.getRandomProducto());
            producto.setprecio(DataGenerationHelper.generateRandomPrecio());
            producto.setImagen("aaaa");
            productoRepository.save(producto);
        }
        return amount.longValue();
    }

}
