package EverGrowth.com.EverGrowthserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;
import EverGrowth.com.EverGrowthserver.entity.ValoracionEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.helper.DataGenerationHelper;
import EverGrowth.com.EverGrowthserver.repository.UsuarioRepository;
import jakarta.transaction.Transactional;

@Service
public class UsuarioService {

    @Autowired
    UsuarioRepository usuarioRepository;

    private final String tiendaOnlinePassword = "e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e";

    public UsuarioEntity get(Long id) {
        return usuarioRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("User not found"));
    }

    public Long create(UsuarioEntity oUsuarioEntity) {
        oUsuarioEntity.setId(null);
        oUsuarioEntity.setPassword(tiendaOnlinePassword);
        return usuarioRepository.save(oUsuarioEntity).getId();
    }

    public UsuarioEntity update(UsuarioEntity oUsuarioEntityToSet) {
        return usuarioRepository.save(oUsuarioEntityToSet);

    }

    public Long delete(Long id) {
        if (usuarioRepository.findById(id).isPresent()) {
            usuarioRepository.deleteById(id);
            return id;
        } else {
            throw new ResourceNotFoundException("El usuario con el ID " + id + " no existe");
        }
    }

    public Page<UsuarioEntity> getPage(Pageable oPageable, String filter) {

        Page<UsuarioEntity> page;

        if (filter == null || filter.isEmpty() || filter.trim().isEmpty()) {
            page = usuarioRepository.findAll(oPageable);
        } else {
            page = usuarioRepository.findByUserByNameOrSurnameOrLastnameContainingIgnoreCase(
                    filter, filter, filter, filter, oPageable);
        }
        return page;
    }

    public Long populate(Integer amount) {

        for (int i = 0; i < amount; i++) {
            String nombre = DataGenerationHelper.getRandomName();
            String apellido1 = DataGenerationHelper.getRandomSurname();
            String apellido2 = DataGenerationHelper.getRandomSurname();
            String email = (nombre.substring(0, 3) + apellido1.substring(0, 3) + apellido1.substring(0, 2) + i)
                    .toLowerCase()
                    + "@gmail.com";
            String direccion = DataGenerationHelper.generateRandomAddress();
            String username = DataGenerationHelper
                    .doNormalizeString(
                            nombre.substring(0, 3) + apellido1.substring(1, 3) + apellido2.substring(1, 2) + i)
                    .toLowerCase();
            UsuarioEntity usuario = new UsuarioEntity(nombre, apellido1, apellido2, email, direccion, username,
                    "e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e", false);

            usuarioRepository.save(usuario);

        }
        return usuarioRepository.count();

    }

    @Transactional
    public Long empty() {

        usuarioRepository.deleteAll();
        usuarioRepository.resetAutoIncrement();
        usuarioRepository.flush();
        return usuarioRepository.count();
    }

}
