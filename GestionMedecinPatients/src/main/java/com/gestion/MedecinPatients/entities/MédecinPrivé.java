package com.gestion.MedecinPatients.entities;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("priv�")
public class M�decinPriv� extends M�decin {

	private String Nom_clinique;
	private String Adresse_clinique;
	public String getNom_clinique() {
		return Nom_clinique;
	}
	public void setNom_clinique(String nom_clinique) {
		Nom_clinique = nom_clinique;
	}
	public String getAdresse_clinique() {
		return Adresse_clinique;
	}
	public void setAdresse_clinique(String adresse_clinique) {
		Adresse_clinique = adresse_clinique;
	}
	
	public M�decinPriv�() {
		super();
		// TODO Auto-generated constructor stub
	}
	public M�decinPriv�(String code_medecin, String nomMedecin,
			String prenomMedecin, String lieu_travail,
			String specialit�_Medecin, String nom_clinique,
			String adresse_clinique) {
		super(code_medecin, nomMedecin, prenomMedecin, lieu_travail,
				specialit�_Medecin);
		Nom_clinique = nom_clinique;
		Adresse_clinique = adresse_clinique;
	}
	
	
}
