package com.gestion.MedecinPatients.DAO;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.gestion.MedecinPatients.entities.Citoyen;
import com.gestion.MedecinPatients.entities.Etat;
import com.gestion.MedecinPatients.entities.Maladie;
import com.gestion.MedecinPatients.entities.Médecin;
import com.gestion.MedecinPatients.entities.MédecinPrivé;
import com.gestion.MedecinPatients.entities.MédecinPublic;
import com.gestion.MedecinPatients.entities.Patient;
import com.gestion.MedecinPatients.entities.Role;
import com.gestion.MedecinPatients.entities.Utilisateur;
import com.gestion.MedecinPatients.entities.Ville;

public class GestionDaoImplem implements GestionDao {
   @PersistenceContext
   private EntityManager em;
	

	@Override
	public Patient Supprimer_Patient(String Code_patient, String Code_medecin) {
		Médecin medecin=em.find(Médecin.class, Code_medecin);
		Patient patient=em.find(Patient.class, Code_patient);
		patient.setMedecin(medecin);
		em.remove(patient);
		return patient;
		
	}

	
	@Override
	public List<Patient> Liste_Patients() {
		Query req = em.createQuery("select p from Patient p");
		
		return req.getResultList();
	}

	@Override
	public void Ajouter_Medecin(Médecin Med) {
	    em.persist(Med);
	    Ajouter_user(new Utilisateur("Médecin"+generateString(new Random(), "0123456789", 5), generateString(new Random(), "abcdefghijklmnopqwxyzrstuv1234567890", 8)), Med.getCode_medecin(), 5L);
	}

	@Override
	public void Supprimer_Medecin(String Code_medecin) {
		Médecin medecin=em.find(Médecin.class, Code_medecin);
	    em.remove(medecin);
		
	}

	@Override
	public Médecin get_Medecin(String Code_medecin) {
		Médecin medecin=em.find(Médecin.class, Code_medecin);
		return medecin;
	}

	@Override
	public List<Médecin> Liste_Medecins() {
Query req = em.createQuery("select m from Médecin m");
		
		return req.getResultList();
	
	}

	@Override
	public void Ajouter_Citoyen(Citoyen cit, String Code_medecin) {
		
		Médecin medecin=em.find(Médecin.class, Code_medecin);
	    cit.setMedecin(medecin);
	    em.persist(cit);
	}

	@Override
	public void Supprimer_Citoyen(String Code_citoyen) {
		Citoyen citoyen=em.find(Citoyen.class, Code_citoyen);
		em.remove(citoyen);
		
	}

	@Override
	public void Ajouter_Maladie(Maladie mal) {
		em.persist(mal);
	}

	@Override
	public void Supprimer_Maladie(Long Id_Maladie) {
	  Maladie mal=em.find(Maladie.class, Id_Maladie);
	  em.remove(mal);		
	}


	@Override
	public Maladie get_Maladie(Long Id_Maladie) {
		Maladie mal=em.find(Maladie.class, Id_Maladie);
		return mal;
	}

	@Override
	public List<String> Liste_MaladiesParVille(String nom_ville) {
		Query req=em.createQuery("select DISTINCT p.maladie.libellé from Patient p where p.ville.Nom_ville=:x");
		req.setParameter("x", nom_ville);
		return req.getResultList();
	}

	@Override
	public Long get_nbre_citoyen() {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select COUNT(codeCitoyen) from Citoyen c");
		List<Long> list= req.getResultList();
		return list.get(0);
		
	}


	@Override
	public void Modifier_Medecin(MédecinPrivé Med, String Code_medecin) {
		// TODO Auto-generated method stub
		MédecinPrivé medecin=em.find(MédecinPrivé.class, Code_medecin);
		
		medecin.setNomMedecin(Med.getNomMedecin());
		medecin.setPrenomMedecin(Med.getPrenomMedecin());
		medecin.setCode_medecin(Med.getCode_medecin());
		medecin.setLieu_travail(Med.getLieu_travail());
		medecin.setSpecialité_Medecin(Med.getSpecialité_Medecin());
		medecin.setNom_clinique(Med.getNom_clinique());
		medecin.setAdresse_clinique(Med.getAdresse_clinique());

		
		em.persist(medecin);
		
	}

	@Override
	public void Modifier_Maladie(Maladie mal, String libellé) {
		
		Maladie malad=em.find(Maladie.class, libellé);
		mal.setDesignation(mal.getDesignation());
		em.persist(malad);
		
	}

	@Override
	public Patient consultation_patient(String Code_patient) {
		Patient patient=em.find(Patient.class, Code_patient);
		return patient;
	}



	@Override
	public Patient Ajouter_Patient(Patient Pat, Maladie maladie,Etat etat,Ville ville, String Code_medecin) {
		Médecin medecin=em.find(Médecin.class, Code_medecin);
	    Pat.setMedecin(medecin);
        Pat.setEtat(etat);		
        Pat.setVille(ville);
        
        Collection<Patient> patients=medecin.getPatients();
		  if(patients==null) patients=new ArrayList<Patient>();
		  patients.add(Pat);
		  medecin.setPatients(patients);
		  
		 
		  
        
        
	
		  Collection<Patient> patients_ville=ville.getPatients();
		  if(patients_ville==null) patients_ville=new ArrayList<Patient>();
		  patients_ville.add(Pat);
		  ville.setPatients(patients_ville);
		 Pat.setMaladie(maladie);
		 if(em.find(Ville.class, ville.getNom_ville())==null)
         {em.persist(ville);}
		 if(em.find(Maladie.class, maladie.getLibellé())==null)
         {em.persist(maladie);}
		    if(em.find(Patient.class, Pat.getCode_patient())==null)
		    {em.persist(Pat);
		    Ajouter_user(new Utilisateur("Patient"+generateString(new Random(), "0123456789", 5), generateString(new Random(), "abcdefghijklmnopqwxyzrstuv1234567890", 8)), Pat.getCode_patient(), 6L);}
		    em.persist(etat);
		 
	  
	 /* Collection<Patient> patients=maladie.getPatients();
	  if(patients==null) patients=new ArrayList<Patient>();
	  patients.add(Pat);  
	    
	    maladie.setPatients(patients);
	    
	    Collection<Ville> villes=maladie.getVilles();
		  if(villes==null) villes=new ArrayList<Ville>();
		  villes.add(ville);
		 // System.out.println(patients);  
		  maladie.setVilles(villes);
	    
		  maladie.setVille(ville);
		    Ville v=em.find(Ville.class, ville.getNom_ville());
		    
	  
	      
	     for (Maladie maladie2 : maladies) {
			System.out.print(maladie2.getLibellé());
		}
	    
	    Pat.setMaladies(maladies);
	    if(v==null)
	    { em.persist(ville);}
	   
	    em.persist(etat);
	

	    
	   */
	    return Pat;
	}



	@Override
	public void Modifier_Patient(Patient Pat, Etat etat, String Code_Patient) {
		// TODO Auto-generated method stub
		Patient patient=em.find(Patient.class, Code_Patient);
		Etat eta=em.find(Etat.class, patient.getEtat().getId());
		
		Modifier_Etat(etat,eta.getId());
		patient.setNom_patient(Pat.getNom_patient());
		patient.setDate_entrée(Pat.getDate_entrée());
		patient.setPrenom_patient(Pat.getPrenom_patient());
		em.persist(patient);
		
	}



	@Override
	public Citoyen get_citoyen(String Code_citoyen) {
		Citoyen citoyen=em.find(Citoyen.class, Code_citoyen);
		return citoyen;
	}


	@Override
	public void Modifier_Etat(Etat etat, Long Id_etat) {
		// TODO Auto-generated method stub
		Etat etat_pat= em.find(Etat.class, Id_etat);
		etat_pat.setDescription(etat.getDescription());
		em.persist(etat_pat);
		
	}

	//utilisateur


	@Override
	public void Supprimer_Utilisateur(String Code_user) {
		// TODO Auto-generated method stub
		Utilisateur user=em.find(Utilisateur.class, Code_user);
	    em.remove(user);
		
	}


	@Override
	public void Modifier_Utilisateur(String Code_user) {
		// TODO Auto-generated method stub
		Utilisateur user=em.find(Utilisateur.class, Code_user);
		user.setCode_user(Code_user);
		em.persist(user);
	}


	@Override
	public void Ajouter_user(Utilisateur utilisateur, String code_user,
			Long id_role) {
		// TODO Auto-generated method stub
		
	utilisateur.setCode_user(code_user);
	Role role=em.find(Role.class, id_role);
	utilisateur.setRole(role);
	em.persist(utilisateur);
		
	}


	@Override
	public Long get_nbre_pat_par_mal_par_ville(String libellé, String nom_ville, int  month) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select COUNT(Code_patient) from Patient p where p.maladie.libellé=:x and p.ville.Nom_ville=:y "
				+ "and month(p.date_entrée)=:z  ");
		req.setParameter("x", libellé);
		req.setParameter("y", nom_ville);
		req.setParameter("z", month);

		List<Long> list= req.getResultList();
		return list.get(0);
		
	
	}




	@Override
	public String getcodeMedecin(String username, String password) {
		// TODO Auto-generated method stub
		
		
		Query req = em.createQuery("select u.Code_user from Utilisateur u where u.User_Name=:x and u.Password=:y  ");
		req.setParameter("x", username);
		req.setParameter("y", password);
		List<String> list= req.getResultList();
		return list.get(0);
			}


	@Override
	public String generateString(Random rng, String characters, int length) {
		// TODO Auto-generated method stub
		{
			
		    char[] text = new char[length];
		    for (int i = 0; i < length; i++)
		    {
		        text[i] = characters.charAt(rng.nextInt(characters.length()));
		    }
		    return new String(text);
		}
		
	}


	@Override
	public List<Patient> listePatientsParMedecin(String code_medecin,
			int position, int nbrPatinet) {
		// TODO Auto-generated method stub
		Query req=em.createQuery("select p from Patient p where p.medecin.Code_medecin=:x");
		req.setParameter("x", code_medecin);
		System.out.print("fdsfjdsh");
		
	req.setFirstResult(position);
	req.setMaxResults(nbrPatinet);

	return req.getResultList();
				
	}


	@Override
	public Long getnbrpartients(String codeMedecin) {
		// TODO Auto-generated method stub
		Query req=em.createQuery("select count(p) from Patient p where p.medecin.Code_medecin=:x ");
		req.setParameter("x", codeMedecin);
		return  (Long) req.getResultList().get(0);
	}


	@Override
	public Long getnbrmedecins() {
		// TODO Auto-generated method stub
		Query req=em.createQuery("select count(m) from Médecin m");
		return  (Long) req.getResultList().get(0);	}


	@Override
	public List<Patient> listePatientsParMedecins(String code_medecin) {
		// TODO Auto-generated method stub
		Médecin medecin=em.find(Médecin.class, code_medecin);

	    List<Patient> pats=(List<Patient>) medecin.getPatients();
	    
	    return pats;	}


	@Override
	public void Modifier_Patient(Patient Pat, Etat etat, String Code_Patient,
			String nomVille) {
		// TODO Auto-generated method stub
		Patient patient=em.find(Patient.class, Code_Patient);
		Etat eta=em.find(Etat.class, patient.getEtat().getId());
		Modifier_Etat(etat,eta.getId());
		Ville ville=em.find(Ville.class, nomVille);
		patient.setVille(ville);
		patient.setNom_patient(Pat.getNom_patient());
		patient.setDate_entrée(Pat.getDate_entrée());
		patient.setPrenom_patient(Pat.getPrenom_patient());
		em.persist(patient);
		
	}


	@Override
	public String convertir_region(String code) {
		// TODO Auto-generated method stub
		
		if(code.equals("\"MA-01\""))
		{   return "Tanger tetouan";}
		else 
			if(code.equals("\"MA-02\""))
			{ return "Gharb_chrarda_bnihssan";}
			else 
				if(code.equals("\"MA-03\""))
				{return "taza elhoucima tawnat";}
				else
					if(code.equals("\"MA-04\""))
					{return "oriental";}
					else if(code.equals("\"MA-05\""))
		                     {return "Fes boulman";}
		                     else 
			                  if(code.equals("\"MA-06\""))
			                    {return "Meknes Tafilalt";}
			                     else 
				                   if(code.equals("\"MA-07\""))
				                   {return "Rabat salé zemour zear";}
			                     	else
				                     	if(code.equals("\"MA-08\""))
				                     	{return "Casablanca";}
				                      	else if(code.equals("\"MA-09\""))
		                                   {return "chaouis werdigha";}
		else 
			if(code.equals("\"MA-10\""))
			{return "Doukala abda";}
			else 
				if(code.equals("\"MA-11\""))
				{return "Marrakech tanssift elhawz";}
				else
					if(code.equals("\"MA-12\""))
					{return "Tadla azilal";}
					else 
						if(code.equals("\"MA-13\""))
						{return "Souss massa daraa";}
						else
							if(code.equals("\"MA-14\""))
							{return "Gelmim semaara";}
							
		
		
		return null;
		
	}


	@Override
	public List<Citoyen> listeCitoyensParMedecins(String code_medecin) {
		// TODO Auto-generated method stub
		
		Médecin medecin=em.find(Médecin.class, code_medecin);

	    List<Citoyen> cits=(List<Citoyen>) medecin.getCitoyens();
	    
	    return cits;
	}


	@Override
	public void Modifier_Medecin(MédecinPublic Med, String Code_medecin) {
		// TODO Auto-generated method stub
MédecinPublic medecin=em.find(MédecinPublic.class, Code_medecin);
		
		medecin.setNomMedecin(Med.getNomMedecin());
		medecin.setPrenomMedecin(Med.getPrenomMedecin());
		medecin.setCode_medecin(Med.getCode_medecin());
		medecin.setLieu_travail(Med.getLieu_travail());
		medecin.setSpecialité_Medecin(Med.getSpecialité_Medecin());
		medecin.setNom_Hopitale(Med.getNom_Hopitale());
		medecin.setAdresse_Hopitale(Med.getAdresse_Hopitale());

		
		em.persist(medecin);
		
	}





	
}
