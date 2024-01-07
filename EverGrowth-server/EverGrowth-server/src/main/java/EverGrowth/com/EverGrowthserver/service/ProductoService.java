package EverGrowth.com.EverGrowthserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.helper.DataGenerationHelper;
import EverGrowth.com.EverGrowthserver.repository.CategoriaRepository;
import EverGrowth.com.EverGrowthserver.repository.ProductoRepository;

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

    public Page<ProductoEntity> getPage(Pageable oPageable) {
        return productoRepository.findAll(oPageable);
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
                producto.setImagen("aaaa");
                productoRepository.save(producto);
                productosCreados++;
            } else {
                throw new RuntimeException("La categoría no existe en la base de datos: " + categoriaProducto);
            }
        }
        return productosCreados;
    }

}
