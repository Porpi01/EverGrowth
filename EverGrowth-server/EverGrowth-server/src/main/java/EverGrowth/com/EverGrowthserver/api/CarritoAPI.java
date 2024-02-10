package EverGrowth.com.EverGrowthserver.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import EverGrowth.com.EverGrowthserver.entity.CarritoEntity;
import EverGrowth.com.EverGrowthserver.entity.CategoriaEntity;
import EverGrowth.com.EverGrowthserver.entity.ProductoEntity;
import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.repository.UsuarioRepository;
import EverGrowth.com.EverGrowthserver.service.CarritoService;

@CrossOrigin(origins = "*", allowedHeaders = "*", maxAge = 3600)
@RestController
@RequestMapping("/carrito")
public class CarritoAPI {

    @Autowired
    CarritoService carritoService;

    @Autowired
    UsuarioRepository usuarioRepository;

   
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

     @GetMapping("/cantidad")
    public ResponseEntity<Long> countProductsInCart(@RequestParam("userId") Long userId) {
        UsuarioEntity user = usuarioRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario no encontrado con el ID: " + userId));

        Long count = carritoService.count(user);
        return new ResponseEntity<>(count, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(@PathVariable("id") Long id) {
        return ResponseEntity.ok(carritoService.delete(id));
    }

    @GetMapping("")
    public ResponseEntity<Page<CarritoEntity>> getPage(Pageable oPageable,
    
    @RequestParam(name = "usuario",defaultValue = "0" , required=false) Long id_usuario ,
    @RequestParam(name = "producto", defaultValue = "0", required=false ) Long id_producto) {
        return ResponseEntity.ok(carritoService.getPage(oPageable, id_usuario, id_producto));
    }

    @PostMapping("/populate/{amount}")
    public ResponseEntity<Long> populate(@PathVariable("amount") Integer amount) {
        return ResponseEntity.ok(carritoService.populate(amount));
    }

    @DeleteMapping("/empty")
    public ResponseEntity<Long> empty() {
        return ResponseEntity.ok(carritoService.empty());
    }

    @PostMapping("/agregarProducto")
    public ResponseEntity<Long> agregarProductoAlCarrito(@RequestParam("idUsuario") Long idUsuario, 
                                                         @RequestParam("idProducto") Long idProducto) {
        Long cantidadTotalEnCarrito = carritoService.agregarProductoAlCarrito(idUsuario, idProducto);
        return ResponseEntity.ok(cantidadTotalEnCarrito);
    }
//  @GetMapping("/{idCarrito}/productos")
//     public ResponseEntity<List<ProductoEntity>> getProductosEnCarrito(@PathVariable Long idCarrito) {
//         List<ProductoEntity> productos = carritoService.getProductosEnCarrito(idCarrito);
//         return ResponseEntity.ok().body(productos);
//     }

}
