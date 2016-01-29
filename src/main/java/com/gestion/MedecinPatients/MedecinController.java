package com.gestion.MedecinPatients;

import java.util.Date;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gestion.MedecinPatients.entities.Citoyen;
import com.gestion.MedecinPatients.entities.Etat;
import com.gestion.MedecinPatients.entities.Maladie;
import com.gestion.MedecinPatients.entities.Patient;
import com.gestion.MedecinPatients.entities.Ville;
import com.gestion.MedecinPatients.metier.GestionMetier;
import com.gestion.MedecinPatients.models.GestionForme;

@Controller
public class MedecinController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private GestionMetier metier;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value="/ajouterPatient",method=RequestMethod.POST)
	public String ajouterPatient(Model model, GestionForme gf){
	
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String code = user.getPassword();
		 String nameuser=user.getUsername();
	    
		
		
	metier.Ajouter_Patient(new Patient(metier.generateString(new Random(), 
	"abcdefghijklmnopqwxyzrstuv1234567890", 8), gf.getNom(), gf.getAdresse(), gf.getPrenom(), new Date()), 
	new Maladie(gf.getLibelle(), gf.getDesignation()), new Etat(gf.getDescription()), new Ville("rabat", 10L), 
	metier.getcodeMedecin(nameuser, code));		
		model.addAttribute("GestionForme",new GestionForme());
		return "Medecin";

}
	@RequestMapping(value="/ajouterCitoyen",method=RequestMethod.POST)
	public String AjouterCitoyen(Model model, GestionForme gf){
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String code = user.getPassword();
		 String nameuser=user.getUsername();
		System.out.println("######################\n"+metier.getcodeMedecin(nameuser, code));
	metier.Ajouter_Citoyen(new Citoyen(metier.generateString(new Random(), 
			"abcdefghijklmnopqwxyzrstuv1234567890", 8), gf.getNom(), gf.getPrenom(), gf.getAdresse()),metier.getcodeMedecin(nameuser, code));
	model.addAttribute("GestionForme", gf);
		return "Medecin";

}
	
	
	@RequestMapping(value="/chargerCitoyen")
	public String chargerCitoyen(Model model, GestionForme gf){
	        if(gf.getConfirmer()!=null)
	        {
	        	
	        	metier.Supprimer_Citoyen(gf.getCode());
	        }
			Citoyen cit=metier.get_citoyen(gf.getCode());
			gf.setCitoyen(cit);
		
		model.addAttribute("GestionForme",gf);
		return "Medecin";
	}
	
	
	
	
	
	
	@RequestMapping(value="/updatePatient",method=RequestMethod.POST)
	public String updatePatient(Model model, GestionForme gf){
		
   metier.Modifier_Patient(new Patient(gf.getCode(),gf.getNom(), gf.getAdresse(),
		   gf.getPrenom(), new Date()), new Etat(gf.getDescription()), gf.getCode());		
		model.addAttribute("GestionForme",new GestionForme());
		return "Medecin";
		

}
}