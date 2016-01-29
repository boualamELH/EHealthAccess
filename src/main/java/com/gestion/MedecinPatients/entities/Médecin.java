package com.gestion.MedecinPatients.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.jws.Oneway;
import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorValue;
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
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="Type_medecin")
public class Médecin implements Serializable {

@Id
private String Code_medecin;
private String NomMedecin;
private String PrenomMedecin;
private String Lieu_travail;
private String Specialité_Medecin;
@OneToMany(mappedBy="medecin", fetch=FetchType.EAGER)
private Collection<Patient> patients;
@OneToMany(mappedBy="medecin",fetch=FetchType.EAGER)
@Fetch(value = FetchMode.SUBSELECT)

private Collection<Citoyen> citoyens;
public Collection<Patient> getPatients() {
	return patients;
}
public void setPatients(Collection<Patient> patients) {
	this.patients = patients;
}

public String getCode_medecin() {
	return Code_medecin;
}
public void setCode_medecin(String code_medecin) {
	Code_medecin = code_medecin;
}
public Collection<Citoyen> getCitoyens() {
	return citoyens;
}
public void setCitoyens(Collection<Citoyen> citoyens) {
	this.citoyens = citoyens;
}
public String getNomMedecin() {
	return NomMedecin;
}
public void setNomMedecin(String nomMedecin) {
	NomMedecin = nomMedecin;
}
public String getPrenomMedecin() {
	return PrenomMedecin;
}
public void setPrenomMedecin(String prenomMedecin) {
	PrenomMedecin = prenomMedecin;
}
public String getLieu_travail() {
	return Lieu_travail;
}
public void setLieu_travail(String lieu_travail) {
	Lieu_travail = lieu_travail;
}
public String getSpecialité_Medecin() {
	return Specialité_Medecin;
}
public void setSpecialité_Medecin(String specialité_Medecin) {
	Specialité_Medecin = specialité_Medecin;
}

public Médecin(String code_medecin, String nomMedecin, String prenomMedecin,
		String lieu_travail, String specialité_Medecin) {
	super();
	Code_medecin = code_medecin;
	NomMedecin = nomMedecin;
	PrenomMedecin = prenomMedecin;
	Lieu_travail = lieu_travail;
	Specialité_Medecin = specialité_Medecin;
}
public Médecin() {
	super();
	// TODO Auto-generated constructor stub
}

}
