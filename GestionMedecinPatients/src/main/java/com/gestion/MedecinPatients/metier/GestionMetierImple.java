package com.gestion.MedecinPatients.metier;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.transaction.annotation.Transactional;

import com.gestion.MedecinPatients.DAO.GestionDao;
import com.gestion.MedecinPatients.entities.Citoyen;
import com.gestion.MedecinPatients.entities.Etat;
import com.gestion.MedecinPatients.entities.Maladie;
import com.gestion.MedecinPatients.entities.Médecin;
import com.gestion.MedecinPatients.entities.MédecinPrivé;
import com.gestion.MedecinPatients.entities.MédecinPublic;
import com.gestion.MedecinPatients.entities.Patient;
import com.gestion.MedecinPatients.entities.Utilisateur;
import com.gestion.MedecinPatients.entities.Ville;
@Transactional
public class GestionMetierImple implements GestionMetier {
    private GestionDao dao;
	public GestionDao getDao() {
		return dao;
	}

	public void setDao(GestionDao dao) {
		this.dao = dao;
	}

	@Override
	public Patient Ajouter_Patient(Patient Pat,Maladie maladie,Etat etat,Ville ville, String Code_medecin) {
	
		return dao.Ajouter_Patient(Pat,maladie,etat,ville, Code_medecin);
	}

	@Override
	public Patient Supprimer_Patient(String Code_patient, String Code_medecin) {
		
		return dao.Supprimer_Patient(Code_patient, Code_medecin);
	}


	
	@Override
	public List<Patient> Liste_Patients() {
		// TODO Auto-generated method stub
		return dao.Liste_Patients();
	}

	@Override
	public void Ajouter_Medecin(Médecin Med) {
		// TODO Auto-generated method stub
		dao.Ajouter_Medecin(Med);
		
	}

	@Override
	public void Supprimer_Medecin(String Code_medecin) {
		// TODO Auto-generated method stub
		dao.Supprimer_Medecin(Code_medecin);
		
	}

	

	@Override
	public Médecin get_Medecin(String Code_medecin) {
		// TODO Auto-generated method stub
		return dao.get_Medecin(Code_medecin);
	}

	@Override
	public List<Médecin> Liste_Medecins() {
		// TODO Auto-generated method stub
		return dao.Liste_Medecins();
	}

	@Override
	public void Ajouter_Citoyen(Citoyen cit, String Code_medecin) {
		// TODO Auto-generated method stub
		dao.Ajouter_Citoyen(cit, Code_medecin);
	}

	@Override
	public void Supprimer_Citoyen(String Code_citoyen) {
		// TODO Auto-generated method stub
		dao.Supprimer_Citoyen(Code_citoyen);
	}

	@Override
	public Long get_Nbr_citoyen() {
		Long nbre_citoyen=dao.get_nbre_citoyen()+33772593;
	
		return nbre_citoyen;
	}

	@Override
	public void Ajouter_Maladie(Maladie mal) {
		// TODO Auto-generated method stub
		dao.Ajouter_Maladie(mal);
	}

	@Override
	public void Supprimer_Maladie(Long Id_Maladie) {
		// TODO Auto-generated method stub
		dao.Supprimer_Maladie(Id_Maladie);
	}

	

	@Override
	public Maladie get_Maladie(Long Id_Maladie) {
		// TODO Auto-generated method stub
		return dao.get_Maladie(Id_Maladie);
	}

	@Override
	public List<String> Liste_MaladiesParVille(String nom_ville) {
		// TODO Auto-generated method stub
		return dao.Liste_MaladiesParVille(nom_ville);
	}

	@Override
	public void Modifier_Patient(Patient Pat,Etat etat, String Code_patient) {
		// TODO Auto-generated method stub
		dao.Modifier_Patient(Pat,etat, Code_patient);
		
	}

	

	@Override
	public void Modifier_Maladie(Maladie mal, String libellé ) {
		// TODO Auto-generated method stub
		dao.Modifier_Maladie(mal, libellé);
	}

	@Override
	public Patient consultation_patient(String Code_patient) {
		// TODO Auto-generated method stub
		return dao.consultation_patient(Code_patient);
	}

	@Override
	public Citoyen get_citoyen(String Code_citoyen) {
		// TODO Auto-generated method stub
		return dao.get_citoyen(Code_citoyen);
	}

	@Override
	public void Modifier_Etat(Etat etat, Long Id_etat) {
		// TODO Auto-generated method stub
		dao.Modifier_Etat(etat, Id_etat);
	}


	@Override
	public void Supprimer_Utilisateur(String Code_user) {
		// TODO Auto-generated method stub
		dao.Supprimer_Utilisateur(Code_user);
	}

	@Override
	public void Modifier_Utilisateur(String Code_user) {
		// TODO Auto-generated method stub
		dao.Supprimer_Utilisateur(Code_user);
	}

	@Override
	public void Ajouter_user(Utilisateur utilisateur, String code_user,
			Long id_role) {
		// TODO Auto-generated method stub
		dao.Ajouter_user(utilisateur, code_user, id_role);
	}

	

	@Override
	public Long get_nbre_pat_par_mal_par_ville(String libellé, String nom_ville,int month) {
		// TODO Auto-generated method stub
		return dao.get_nbre_pat_par_mal_par_ville(libellé, nom_ville,month);
	}

	@Override
	public String getcodeMedecin(String username, String password) {
		// TODO Auto-generated method stub
		return dao.getcodeMedecin(username, password);
	}

	@Override
	public String generateString(Random rng, String characters, int length) {
		// TODO Auto-generated method stub
		return dao.generateString(rng, characters, length);
	}

	@Override
	public Long getnbrpartients(String codeMedecin) {
		// TODO Auto-generated method stub
		return dao.getnbrpartients(codeMedecin);
	}

	@Override
	public List<Patient> listePatientsParMedecin(String code_medecin,
			int position, int nbrPatinet) {
		// TODO Auto-generated method stub
		return dao.listePatientsParMedecin(code_medecin, position, nbrPatinet);
	}

	@Override
	public Long getnbrmedecins() {
		// TODO Auto-generated method stub
		return dao.getnbrmedecins();
	}

	@Override
	public List<Patient> listePatientsParMedecins(String code_medecin) {
		// TODO Auto-generated method stub
		return dao.listePatientsParMedecins(code_medecin);
	}

	@Override
	public void Modifier_Patient(Patient Pat, Etat etat, String Code_Patient,
			String nomVille) {
		// TODO Auto-generated method stub
		dao.Modifier_Patient(Pat, etat, Code_Patient, nomVille);
	}

	@Override
	public String convertir_region(String code) {
		// TODO Auto-generated method stub
		return dao.convertir_region(code);
	}

	@Override
	public List<Citoyen> listeCitoyensParMedecins(String code_medecin) {
		// TODO Auto-generated method stub
		return dao.listeCitoyensParMedecins(code_medecin);
	}

	@Override
	public void Modifier_Medecin(MédecinPrivé Med, String Code_medecin) {
		// TODO Auto-generated method stub
		dao.Modifier_Medecin(Med, Code_medecin);
	}

	@Override
	public void Modifier_Medecin(MédecinPublic Med, String Code_medecin) {
		// TODO Auto-generated method stub
		dao.Modifier_Medecin(Med, Code_medecin);
	}

	

}
