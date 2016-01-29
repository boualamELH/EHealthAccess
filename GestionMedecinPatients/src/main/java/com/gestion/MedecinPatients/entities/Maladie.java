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
    private String libell�;
	private String designation;
	@ManyToOne
	@JoinColumn(name="nomVille")
	private Ville ville;
	

	public String getLibell�() {
		return libell�;
	}
	public void setLibell�(String libell�) {
		this.libell� = libell�;
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
	public Maladie(String libell�, String designation) {
		super();
		this.libell� = libell�;
		this.designation = designation;
	}
	public Maladie() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
