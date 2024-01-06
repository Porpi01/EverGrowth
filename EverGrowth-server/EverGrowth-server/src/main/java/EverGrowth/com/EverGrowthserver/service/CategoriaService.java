package EverGrowth.com.EverGrowthserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;

import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.helper.DataGenerationHelper;
import EverGrowth.com.EverGrowthserver.repository.CategoriaRepository;

@Service
public class CategoriaService {

    @Autowired
    CategoriaRepository categoriaRepository;

    public CategoriaEntity get(Long id) {
        return categoriaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoria no encontrada"));
    }

    public Long create(CategoriaEntity categoriaEntity) {
        categoriaEntity.setId(null);
        return categoriaRepository.save(categoriaEntity).getId();
    }

    public CategoriaEntity update(CategoriaEntity categoriaEntityToSet) {
        return categoriaRepository.save(categoriaEntityToSet);
    }

    public Long delete(Long id) {
        if (categoriaRepository.findById(id).isPresent()) {
            categoriaRepository.deleteById(id);
            return id;
        } else {
            throw new ResourceNotFoundException("La categoría con el ID " + id + " no existe");
        }
    }
    public Page<CategoriaEntity> getPage(Pageable oPageable) {
        return categoriaRepository.findAll(oPageable);
    }

    public Long populate(Integer amount) {
        for (int i = 0; i < amount; i++) {
            String nombre = DataGenerationHelper.getRandomCategoria();
    
            CategoriaEntity existingCategory = categoriaRepository.findByNombre(nombre);
            if (existingCategory == null) {
                CategoriaEntity categoria = new CategoriaEntity(nombre);
                categoriaRepository.save(categoria);
            }
        }
        return categoriaRepository.count();
    }
}
