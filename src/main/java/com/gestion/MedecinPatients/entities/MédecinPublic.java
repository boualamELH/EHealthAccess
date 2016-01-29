package com.gestion.MedecinPatients.entities;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("public")
public class M�decinPublic extends M�decin {

	private String Nom_Hopitale;
	private String Adresse_Hopitale;
	public String getNom_Hopitale() {
		return Nom_Hopitale;
	}
	public void setNom_Hopitale(String nom_Hopitale) {
		Nom_Hopitale = nom_Hopitale;
	}
	public String getAdresse_Hopitale() {
		return Adresse_Hopitale;
	}
	public void setAdresse_Hopitale(String adresse_Hopitale) {
		Adresse_Hopitale = adresse_Hopitale;
	}
	public M�decinPublic() {
		super();
		// TODO Auto-generated constructor stub
	}
	public M�decinPublic(String code_medecin, String nomMedecin,
			String prenomMedecin, String lieu_travail,
			String specialit�_Medecin, String nom_Hopitale,
			String adresse_Hopitale) {
		super(code_medecin, nomMedecin, prenomMedecin, lieu_travail,
				specialit�_Medecin);
		Nom_Hopitale = nom_Hopitale;
		Adresse_Hopitale = adresse_Hopitale;
	}
	
	
}
