package com.gestion.MedecinPatients;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gestion.MedecinPatients.entities.Etat;
import com.gestion.MedecinPatients.entities.Maladie;
import com.gestion.MedecinPatients.entities.Patient;
import com.gestion.MedecinPatients.metier.GestionMetier;
import com.gestion.MedecinPatients.models.GestionForme;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private GestionMetier metier;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	 @RequestMapping("/hello")  
	 public @ResponseBody  
	 String hello(@RequestParam("topping") String topping) {  
	  System.out.println(topping);  
	    
	  
	  String str = "{\"user\": { \"name\": \"" + topping + "\"}}";  
	  return str;  
	  
	 }  
	 /*@RequestMapping(value="/resp")
		public String resp(Model model){
			model.addAttribute("GestionForme", new GestionForme());
			return "Projet";
		}*/
	
	 @RequestMapping(value="/resp.htm",method=RequestMethod.GET)

	   public  @ResponseBody String  getSearchUserProfiles(@RequestBody String topping, HttpServletRequest request) {
	       String strg=(String) request.getAttribute(topping);
	       System.out.println(strg);
	       return "resp";
	       

	       // your logic next
	   }
	
	
	
	@RequestMapping(value="/getMeds",method=RequestMethod.GET)
	public String getMedecins(Model model)
		{
		String res = "";
		String st="";
		List<String> maladies= metier.Liste_MaladiesParVille("nom_ville");
		for(int i=1;i<12;i++)
		{     res=st;
		    
			st=res+metier.get_nbre_pat_par_mal_par_ville("mal3", "casa", i).toString()+",";
			System.out.println(st);	   	
		}
		st=res+metier.get_nbre_pat_par_mal_par_ville("mal3", "casa", 12).toString();

		res=st;

        System.out.println(res);
		model.addAttribute("res","["+res+"]");
		return "NewFile1";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value="/index")
	public String index(Model model){
		model.addAttribute("GestionForme", new GestionForme());
		return "Test";
	}
	@RequestMapping(value="/GestionUtilisateur")
	public String GestionUtilisateur(Model model,HttpSession session){
		model.addAttribute("GestionForme", new GestionForme());
		return "Utilisateur";
	}
	/*@RequestMapping(value="/chargerPatient")
	public String chargerPatient(Model model, GestionForme gf){
		
			Patient pat=metier.consultation_patient(gf.getCode());
			gf.setPatient(pat);
		
		model.addAttribute("GestionForme",gf);
		return "Utilisateur";
	}*/
	@RequestMapping(value="/chargerMedecin")
	public String chargerMedecin(Model model, GestionForme gf){
		
			//gf.setJ_password(code);
		
		 /*String st=metier.getcodeMedecin(gf.getJ_username(), gf.getJ_password());
		   System.out.println(st);*/
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String code = user.getPassword();
		String nameuser=user.getUsername();
	    
		if(gf.getSupprimer()!=null){
			
			 metier.Modifier_Patient(new Patient(gf.getCode(),gf.getNom(), gf.getAdresse(),
					   gf.getPrenom(), new Date()), new Etat(gf.getDescription()), gf.getCode());
			 }
		if(gf.getConfirmer()!=null)
		{
			System.out.println(gf.getConfirmer());
			System.out.println(gf.getCode());

			metier.Supprimer_Patient(gf.getCode(), "med12jn34");
		}
		int pos=gf.getNbligne()*gf.getPage();
		List<Patient> patients=metier.listePatientsParMedecin(metier.getcodeMedecin(nameuser, code), pos, gf.getNbligne());
		Long nbPage=metier.getnbrpartients(metier.getcodeMedecin(nameuser, code))/gf.getNbligne()+1;
		gf.setNbpages(nbPage);
		gf.setPatients(patients);
	
		model.addAttribute("GestionForme",gf);
		return "Medecin";
	}
	@RequestMapping(value="/chargerpages")
	public String chargerpages(Model model,HttpSession session,GestionForme gf){
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String code = user.getPassword();
		String nameuser=user.getUsername();
		int pos=gf.getNbligne()*gf.getPage();
		List<Patient> patients=metier.listePatientsParMedecin(metier.getcodeMedecin(nameuser, code), pos, gf.getNbligne());
		Long nbPage=metier.getnbrpartients(metier.getcodeMedecin(nameuser, code))/gf.getNbligne()+1;
		gf.setNbpages(nbPage);
		gf.setPatients(patients);
	
		model.addAttribute("GestionForme",gf);
		return "Medecin";
	}
	
}
