package EverGrowth.com.EverGrowthserver.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
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

    @Autowired
    CategoriaService categoriaService;  

    @Autowired
    private AlmacenamientoImagenService almacenamientoImagenService;

    public ProductoEntity get(Long id) {
        return productoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Producto not found"));
    }

    public Long create(ProductoEntity oProductoEntity) {
        try {
            CategoriaEntity categoria = oProductoEntity.getCategoria();
            if (categoria != null) {
                CategoriaEntity categoriaById = categoriaRepository.findById(categoria.getId()).orElse(null);
                CategoriaEntity categoriaByNombre = categoriaRepository.findByNombre(categoria.getNombre());

                if (categoriaById != null && categoriaById.equals(categoriaByNombre)) {
                    oProductoEntity.setId(null);
                    oProductoEntity = productoRepository.save(oProductoEntity);
                    return oProductoEntity.getId();
                } else {
                    throw new RuntimeException("La categoría no existe en la base de datos");
                }
            } else {
                throw new RuntimeException("La categoría no puede ser nula");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al crear el producto: " + e.getMessage());
        }
    }

    public ProductoEntity update(ProductoEntity oProductoEntityToSet, MultipartFile nuevaImagen) {
        try {
            ProductoEntity productoExistente = productoRepository.findById(oProductoEntityToSet.getId())
                    .orElseThrow(() -> new RuntimeException(
                            "No se encontró el producto con ID: " + oProductoEntityToSet.getId()));
            productoExistente.setCategoria(oProductoEntityToSet.getCategoria());
            productoExistente.setStock(oProductoEntityToSet.getStock());
            productoExistente.setnombre(oProductoEntityToSet.getnombre());  // Corrected method name
            productoExistente.setprecio(oProductoEntityToSet.getprecio());  // Corrected method name

            return productoRepository.save(productoExistente);
        } catch (Exception e) {
            throw new RuntimeException("Error al actualizar el producto: " + e.getMessage());
        }
    }

    public Long delete(Long id) {
        if (productoRepository.existsById(id)) {  // Changed to existsById for efficiency
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
            page = productoRepository.findByName(filter, oPageable);  // Assuming findByName exists in your repository
        }
        return page;
    }

    public Long populate(Integer amount) {
        Long productosCreados = 0L;

        try {  // Added try block for exception handling
            for (int i = 0; i < amount; i++) {
                ProductoEntity producto = new ProductoEntity();
                producto.setCategoria(categoriaService.getOneRandom());  // Corrected method call
                producto.setStock(DataGenerationHelper.generateRandomStock());
                producto.setnombre("Manzana");  // Corrected method name
                producto.setprecio(DataGenerationHelper.generateRandomPrecio());  // Corrected method name
                productoRepository.save(producto);
                productosCreados++;
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al crear los productos: " + e.getMessage());
        }

        return productosCreados;
    }

    public ProductoEntity getOneRandom() {
        Pageable oPageable = PageRequest.of((int) (Math.random() * productoRepository.count()), 1);
        return productoRepository.findAll(oPageable).getContent().get(0);
    }

    @Transactional
    public Long empty() {
        productoRepository.deleteAll();
        productoRepository.resetAutoIncrement(); 
        productoRepository.flush();
        return productoRepository.count();
    }
}