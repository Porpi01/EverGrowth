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

import EverGrowth.com.EverGrowthserver.entity.PedidoEntity;
import EverGrowth.com.EverGrowthserver.service.PedidoService;



@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 3600)
@RestController
@RequestMapping("/pedido")
public class PedidoAPI {

    @Autowired
    private PedidoService oPedidoService;

    @GetMapping("/{id}")
    public ResponseEntity<PedidoEntity> get(@PathVariable("id") Long id) {
        return ResponseEntity.ok(oPedidoService.get(id));
    }

    @PostMapping("")
    public ResponseEntity<Long> create(@RequestBody PedidoEntity oPedidoEntity) {
        return ResponseEntity.ok(oPedidoService.create(oPedidoEntity));
    }

    @PutMapping("")
    public ResponseEntity<PedidoEntity> update(@RequestBody PedidoEntity oPedidoEntity) {
        return ResponseEntity.ok(oPedidoService.update(oPedidoEntity));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(@PathVariable("id") Long id) {
        return ResponseEntity.ok(oPedidoService.delete(id));
    }

    @GetMapping("")
    public ResponseEntity<Page<PedidoEntity>> getPage(Pageable oPageable) {
        return ResponseEntity.ok(oPedidoService.getPage(oPageable));
    }

    @PostMapping("/populate/{amount}")
    public ResponseEntity<Long> populate(@PathVariable("amount") Integer amount) {
        return ResponseEntity.ok(oPedidoService.populate(amount));
    }

}
