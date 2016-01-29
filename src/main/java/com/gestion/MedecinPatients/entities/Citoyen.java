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
	private String pr�nomCitoyen;
	private String Adresse;
	@ManyToOne
	@JoinColumn(name="Code_medecin")
	private M�decin medecin;
	
	public M�decin getMedecin() {
		return medecin;
	}
	public void setMedecin(M�decin medecin) {
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
	public String getPr�nomCitoyen() {
		return pr�nomCitoyen;
	}
	public void setPr�nomCitoyen(String pr�nomCitoyen) {
		this.pr�nomCitoyen = pr�nomCitoyen;
	}
	public String getAdresse() {
		return Adresse;
	}
	public void setAdresse(String adresse) {
		Adresse = adresse;
	}
	public Citoyen(String codeCitoyen, String nomCitoyen, String pr�nomCitoyen,
			String adresse) {
		super();
		this.codeCitoyen = codeCitoyen;
		this.nomCitoyen = nomCitoyen;
		this.pr�nomCitoyen = pr�nomCitoyen;
		Adresse = adresse;
	}
	public Citoyen() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
