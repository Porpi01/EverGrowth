package EverGrowth.com.EverGrowthserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
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
    private final String foxforumPASSWORD = "e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e";


    @Autowired
    UsuarioRepository usuarioRepository;

    private final String tiendaOnlinePassword = "e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e";

    public UsuarioEntity get(Long id) {
        return usuarioRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("User not found"));
    }

    public UsuarioEntity getByUsername(String username) {
        return usuarioRepository.findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException("User not found by username"));
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
            String emailNamePart = DataGenerationHelper.doNormalizeString(nombre.substring(0, 3) + apellido1.substring(0, 3) + apellido2.substring(0, 2) + i);

            String email = emailNamePart.toLowerCase() + "@gmail.com";
            String telefono = DataGenerationHelper.generateRandomPhone();
            String direccion = DataGenerationHelper.generateRandomAddress();
            String username = DataGenerationHelper
                    .doNormalizeString(
                            nombre.substring(0, 3) + apellido1.substring(1, 3) + apellido2.substring(1, 2) + i)
                    .toLowerCase();
            UsuarioEntity usuario = new UsuarioEntity(nombre, apellido1, apellido2, email, telefono, direccion, username,
                    "e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e", false);

            usuarioRepository.save(usuario);

        }
        return usuarioRepository.count();// Devuelve el número de usuarios que hay en la base de datos

    }

    public UsuarioEntity getOneRandom() {

        Pageable oPageable = PageRequest.of((int) (Math.random() * usuarioRepository.count()), 1);
        return usuarioRepository.findAll(oPageable).getContent().get(0);
    }



     
    @Transactional
    public Long empty() {
        usuarioRepository.deleteAll();
        usuarioRepository.resetAutoIncrement();
        UsuarioEntity oUserEntity1 = new UsuarioEntity(1L, "Pedro", "Picapiedra", "Roca",
                "pedropicapiedra@ausiasmarch.net", "123456789","Calle del Cerezo Nº 17", "pedropicapiedra", foxforumPASSWORD, false);
        usuarioRepository.save(oUserEntity1);
        oUserEntity1 = new UsuarioEntity(2L, "Pablo", "Mármol", "Granito", "pablomarmol@ausiasmarch.net", "123456789","Calle del Cerezo Nº 17",
                "pablomarmol", foxforumPASSWORD, true);
        usuarioRepository.save(oUserEntity1);
        return usuarioRepository.count();
    }

}
