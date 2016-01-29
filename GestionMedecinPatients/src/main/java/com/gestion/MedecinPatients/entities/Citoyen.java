package com.gestion.MedecinPatients.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
@Entity
public class Citoyen implements Serializable{
    @Id
	private String codeCitoyen;
	private String nomCitoyen;
	private String prénomCitoyen;
	private String Adresse;
	@ManyToOne
	@JoinColumn(name="Code_medecin")
	private Médecin medecin;
	
	public Médecin getMedecin() {
		return medecin;
	}
	public void setMedecin(Médecin medecin) {
		this.medecin = medecin;
	}
	public String getCodeCitoyen() {
		return codeCitoyen;
	}
	public void setCodeCitoyen(String codeCitoyen) {
		this.codeCitoyen = codeCitoyen;
	}
	public String getNomCitoyen() {
		return nomCitoyen;
	}
	public void setNomCitoyen(String nomCitoyen) {
		this.nomCitoyen = nomCitoyen;
	}
	public String getPrénomCitoyen() {
		return prénomCitoyen;
	}
	public void setPrénomCitoyen(String prénomCitoyen) {
		this.prénomCitoyen = prénomCitoyen;
	}
	public String getAdresse() {
		return Adresse;
	}
	public void setAdresse(String adresse) {
		Adresse = adresse;
	}
	public Citoyen(String codeCitoyen, String nomCitoyen, String prénomCitoyen,
			String adresse) {
		super();
		this.codeCitoyen = codeCitoyen;
		this.nomCitoyen = nomCitoyen;
		this.prénomCitoyen = prénomCitoyen;
		Adresse = adresse;
	}
	public Citoyen() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
