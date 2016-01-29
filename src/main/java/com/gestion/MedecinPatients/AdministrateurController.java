package com.gestion.MedecinPatients;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gestion.MedecinPatients.entities.Etat;
import com.gestion.MedecinPatients.entities.Maladie;
import com.gestion.MedecinPatients.entities.Médecin;
import com.gestion.MedecinPatients.entities.Patient;
import com.gestion.MedecinPatients.entities.Ville;
import com.gestion.MedecinPatients.metier.GestionMetier;
import com.gestion.MedecinPatients.models.GestionForme;

@Controller
public class AdministrateurController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private GestionMetier metier;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/chargeradmin")
	public String chargeradmin(GestionForme gf, Model model, HttpSession session) {
		List<Médecin> medecins=metier.Liste_Medecins();
		
		gf.setMedecins(medecins);
		model.addAttribute("GestionForme", gf);
		if(gf.getSupprimer()!=null){
			
		metier.Supprimer_Medecin("med12jn34");
		}
		return "Administrateur";
	}
	@RequestMapping(value="/ajouterMedecin",method=RequestMethod.POST)
	public String ajouterMedecin(Model model, GestionForme gf){
			
		model.addAttribute("GestionForme",new GestionForme());
		return "Medecin";

}
	
}
