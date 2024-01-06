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

import EverGrowth.com.EverGrowthserver.entity.DetallePedidoEntity;
import EverGrowth.com.EverGrowthserver.service.DetallePedidoService;

@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 3600)
@RestController
@RequestMapping("/detallePedido")
public class DetallePedidoAPI {

    @Autowired
    DetallePedidoService detallePedidoService;

    @GetMapping("/{id}")
    public ResponseEntity<DetallePedidoEntity> get(@PathVariable("id") Long id) {
        return ResponseEntity.ok(detallePedidoService.get(id));
    }

    @PostMapping("")
    public ResponseEntity<Long> create(@RequestBody DetallePedidoEntity oDetallePedidoEntity) {
        return ResponseEntity.ok(detallePedidoService.create(oDetallePedidoEntity));
    }

    @PutMapping("")
    public ResponseEntity<DetallePedidoEntity> update(@RequestBody DetallePedidoEntity oDetallePedidoEntity) {
        return ResponseEntity.ok(detallePedidoService.update(oDetallePedidoEntity));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(@PathVariable("id") Long id) {
        return ResponseEntity.ok(detallePedidoService.delete(id));
    }

    @GetMapping("")
    public ResponseEntity<Page<DetallePedidoEntity>> getPage(Pageable oPageable) {
        return ResponseEntity.ok(detallePedidoService.getPage(oPageable));
    }

    @PostMapping("/populate/{amount}")
    public ResponseEntity<Long> populate(@PathVariable("amount") Integer amount) {
        return ResponseEntity.ok(detallePedidoService.populate(amount));
    }

}
