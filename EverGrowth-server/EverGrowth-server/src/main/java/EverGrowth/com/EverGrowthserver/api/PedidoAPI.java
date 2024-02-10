package EverGrowth.com.EverGrowthserver.api;

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
import org.springframework.web.bind.annotation.RestController;

import EverGrowth.com.EverGrowthserver.entity.PedidoEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;
import EverGrowth.com.EverGrowthserver.service.PedidoService;
import EverGrowth.com.EverGrowthserver.service.ProductoService;
import EverGrowth.com.EverGrowthserver.service.UsuarioService;

@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 3600)
@RestController
@RequestMapping("/pedido")
public class PedidoAPI {

    @Autowired
    private PedidoService oPedidoService;

    @Autowired
    private ProductoService ProductoService;

    @Autowired
    private UsuarioService UsuarioService;

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
    public ResponseEntity<Page<PedidoEntity>> getPage(Pageable oPageable,
            @RequestParam(name = "usuario", defaultValue = "0", required = false) Long id_usuario) {
        return ResponseEntity.ok(oPedidoService.getPage(oPageable, id_usuario));
    }

    @PostMapping("/populate/{cantidad}")
    public ResponseEntity<Long> populate(@PathVariable("cantidad") Integer cantidad) {
        return ResponseEntity.ok(oPedidoService.populate(cantidad));
    }

    @DeleteMapping("/empty")
    public ResponseEntity<Long> empty() {
        return ResponseEntity.ok(oPedidoService.empty());
    }

    @PostMapping("/sumarProducto/{producto_id}/{usuario_id}/{cantidad}")
    public ResponseEntity<PedidoEntity> realizarCompraProducto(@PathVariable Long producto_id,
            @PathVariable Long usuario_id, @PathVariable int cantidad) {
        UsuarioEntity usuario = UsuarioService.get(usuario_id);
        ProductoEntity producto = ProductoService.get(producto_id);
        PedidoEntity carrito = oPedidoService.sumarProducto(producto, usuario, cantidad);
        return new ResponseEntity<>(carrito, HttpStatus.CREATED);
    }

}
