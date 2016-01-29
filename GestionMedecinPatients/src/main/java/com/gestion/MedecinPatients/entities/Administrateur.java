package com.gestion.MedecinPatients.entities;

import java.io.Serializable;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Administrateur implements Serializable {

	@Id
	private String Code_admin;
	private String nom_admin;
	private String Prenom_admin;
	private String profession;
	

	public String getCode_admin() {
		return Code_admin;
	}
	public void setCode_admin(String code_admin) {
		Code_admin = code_admin;
	}
	public String getNom_admin() {
		return nom_admin;
	}
	public void setNom_admin(String nom_admin) {
		this.nom_admin = nom_admin;
	}
	public String getPrenom_admin() {
		return Prenom_admin;
	}
	public void setPrenom_admin(String prenom_admin) {
		Prenom_admin = prenom_admin;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public Administrateur(String code_admin, String nom_admin,
			String prenom_admin, String profession) {
		super();
		Code_admin = code_admin;
		this.nom_admin = nom_admin;
		Prenom_admin = prenom_admin;
		this.profession = profession;
	}
	public Administrateur() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
