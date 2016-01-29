package com.gestion.MedecinPatients.Test;

import java.util.Date;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gestion.MedecinPatients.entities.Etat;
import com.gestion.MedecinPatients.entities.MédecinPrivé;
import com.gestion.MedecinPatients.entities.Patient;
import com.gestion.MedecinPatients.metier.GestionMetier;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ClassPathXmlApplicationContext context=
				new ClassPathXmlApplicationContext(new String[]{"applicationContext.xml"});
		
		GestionMetier  metier=(GestionMetier) context.getBean("metier");
    // metier.Ajouter_Medecin(new Médecin("Brichou", "Soufian", "oujda", "generaliste"));
		
	/*	metier.Ajouter_Citoyen(new Citoyen("FE5", "DISSI", "MUSTAPHA", "rabat INPT"),(long) 1);
		metier.Ajouter_Patient(new Patient("Dissi", "mustapha", new Date()),(long)1 );
        metier.Ajouter_Maladie(new Maladie("fievre", "c une maladie su à changement influant la temperature du corps"));
        metier.Modifier_Patient(new Patient("dissi", "Boualam", new Date()), (long)44 );
        System.out.println("le nombre des citoyen: "+metier.get_Nbr_citoyen());
        System.out.println("liste des patients: "+metier.Liste_Patients().get(0));*/
		//metier.Supprimer_Patient((long)48, 1L);
       // System.out.print(metier.get_Patient(44L).getPrenom_patient());
        //metier.Ajouter_Medecin(new Médecin("Brichou", "Soufian", "oujda", "generaliste"));
       // metier.Ajouter_Patient(new Patient("Patcode5", "nom_patient5", "address_patient5", "prenom_patient5", new Date()),new Etat("1dfqbvdsbvdsl vdsbvdsjjdf ljsdvhvbd jqsdhvdsvh jqdsbvkjds"), 1L);
        //metier.jouter_Patient(new Patient("Patcode6", "nom_patient6", "address_patient6", "prenom_patient6", new Date()),new Etat("2dfqbvdsbvdsl vdsbvdsjjdf ljsdvhvbd jqsdhvdsvh jqdsbvkjds"), 1L);
		//metier.Ajouter_Citoyen(new Citoyen("FE5912", "DISSI", "MUSTAPHA", "rabat INPT"),(long) 1);


		//System.out.println(metier.get_citoyen("FE512").getAdresse());
		//metier.Ajouter_Medecin(new MédecinPrivé("ghf", "nomMedecin", "prenomMedecin", "lieu_travail", "specialité_Medecin", "nom_clinique", "adresse_clinique"));

  //metier.Ajouter_Patient(new Patient("gtfrthtyh", "gggrg", "rgt rabat", "jalal", new Date()),new Maladie("7assasiya", "allah i7fd"), 
   //new Etat("yeeeees l3Aaaaz"), new Ville("rabat", 10L),"ghf");
    /*metier.Ajouter_Patient(new Patient("newcsosddadegt", "gggrg", "rgt errachidia", "mustafggpha", new Date()),new Maladie("mal2", "allah i7fd"), 
	new Etat("yeeeees l3Aaaaz"), new Ville("casa", 10L),"ghf");
    metier.Ajouter_Patient(new Patient("newcossdfdaadse3gt", "gggrg", "rgt errachidia", "mustafggpha", new Date()),new Maladie("mal3", "allah i7fd"), 
    new Etat("yeeeees l3Aaaaz"), new Ville("casa", 10L),"ghf");*/
	 //metier.Ajouter_Citoyen(new Citoyen("cit1234", "bahdou", "karim", "tinghir errachidia"), "ghf");
	   // metier.Ajouter_Maladie(new Maladie("jgfgjf", "il s'agit d'une maladie très grave"));
	    /*System.out.println(metier.consultation_patient("pat1234").getNom_patient()); 
	    System.out.println(metier.get_citoyen("cit1234").getNomCitoyen());
	    System.out.println(metier.get_Maladie(1L).getDesignation());*/
	    //System.out.println(metier.get_Nbr_citoyen());
	  // metier.Supprimer_Citoyen("bjc6ydnv");
	 //  metier.Modifier_Patient(new Patient("pat123456", "mahddaoui", "ensia rvfvfabat", "ansas", new Date()), 
	  // new Etat("fhfdgfhdgf") ,"gtfez");
   //metier.Supprimer_Patient("newcode2", "med1234");
      //	metier.Ajouter_patinuser(new Utilisateur("username", "password"), "pt");
      //metier.Ajouter_medinuser(new Utilisateur("usermed","passmed"),"med1234" );
	//System.out.println(metier.Liste_Medecins().get(0).getNomMedecin());
	//metier.Ajouter_Medecin(new MédecinPrivé("hghdefeh", "nomMedecin", "prenomMedecin", "lieu_travail", "specialité_Medecin", "nom_clinique", "adresse_clinique"));
	//metier.Supprimer_Medecin("med12jn34");
		
	/*List<String> maladies= metier.Liste_MaladiesParVille("casa");
	for (String maladie : maladies) {		
		System.out.println(maladie);
		
	}*/
	/*List<Patient> patients=metier.listePatientsParMedecins("ghf");
		for (Patient patient : patients) {
			System.out.println(patient.getNom_patient());
		
		}*/
		//metier.Modifier_Patient(new Patient("rfrf", "nom_patient", "address_patient", "prenom_patient", new Date()),new Etat("dfvfvfv fferfe"), "04t0v0m5", "Daraa Tafilalet");
   
		//System.out.println(metier.convertir_region("MA-06"));
		//metier.Modifier_Medecin(new MédecinPrivé("ghf", "nomMedecin", "prenomMedecin", "lieu_travail", "specialité_Medecin", "nom_clinique", "adresse_clinique"), "ghf");
		System.out.println(metier.consultation_patient("skiictsz").getNom_patient());
		
		/*List<Patient> pati=metier.listePatientsParMedecin("ghf");
     for(Patient p: pati)
    	 
     {  
    	 
    	 System.out.println(p.getCode_patient());
    	 
     }*/
	//	System.out.print(metier.get_nbre_pat_par_mal_par_ville("mal2", "rabat"));
		//Random rng = new Random();
		//System.out.println(generateString(rng, "abcdefghijklmnopqrstuvxywz1234567890", 6));
		//System.out.println(generateString(rng, "abcdefghijklmnopqrstuvxywz1234567890", 6));
		//System.out.println(generateString(rng, "abcdefghijklmnopqrstuvxywz1234567890", 4));
		//System.out.println(generateString(rng, "abcdefghijklmnopqrstuvxywz1234567890", 6));
		//System.out.println(generateString(rng, "abcdefghijklmnopqrstuvxywz1234567890", 8));
		//System.out.println(generateString(rng, "abcdefghijklmnopqrstuvxywz1234567890", 6));
		//System.out.println(generateString(rng, "abcdefghijklmnopqrstuvxywz1234567890", 3));
		//System.out.println(generateString(rng, "abcdefghijklmnopqrstuvxywz1234567890", 6));
		//System.out.println(generateString(rng, "abcdefghijklmnopqrstuvxywz1234567890", 9));
   //System.out.print(metier.getcodeMedecin("ana", "ana"));
   //metier.Ajouter_Medecin(new MédecinPrivé("ddddd", "ahmedi", "ahmed", "lieu_travail", "specialité_Medecin", "nom_clinique", "adresse_clinique"));   
	
	//System.out.println(metier.generateString(new Random(), "abcdefghijklmnopqwxyzrstuv1234567890", 5));
		//System.out.println(metier.get_nbre_pat_par_mal_par_ville("mal3", "casa", 8));
   
   
	}
	
	} 


