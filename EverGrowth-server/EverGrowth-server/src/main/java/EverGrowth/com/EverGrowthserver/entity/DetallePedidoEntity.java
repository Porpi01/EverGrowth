package EverGrowth.com.EverGrowthserver.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "detalle pedido")
public class DetallePedidoEntity {

    private Long id;

    private int cantidad;

    private Float precio_unitario;

    @ManyToOne
    @JoinColumn(name = "id_producto")
    private ProductoEntity productos;

    @ManyToOne
    @JoinColumn(name = "id_pedido")
    private PedidoEntity pedidos;

    public DetallePedidoEntity ( int cantidad, float precio_unitario){
        this.cantidad = cantidad;
        this.precio_unitario = precio_unitario;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Float getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(Float precio_unitario) {
        this.precio_unitario = precio_unitario;
    }
}
