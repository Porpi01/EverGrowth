package EverGrowth.com.EverGrowthserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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
    SesionService sesionService;

    public ProductoEntity get(Long id) {
        return productoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Producto not found"));
    }

    public Long create(ProductoEntity oProductoEntity) {
        sesionService.onlyAdmins();
        oProductoEntity.setId(null);
        return productoRepository.save(oProductoEntity).getId();
    }

    public ProductoEntity update(ProductoEntity oProductoEntityToSet) {
        sesionService.onlyAdmins();
        validateFirstLetterUppercase(oProductoEntityToSet.getnombre());

        return productoRepository.save(oProductoEntityToSet);

    }

    public Long delete(Long id) {
        sesionService.onlyAdmins();
        if (productoRepository.existsById(id)) { // Changed to existsById for efficiency
            productoRepository.deleteById(id);
            return id;
        } else {
            throw new ResourceNotFoundException("El producto con el ID " + id + " no existe");
        }
    }

    public Page<ProductoEntity> getPage(Pageable oPageable, String filter) {
        sesionService.onlyAdmins();
        Page<ProductoEntity> page;

        if (filter == null || filter.isEmpty() || filter.trim().isEmpty()) {
            page = productoRepository.findAll(oPageable);
        } else {
            page = productoRepository.findByName(filter, oPageable); // Assuming findByName exists in your repository
        }
        return page;
    }

    public Long populate(Integer amount) {
        sesionService.onlyAdmins();
            for (int i = 0; i < amount; i++) {
                ProductoEntity producto = new ProductoEntity();
                producto.setCategoria(categoriaService.getOneRandom()); // Corrected method call
                producto.setStock(DataGenerationHelper.generateRandomStock());
                producto.setnombre("Manzana"); // Corrected method name
                producto.setprecio(DataGenerationHelper.generateRandomPrecio()); // Corrected method name
                producto.setImagen( "http://localhost:8085/media/default.jpg");
                productoRepository.save(producto);
            
            } return productoRepository.count();
        }

    public ProductoEntity getOneRandom() {
        Pageable oPageable = PageRequest.of((int) (Math.random() * productoRepository.count()), 1);
        return productoRepository.findAll(oPageable).getContent().get(0);
    }

    private void validateFirstLetterUppercase(String value) {
        if (value != null && !value.isEmpty()) {
            char firstChar = value.charAt(0);
            if (!Character.isLetter(firstChar) || !Character.isUpperCase(firstChar)) {
                throw new RuntimeException("La primera letra de " + value + " debe estar en mayúscula");
            }
        }
    }

    @Transactional
    public Long empty() {
        sesionService.onlyAdmins();
        productoRepository.deleteAll();
        productoRepository.resetAutoIncrement();
        productoRepository.flush();
        return productoRepository.count();
    }
}