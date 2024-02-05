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
        validateFirstLetterUppercase(oProductoEntity.getnombre());
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

    public Page<ProductoEntity> getPage(Pageable oPageable, String filter, Long id_categoria) {
    
      
        if (id_categoria == 0) {
            if (filter == null || filter.isEmpty() || filter.trim().isEmpty()) {
                return productoRepository.findAll(oPageable);
            } else {
                return productoRepository.findByName(filter, oPageable);
            }
        } else {
            return productoRepository.findByCategoria(id_categoria, oPageable);
        }
        }
    

    public Long populate(Integer amount) {
        sesionService.onlyAdmins();
            for (int i = 0; i < amount; i++) {
                ProductoEntity producto = new ProductoEntity();
                producto.setCategoria(categoriaService.getOneRandom());
                producto.setStock(DataGenerationHelper.generateRandomStock());
                producto.setnombre(DataGenerationHelper.generateRandomNombre()); 
                producto.setprecio(DataGenerationHelper.generateRandomPrecio()); 
                producto.setDescripcion("Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.");
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