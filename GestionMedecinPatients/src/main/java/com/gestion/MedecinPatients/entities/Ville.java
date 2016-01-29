package com.gestion.MedecinPatients.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
@Entity
public class Ville implements Serializable {
    @Id
	private String Nom_ville;
	private Long Nbr_Inf_par_maladie;
	
	@OneToMany(mappedBy="ville", fetch=FetchType.LAZY)
	 private Collection<Maladie> maladies;
	public String getNom_ville() {
		return Nom_ville;
	}
	public Collection<Patient> getPatients() {
		return patients;
	}
	public void setPatients(Collection<Patient> patients) {
		this.patients = patients;
	}
	@OneToMany(mappedBy="ville", fetch=FetchType.LAZY)
	 private Collection<Patient> patients;
	public void setNom_ville(String nom_ville) {
		Nom_ville = nom_ville;
	}
	public Long getNbr_Inf_par_maladie() {
		return Nbr_Inf_par_maladie;
	}
	public void setNbr_Inf_par_maladie(Long nbr_Inf_par_maladie) {
		Nbr_Inf_par_maladie = nbr_Inf_par_maladie;
	}
	public Ville(String nom_ville, Long nbr_Inf_par_maladie) {
		super();
		Nom_ville = nom_ville;
		Nbr_Inf_par_maladie = nbr_Inf_par_maladie;
	}
	public Collection<Maladie> getMaladies() {
		return maladies;
	}
	public void setMaladies(Collection<Maladie> maladies) {
		this.maladies = maladies;
	}
	public Ville() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

