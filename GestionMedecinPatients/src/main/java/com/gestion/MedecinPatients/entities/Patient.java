package com.gestion.MedecinPatients.entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
@Entity
public class Patient implements Serializable {

	
	
	public String getCode_patient() {
		return Code_patient;
	}

	public void setCode_patient(String code_patient) {
		Code_patient = code_patient;
	}

	public Patient(String code_patient) {
		super();
		Code_patient = code_patient;
	}

	private String Nom_patient;
	private String Address_patient;
	@Id
	private String Code_patient;
	public String getAddress_patient() {
		return Address_patient;
	}

	public void setAddress_patient(String address_patient) {
		Address_patient = address_patient;
	}
	@ManyToOne
	@JoinColumn(name="nom_ville")
	private Ville ville;
	public Ville getVille() {
		return ville;
	}

	public void setVille(Ville ville) {
		this.ville = ville;
	}

	private String prenom_patient;
	private Date date_entrée;
	@ManyToOne
	@JoinColumn(name="Code_medecin")
	private Médecin medecin;
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Id_Etat_patient")
	private Etat etat;
	@ManyToOne()
	@JoinColumn(name="code_mal")
	private Maladie maladie;
	public String getNom_patient() {
		return Nom_patient;
	}
	
	public Médecin getMedecin() {
		return medecin;
	}

	public void setMedecin(Médecin medecin) {
		this.medecin = medecin;
	}

	public Etat getEtat() {
		return etat;
	}
	public void setEtat(Etat etat) {
		this.etat = etat;
	}
	
	public void setNom_patient(String nom_patient) {
		Nom_patient = nom_patient;
	}
	public String getPrenom_patient() {
		return prenom_patient;
	}
	public void setPrenom_patient(String prenom_patient) {
		this.prenom_patient = prenom_patient;
	}
	public Date getDate_entrée() {
		return date_entrée;
	}
	
	

	

	public void setDate_entrée(Date date_entrée) {
		this.date_entrée = date_entrée;
	}

	public Patient(String code_patient, String nom_patient,
			String address_patient, String prenom_patient, Date date_entrée) {
		super();
		Code_patient = code_patient;
		Nom_patient = nom_patient;
		Address_patient = address_patient;
		this.prenom_patient = prenom_patient;
		this.date_entrée = date_entrée;
	}

	public Maladie getMaladie() {
		return maladie;
	}

	public void setMaladie(Maladie maladie) {
		this.maladie = maladie;
	}

	public Patient() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	
	
	
}
