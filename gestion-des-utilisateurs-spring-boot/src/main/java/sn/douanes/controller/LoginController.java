package sn.douanes.controller;

import sn.douanes.model.Utilisateur;
import sn.douanes.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.util.List;

@RestController
public class LoginController {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/inscription")
    public ResponseEntity<String> registerUser(@RequestBody Utilisateur utilisateur) {
        Utilisateur savedUtilisateur = null;
        ResponseEntity response = null;
        try {
            String hashPwd = passwordEncoder.encode(utilisateur.getPwd());
            utilisateur.setPwd(hashPwd);
            // utilisateur.setCreateDt(String.valueOf(new Date(System.currentTimeMillis())));
            utilisateur.setCreateDt(new Date(System.currentTimeMillis()));
            savedUtilisateur = utilisateurRepository.save(utilisateur);
            if (savedUtilisateur.getId() > 0) {
                response = ResponseEntity
                        .status(HttpStatus.CREATED)
                        .body("Given user details are successfully registered");
            }
        } catch (Exception ex) {
            response = ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("An exception occured due to " + ex.getMessage());
        }
        return response;
    }

    @RequestMapping("/connexion")
    public Utilisateur getUserDetailsAfterLogin(Authentication authentication) {
        Utilisateur utilisateur = utilisateurRepository.findByEmail(authentication.getName());
        if (null != utilisateur) {
            return utilisateur;
        } else {
            return null;
        }

    }

}
