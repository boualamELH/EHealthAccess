package com.gestion.MedecinPatients;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gestion.MedecinPatients.entities.Citoyen;
import com.gestion.MedecinPatients.entities.Etat;
import com.gestion.MedecinPatients.entities.Maladie;
import com.gestion.MedecinPatients.entities.Médecin;
import com.gestion.MedecinPatients.entities.MédecinPrivé;
import com.gestion.MedecinPatients.entities.MédecinPublic;
import com.gestion.MedecinPatients.entities.Patient;
import com.gestion.MedecinPatients.entities.Ville;
import com.gestion.MedecinPatients.metier.GestionMetier;
import com.gestion.MedecinPatients.models.GestionForme;

@Controller
public class ProjetController {
	public static String jsonstring;
	public static String jsonstat;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private GestionMetier metier;
	@RequestMapping(value="/login")
	  public String login(Model model, GestionForme gf){
		

		  return "login1";
	  }
		@RequestMapping(value="/logout")
		  public String logout(){
			  return "login1";
		  }
	
	 @RequestMapping(value="/NewFile")
		public String NewFile(Model model){
			model.addAttribute("GestionForme", new GestionForme());
			return "NewFile";
		}
	 @RequestMapping(value="/Acceuil")
		public String Acceuil(Model model){
			model.addAttribute("GestionForme", new GestionForme());
			return "Acceuil";
		}
	 @RequestMapping(value="/jsonvalue", method=RequestMethod.POST)
		public String jsonvalue(Model model, GestionForme gf,@RequestParam("json") String json){
		gf.setSelected(json);
		
		 jsonstring=json;
		 
	
			model.addAttribute("GestionForme", new GestionForme());
			return "ManagementPatient";
		}
	 @RequestMapping(value="/AjoutPatients")
		public String AjoutPatients(Model model, GestionForme gf){
		 if(gf.getConfirmer()!=null)
		 {
		 User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String code = user.getPassword();
			 String nameuser=user.getUsername();
		   System.out.println(gf.getNom());

		metier.Ajouter_Patient(new Patient(metier.generateString(new Random(), 
		"abcdefghijklmnopqwxyzrstuv1234567890", 8), gf.getNom(), gf.getAdresse(), gf.getPrenom(), new Date()), 
		new Maladie(gf.getLibelle(), gf.getDesignation()), new Etat(gf.getDescription()), new Ville("rabat", 10L), 
		metier.getcodeMedecin(nameuser, code));	
		 }
			model.addAttribute("GestionForme", new GestionForme());
			return "AjoutPatients";
		}
	 /*@RequestMapping(value="/AjouterPat")
		public String AjouterPat(Model model, GestionForme gf){
		 
			User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String code = user.getPassword();
			 String nameuser=user.getUsername();
		   System.out.println(gf.getSelected());
		metier.Ajouter_Patient(new Patient(metier.generateString(new Random(), 
		"abcdefghijklmnopqwxyzrstuv1234567890", 8), gf.getNom(), gf.getAdresse(), gf.getPrenom(), new Date()), 
		new Maladie(gf.getLibelle(), gf.getDesignation()), new Etat(gf.getDescription()), new Ville("rabat", 10L), 
		metier.getcodeMedecin(nameuser, code));	
		 
			model.addAttribute("GestionForme", new GestionForme());
			return "AjoutPatients";
		}*/
	
	 @RequestMapping(value="/ManagementPatient")
		public String ManagementPatient(Model model, GestionForme gf){
		 User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String json= jsonstring;
		 String code = user.getPassword();
			String nameuser=user.getUsername();	
			if(gf.getEnregistrer()!=null){
				System.out.println(json+"############");
   
			 
			 metier.Modifier_Patient(new Patient(gf.getCode(),gf.getNom(), gf.getAdresse(),
		     gf.getPrenom(), new Date()), new Etat(gf.getDescription()), gf.getCode(), json);
			 System.out.println(json+"############");
			 }
			
			if(gf.getConfirmer()!=null)
			{
				System.out.println(metier.getcodeMedecin(nameuser, code));
				System.out.println(gf.getConfirmer());
				System.out.println(gf.getCode());
				metier.Supprimer_Patient(gf.getCode(), metier.getcodeMedecin(nameuser, code));
			}
		 List<Patient> patients=metier.listePatientsParMedecins(metier.getcodeMedecin(nameuser, code));
			gf.setPatients(patients);
			
			model.addAttribute("GestionForme",gf);
			return "ManagementPatient";
		}
	 @RequestMapping(value="/AjoutCitoyen")
		public String AjoutCitoyen(Model model, GestionForme gf){
		 
		 User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String code = user.getPassword();
			 String nameuser=user.getUsername();
			System.out.println("######################\n"+metier.getcodeMedecin(nameuser, code));
		if(gf.getConfirmer()!=null){
			metier.Ajouter_Citoyen(new Citoyen(metier.generateString(new Random(), 
				"abcdefghijklmnopqwxyzrstuv1234567890", 8), gf.getNom(), gf.getPrenom(), gf.getAdresse()),metier.getcodeMedecin(nameuser, code));
		}
			model.addAttribute("GestionForme", gf);
			
			return "AjoutCitoyen";
		}
	 @RequestMapping(value="/SupprimerCit")
		public String SupprimerCit(Model model, GestionForme gf){
		 
		 if(gf.getCode()!=null){
			 Citoyen cit=metier.get_citoyen(gf.getCode());
				gf.setCitoyen(cit);   
		 if(gf.getConfirmer()!=null)
		        {
		        	
		        	metier.Supprimer_Citoyen(gf.getCode());
		        }
		 }
				
			
			model.addAttribute("GestionForme",gf);
			return "SupprimerCit";
		}
	 @RequestMapping(value="/Statistique")
		public String Statistique(Model model, GestionForme gf){
		   
		 String res = "";
			String st="";
			if(jsonstat!=null){
				
			System.out.println(jsonstat);
			gf.setSelected(jsonstat);
			System.out.print(metier.convertir_region(jsonstat));
			List<String> maladies= metier.Liste_MaladiesParVille(metier.convertir_region(jsonstat));
			for (String string : maladies) {
				System.out.println(string);
			}
			}
			
			
			for(int i=1;i<12;i++)
			{     res=st;
			    
				st=res+metier.get_nbre_pat_par_mal_par_ville("mal3", "casa", i).toString()+",";
				System.out.println(st);	   	
			}
			st=res+metier.get_nbre_pat_par_mal_par_ville("mal3", "casa", 12).toString();

			res=st;

	System.out.println(res);
			model.addAttribute("res","["+res+"]");
		 
			model.addAttribute("GestionForme", new GestionForme());
			return "Statistique";
		}
	 @RequestMapping(value="/jsonStat",method={RequestMethod.POST,RequestMethod.GET})
		public String jsonStat(Model model,@RequestParam("json") String json, GestionForme gf,HttpSession session){
			String st="";
			String smal="";
		    
             
			List<String> maladies= metier.Liste_MaladiesParVille(metier.convertir_region(json));
			
			for (String string : maladies) {
				System.out.println(string);
				smal=smal+"'"+string+"',";
				
				for(int i=1;i<12;i++)
				{     
				
				    if(i==1) st=st+metier.get_nbre_pat_par_mal_par_ville(string, metier.convertir_region(json), i).toString()+",";
				    else st=st+metier.get_nbre_pat_par_mal_par_ville(string, metier.convertir_region(json), i).toString()+",";
			   	
				}
				st=st+metier.get_nbre_pat_par_mal_par_ville(string, metier.convertir_region(json), 12).toString()+"],[";
            
				
				System.out.println("#########################");				
			}
			int j=st.length();
			st=st.substring(0, j-2);
			smal=smal.substring(0,smal.length()-1);
   
			gf.setSelected(st);
			session.setAttribute("st","["+st);
			session.setAttribute("smal",smal);
			
		     


      
			model.addAttribute("GestionForme", new GestionForme());
			return "redirect:http://localhost:8080/MedecinPatients/NewFile1";
		}
	 @RequestMapping(value="/NewFile1")
	 @Scope(value="session")	
	 public String NewFile1(Model model){
			model.addAttribute("GestionForme", new GestionForme());
			return "NewFile1";
}
	 @RequestMapping(value="/Admin")
		public String Admin(Model model){
			model.addAttribute("GestionForme", new GestionForme());
			return "Admin";
}
	 @RequestMapping(value="/Medecin")
		public String Medecin(Model model){
		 
			model.addAttribute("GestionForme", new GestionForme());
			return "Medecin";
}
	 @RequestMapping(value="/AjoutMedecinprive")
		public String AjoutMedecins(Model model, GestionForme gf){
		 
			 if(gf.getConfirmer()!=null){
		 metier.Ajouter_Medecin(new MédecinPrivé(metier.generateString(new Random(), 
		"abcdefghijklmnopqwxyzrstuv1234567890", 8), gf.getNom(), gf.getPrenom(), gf.getAdresse(), gf.getLibelle(), gf.getDesignation(), gf.getDescription()));
			 
			 }
			model.addAttribute("GestionForme", new GestionForme());
			return "AjoutMedecinprive";
}
	 @RequestMapping(value="/AjoutMedecinpublic")
		public String AjoutMedecinpublic(Model model, GestionForme gf){
		 
			 if(gf.getConfirmer()!=null){
		 metier.Ajouter_Medecin(new MédecinPublic(metier.generateString(new Random(), 
		"abcdefghijklmnopqwxyzrstuv1234567890", 8), gf.getNom(), gf.getPrenom(), gf.getAdresse(), gf.getLibelle(), gf.getDesignation(), gf.getDescription()));
			 
			 }
			model.addAttribute("GestionForme", new GestionForme());
			return "AjoutMedecinpublic";
}
	 @RequestMapping(value="/ManagementMedecinsprive")
		public String ManagementMedecinsprive(Model model, GestionForme gf){
			
			if(gf.getEnregistrer()!=null){
				
				System.out.println(gf.getCode());
			metier.Modifier_Medecin(new MédecinPrivé(gf.getCode(), gf.getNom(), gf.getPrenom(), gf.getAdresse(),
					gf.getLibelle(), gf.getDesignation(), gf.getDescription()), gf.getCode());
			 }
		
			if(gf.getConfirmer()!=null)
			{
				List<Patient> patients =metier.listePatientsParMedecins(gf.getCode());
				List<Citoyen> cit=metier.listeCitoyensParMedecins(gf.getCode());
				for (Citoyen citoyen : cit) {
					System.out.println(citoyen.getCodeCitoyen());
					metier.Supprimer_Citoyen(citoyen.getCodeCitoyen());
				}
				
				for (Patient patient : patients) {
				
					metier.Supprimer_Patient(patient.getCode_patient(), gf.getCode());
				}
				
				metier.Supprimer_Medecin(gf.getCode());
			}
			List<Médecin> medecins=metier.Liste_Medecins();
			
			gf.setMedecins(medecins);
			model.addAttribute("GestionForme", gf);
			return "ManagementMedecinsprive";
		}
	 
	 
	 @RequestMapping(value="/ManagementMedecinsPublic")
		public String ManagementMedecinsPublic(Model model, GestionForme gf){
			
			if(gf.getEnregistrer()!=null){
				
				System.out.println(gf.getCode());
			metier.Modifier_Medecin(new MédecinPublic(gf.getCode(), gf.getNom(), gf.getPrenom(), gf.getAdresse(),
					gf.getLibelle(), gf.getDesignation(), gf.getDescription()), gf.getCode());
			 }
		
			if(gf.getConfirmer()!=null)
			{
				List<Patient> patients =metier.listePatientsParMedecins(gf.getCode());
				List<Citoyen> cit=metier.listeCitoyensParMedecins(gf.getCode());
				for (Citoyen citoyen : cit) {
					System.out.println(citoyen.getCodeCitoyen());
					metier.Supprimer_Citoyen(citoyen.getCodeCitoyen());
				}
				
				for (Patient patient : patients) {
				
					metier.Supprimer_Patient(patient.getCode_patient(), gf.getCode());
				}
				
				metier.Supprimer_Medecin(gf.getCode());
			}
			List<Médecin> medecins=metier.Liste_Medecins();
			
			gf.setMedecins(medecins);
			model.addAttribute("GestionForme", gf);
			return "ManagementMedecinsPublic";
		}
	 
	 @RequestMapping(value="/StatistiqueAdmin")
		public String StatistiqueAdmin(Model model, GestionForme gf){
		   
		 String res = "";
			String st="";
			if(jsonstat!=null){
				
			System.out.println(jsonstat);
			gf.setSelected(jsonstat);
			System.out.print(metier.convertir_region(jsonstat));
			List<String> maladies= metier.Liste_MaladiesParVille(metier.convertir_region(jsonstat));
			for (String string : maladies) {
				System.out.println(string);
			}
			}
			
			
			for(int i=1;i<12;i++)
			{     res=st;
			    
				st=res+metier.get_nbre_pat_par_mal_par_ville("mal3", "casa", i).toString()+",";
				System.out.println(st);	   	
			}
			st=res+metier.get_nbre_pat_par_mal_par_ville("mal3", "casa", 12).toString();

			res=st;

	System.out.println(res);
			model.addAttribute("res","["+res+"]");
		 
			model.addAttribute("GestionForme", new GestionForme());
			return "StatistiqueAdmin";
		}
	 @RequestMapping(value="/NewFile1Admin")
	 @Scope(value="session")
		public String NewFile1Admin(Model model){
			model.addAttribute("GestionForme", new GestionForme());
			return "NewFile1Admin";
}
	 
	 @RequestMapping(value="/GestionPatient")
		public String GestionPatient(Model model,GestionForme gf){
		 
			model.addAttribute("GestionForme", new GestionForme());
			return "Patient";
			
}
	 @RequestMapping(value="/chargerPatient")
		public String chargerPatient(Model model, GestionForme gf){
			
				Patient pat=metier.consultation_patient(gf.getCode());
				gf.setPatient(pat);
			
			model.addAttribute("GestionForme",gf);
			return "Patient";
	 
}
}
