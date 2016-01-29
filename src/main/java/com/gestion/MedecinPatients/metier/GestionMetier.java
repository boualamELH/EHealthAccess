package com.gestion.MedecinPatients.metier;

import java.util.Date;
import java.util.List;
import java.util.Random;

import com.gestion.MedecinPatients.entities.Citoyen;
import com.gestion.MedecinPatients.entities.Etat;
import com.gestion.MedecinPatients.entities.Maladie;
import com.gestion.MedecinPatients.entities.Médecin;
import com.gestion.MedecinPatients.entities.MédecinPrivé;
import com.gestion.MedecinPatients.entities.MédecinPublic;
import com.gestion.MedecinPatients.entities.Patient;
import com.gestion.MedecinPatients.entities.Utilisateur;
import com.gestion.MedecinPatients.entities.Ville;

public interface GestionMetier  {

	//patient
	public Patient Ajouter_Patient(Patient Pat, Maladie maladie,Etat etat, Ville ville,String Code_medecin );
		public Patient Supprimer_Patient(String Code_patient,String Code_medecin);
		public void Modifier_Patient(Patient Pat,Etat etat,String Code_patient);
		public Long getnbrpartients(String codeMedecin);
	    public Long get_nbre_pat_par_mal_par_ville(String libellé,String nom_ville,int month);
		public List<Patient> listePatientsParMedecins(String code_medecin);
		public void Modifier_Patient(Patient Pat,Etat etat,String Code_Patient,String nomVille);




		public Patient consultation_patient(String code_patient);
		public List<Patient> Liste_Patients();
		public List<Patient> listePatientsParMedecin(String code_medecin,int position,int nbrPatinet);

		//medecin
		public void Ajouter_Medecin(Médecin Med);
		public void Supprimer_Medecin(String Code_medecin);
		public Médecin get_Medecin(String Code_medecin);
		public void Modifier_Medecin(MédecinPrivé Med,String Code_medecin);
		public void Modifier_Medecin(MédecinPublic Med,String Code_medecin);
		public List<Médecin> Liste_Medecins();
		public String getcodeMedecin(String username,String password);
		public Long getnbrmedecins();


		//Citoyens
		public void Ajouter_Citoyen(Citoyen cit, String Code_medecin);
		public void Supprimer_Citoyen(String Code_citoyen);
		public Long get_Nbr_citoyen();
		public Citoyen get_citoyen(String Code_citoyen);
		public List<Citoyen> listeCitoyensParMedecins(String code_medecin);


		//Maladie
		public void Ajouter_Maladie(Maladie mal);
		public void Supprimer_Maladie(Long Id_Maladie);
		public void Modifier_Maladie(Maladie mal,String libellé);
		public Maladie get_Maladie(Long Id_Maladie);
		public List<String> Liste_MaladiesParVille(String nom_ville);
		//etat
		public void Modifier_Etat(Etat etat,Long Id_etat);
       
		 //utilisateur
		public void Ajouter_user(Utilisateur utilisateur,String code_user, Long id_role);

		public void Supprimer_Utilisateur(String Code_user);
		public void Modifier_Utilisateur(String Code_user);
		
		//generation des codes
		public  String generateString(Random rng, String characters, int length);
		public String convertir_region(String code);

}

