package EverGrowth.com.EverGrowthserver.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;
import EverGrowth.com.EverGrowthserver.service.CategoriaService;





@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 3600)
@RestController
@RequestMapping("/categoria")
public class CategoriaAPI {
    
   @Autowired
    private CategoriaService oCategoriaService;

    @GetMapping("/{id}")
    public ResponseEntity<CategoriaEntity> get(@PathVariable("id") Long id) {
        return ResponseEntity.ok(oCategoriaService.get(id));
    }

    @PostMapping("")
    public ResponseEntity<Long> create(@RequestBody CategoriaEntity oCategoriaEntity) {
        return ResponseEntity.ok(oCategoriaService.create(oCategoriaEntity));
    }

    @PutMapping("")
    public ResponseEntity<CategoriaEntity> update(@RequestBody CategoriaEntity oCategoriaEntity) {
        return ResponseEntity.ok(oCategoriaService.update(oCategoriaEntity));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(@PathVariable("id") Long id) {
        return ResponseEntity.ok(oCategoriaService.delete(id));
    }

    @GetMapping("")
    public ResponseEntity<Page<CategoriaEntity>> getPage(Pageable oPageable) {
        return ResponseEntity.ok(oCategoriaService.getPage(oPageable));
    }

    @PostMapping("/populate/{amount}")
    public ResponseEntity<Long> populate(@PathVariable("amount") Integer amount) {
        return ResponseEntity.ok(oCategoriaService.populate(amount));
    }

}
