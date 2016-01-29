package com.gestion.MedecinPatients.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
@Entity
public class Maladie implements Serializable{
   
	@Id
    private String libellé;
	private String designation;
	@ManyToOne
	@JoinColumn(name="nomVille")
	private Ville ville;
	

	public String getLibellé() {
		return libellé;
	}
	public void setLibellé(String libellé) {
		this.libellé = libellé;
	}
	
	
	
	public Ville getVille() {
		return ville;
	}
	public void setVille(Ville ville) {
		this.ville = ville;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public Maladie(String libellé, String designation) {
		super();
		this.libellé = libellé;
		this.designation = designation;
	}
	public Maladie() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
