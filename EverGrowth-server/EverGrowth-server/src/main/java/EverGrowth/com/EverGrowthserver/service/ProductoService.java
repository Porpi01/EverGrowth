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
    CategoriaService CategoriaService;

    String rutaImagenPreexistente = "EverGrowth-server/EverGrowth-server/imagenes/default1.png";
    public ProductoEntity get(Long id) {
        return productoRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Producto not found"));
    }

    public Long create(ProductoEntity oProductoEntity) {
        try {
            CategoriaEntity categoria = oProductoEntity.getCategoria();
            if (categoria != null) {
                CategoriaEntity categoriaById = categoriaRepository.findById(categoria.getId()).orElse(null);
                CategoriaEntity categoriaByNombre = categoriaRepository.findByNombre(categoria.getNombre());

                if (categoriaById != null && categoriaById.equals(categoriaByNombre)) {

                    oProductoEntity.setId(null);

                    // Guardar la imagen en el producto
                    byte[] imagenBytes = loadImageBytes(rutaImagenPreexistente);
                    oProductoEntity.setImagen(imagenBytes);

                    // Guardar el producto en la base de datos
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
            productoExistente.setnombre(oProductoEntityToSet.getnombre());
            productoExistente.setprecio(oProductoEntityToSet.getprecio());

            if (nuevaImagen != null && !nuevaImagen.isEmpty()) {
                byte[] nuevaImagenBytes = loadImageBytes(nuevaImagen);
                productoExistente.setImagen(nuevaImagenBytes);
            }
            return productoRepository.save(productoExistente);
        } catch (Exception e) {
            throw new RuntimeException("Error al actualizar el producto: " + e.getMessage());
        }
    }

    private byte[] loadImageBytes(MultipartFile imagenFile) {
        try {
            return imagenFile.getBytes();
        } catch (IOException e) {
            throw new RuntimeException("Error al leer la nueva imagen: " + e.getMessage());
        }
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

        try {

            byte[] imagenBytes = loadImageBytes(rutaImagenPreexistente);

            for (int i = 0; i < amount; i++) {
    
              
                    ProductoEntity producto = new ProductoEntity();
                    producto.setCategoria(CategoriaService.getOneRandom());
                    producto.setStock(DataGenerationHelper.generateRandomStock());
                    producto.setnombre("Manzana");
                    producto.setprecio(DataGenerationHelper.generateRandomPrecio());
                    producto.setImagen(imagenBytes);
                    productoRepository.save(producto);
                    productosCreados++;
               
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al crear los productos: " + e.getMessage());
        }

        return productosCreados;
    }

    private byte[] loadImageBytes(String imagePath) {
        try {
            Path path = Paths.get(imagePath);
            return Files.readAllBytes(path);
        } catch (IOException e) {
            throw new RuntimeException("Error al leer la imagen: " + e.getMessage());
        }
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
