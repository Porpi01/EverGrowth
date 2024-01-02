package EverGrowth.com.EverGrowthserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import EverGrowth.com.EverGrowthserver.entity.UsuarioEntity;
import EverGrowth.com.EverGrowthserver.exception.ResourceNotFoundException;
import EverGrowth.com.EverGrowthserver.repository.UsuarioRepository;

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
        UsuarioEntity oUsuarioEntityFromDatabase = this.get(oUsuarioEntityToSet.getId());

                oUsuarioEntityToSet.setId(oUsuarioEntityFromDatabase.getId());
                oUsuarioEntityToSet.setrol(oUsuarioEntityFromDatabase.getrol());
                oUsuarioEntityToSet.setPassword(tiendaOnlinePassword);
                return usuarioRepository.save(oUsuarioEntityToSet);
            
    }

    public Long delete(Long id) {
        usuarioRepository.deleteById(id);
        return id;
    }

    public Page<UsuarioEntity> getPage(Pageable oPageable) {
        return usuarioRepository.findAll(oPageable);
    }

    public Long populate(Integer amount) {
        for (int i = 0; i < amount; i++) {
            usuarioRepository.save(new UsuarioEntity("name" + i, "surname" + i, "lastname" + i,
                    "email" + i + "@ausiasmarch.net", "address" + i, "username" + i,
                    "e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e", true));
        }
        return usuarioRepository.count();
    }






}
