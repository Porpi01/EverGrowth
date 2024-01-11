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

import EverGrowth.com.EverGrowthserver.entity.ValoracionEntity;

import EverGrowth.com.EverGrowthserver.service.ValoracionService;

@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 3600)
@RestController
@RequestMapping("/valoracion")
public class ValoracionAPI {

    @Autowired
    ValoracionService valoracionService;

    @GetMapping("/{id}")
    public ResponseEntity<ValoracionEntity> get(@PathVariable("id") Long id) {
        return ResponseEntity.ok(valoracionService.get(id));
    }

    @PostMapping("")
    public ResponseEntity<Long> create(@RequestBody ValoracionEntity valoracionEntity) {
        return ResponseEntity.ok(valoracionService.create(valoracionEntity));
    }

    @PutMapping("")
    public ResponseEntity<ValoracionEntity> update(@RequestBody ValoracionEntity ValoracionEntity) {
        return ResponseEntity.ok(valoracionService.update(ValoracionEntity));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(@PathVariable("id") Long id) {
        return ResponseEntity.ok(valoracionService.delete(id));
    }

    @GetMapping("")
    public ResponseEntity<Page<ValoracionEntity>> getPage(Pageable oPageable) {
        return ResponseEntity.ok(valoracionService.getPage(oPageable));
    }

    @PostMapping("/populate/{amount}")
    public ResponseEntity<Long> populate(@PathVariable("amount") Integer amount) {
        return ResponseEntity.ok(valoracionService.populate(amount));
    }

    @DeleteMapping("/empty")
    public ResponseEntity<Long> empty() {
        return ResponseEntity.ok(valoracionService.empty());
    }

}
