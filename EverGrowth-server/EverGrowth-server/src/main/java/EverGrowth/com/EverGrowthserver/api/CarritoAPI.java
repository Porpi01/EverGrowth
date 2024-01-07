package EverGrowth.com.EverGrowthserver.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import EverGrowth.com.EverGrowthserver.entity.CarritoEntity;
import EverGrowth.com.EverGrowthserver.service.CarritoService;


@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 3600)
@RestController
@RequestMapping("/carrito")
public class CarritoAPI {
    
    @Autowired
    CarritoService carritoService;

    @GetMapping("/{id}")
    public ResponseEntity<CarritoEntity> get(@PathVariable("id") Long id) {
        return ResponseEntity.ok(carritoService.get(id));
    }

    @PostMapping("")
    public ResponseEntity<Long> create(@RequestBody CarritoEntity orritoEntity) {
        return ResponseEntity.ok(carritoService.create(orritoEntity));
    }

    @PutMapping("")
    public ResponseEntity<CarritoEntity> update(@RequestBody CarritoEntity CarritoEntity) {
        return ResponseEntity.ok(carritoService.update(CarritoEntity));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(@PathVariable("id") Long id) {
        return ResponseEntity.ok(carritoService.delete(id));
    }

    @GetMapping("")
    public ResponseEntity<Page<CarritoEntity>> getPage(Pageable oPageable) {
        return ResponseEntity.ok(carritoService.getPage(oPageable));
    }

    @PostMapping("/populate/{amount}")
    public ResponseEntity<Long> populate(@PathVariable("amount") Integer amount) {
        return ResponseEntity.ok(carritoService.populate(amount));
    }


}
