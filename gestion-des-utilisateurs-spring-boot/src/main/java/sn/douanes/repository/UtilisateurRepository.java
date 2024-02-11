package sn.douanes.repository;

import sn.douanes.model.Utilisateur;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UtilisateurRepository extends CrudRepository<Utilisateur, Long> {

    Utilisateur findByEmail(String email);
    
}
