package EverGrowth.com.EverGrowthserver.service;

import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.entity.ValoracionEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.helper.DataGenerationHelper;
import EverGrowth.com.EverGrowthserver.repository.CategoriaRepository;
import EverGrowth.com.EverGrowthserver.repository.ProductoRepository;
import jakarta.transaction.Transactional;

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
        Long categoriaId = oProductoEntity.getCategoria().getId();
        String categoriaNombre = oProductoEntity.getCategoria().getNombre();

        CategoriaEntity categoriaById = categoriaRepository.findById(categoriaId).orElse(null);
        CategoriaEntity categoriaByNombre = categoriaRepository.findByNombre(categoriaNombre);

        if (categoriaById != null && categoriaByNombre != null && categoriaById.equals(categoriaByNombre)) {
            oProductoEntity.setId(null);
            return productoRepository.save(oProductoEntity).getId();
        } else {
            throw new RuntimeException("La categoría no existe en la base de datos");
        }
    }

    public ProductoEntity update(ProductoEntity oProductoEntityToSet) {
        return productoRepository.save(oProductoEntityToSet);
    }

    public Long delete(Long id) {
        if (productoRepository.findById(id).isPresent()) {
            productoRepository.deleteById(id);
            return id;
        } else {
            throw new ResourceNotFoundException("El producto con el ID " + id + " no existe");
        }
    }

    public Page<ProductoEntity> getPage(Pageable oPageable, String filter) {

        Page<ProductoEntity> page;

        if (filter == null || filter.isEmpty() || filter.trim().isEmpty()) {
            page = productoRepository.findAll(oPageable);
        } else {
            page = productoRepository.findByName(
                    filter, oPageable);
        }
        return page;
    }

    public Long populate(Integer amount) {
        Long productosCreados = 0L;
    
        for (int i = 0; i < amount; i++) {
            String randomProducto = DataGenerationHelper.getRandomProducto();
            String categoriaProducto = DataGenerationHelper.asociarCategoria(randomProducto); 
    
            CategoriaEntity categoria = categoriaRepository.findByNombre(categoriaProducto);
            if (categoria != null) {
                ProductoEntity producto = new ProductoEntity();
                producto.setCategoria(categoria);
                producto.setStock(DataGenerationHelper.generateRandomStock());
                producto.setnombre(randomProducto);
                producto.setprecio(DataGenerationHelper.generateRandomPrecio());
                producto.setImagen(null);
                productoRepository.save(producto);
                productosCreados++;
            } else {
                throw new RuntimeException("La categoría no existe en la base de datos: " + categoriaProducto);
            }
        }
        return productosCreados;
    }

  @Transactional
    public Long empty() {

        productoRepository.deleteAll();
        productoRepository.resetAutoIncrement();
        productoRepository.flush();
        return productoRepository.count();
    }


}
