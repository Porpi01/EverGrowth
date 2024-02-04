package EverGrowth.com.EverGrowthserver.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    // @GetMapping("")
    // public ResponseEntity<Page<ValoracionEntity>> getPage(
    // Pageable oPageable,
    // @RequestParam(value = "id_usuario", required = false) Long id_usuario,
    // @RequestParam(value = "id_producto", required = false) Long id_producto,
    // @RequestParam(name = "filter", required = false) String strFilter) {
    // return ResponseEntity.ok(valoracionService.getPage(oPageable, id_usuario,
    // id_producto, strFilter));
    // }

    @GetMapping("")
    public ResponseEntity<Page<ValoracionEntity>> getPage(
            Pageable oPageable,

            @RequestParam(name = "filter", required = false) String strFilter) {
        return new ResponseEntity<>(valoracionService.getPage(oPageable, strFilter), HttpStatus.OK);
    }
    @GetMapping("/producto/{id}")
    public ResponseEntity<List<ValoracionEntity>> getValoracionesForProducto(@PathVariable Long id) {
        List<ValoracionEntity> valoraciones = valoracionService.getValoracionesPorProducto(id);
        return ResponseEntity.ok().body(valoraciones);
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
