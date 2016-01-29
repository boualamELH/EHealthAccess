package com.gestion.MedecinPatients.models;

import java.util.List;

import com.gestion.MedecinPatients.entities.Citoyen;
import com.gestion.MedecinPatients.entities.Maladie;
import com.gestion.MedecinPatients.entities.Médecin;
import com.gestion.MedecinPatients.entities.Patient;

public class GestionForme {

private String code;
private String codemedecin;

public String getCodemedecin() {
	return codemedecin;
}

public void setCodemedecin(String codemedecin) {
	this.codemedecin = codemedecin;
}

private Patient patient;
private Citoyen citoyen;
private String supprimer;
private String confirmer;
private String enregistrer;
private String selected;
private String selectedvalue;

public String getSelectedvalue() {
	return selectedvalue;
}

public void setSelectedvalue(String selectedvalue) {
	this.selectedvalue = selectedvalue;
}

public String getSelected() {
	return selected;
}

public void setSelected(String selected) {
	this.selected = selected;
}

public String getEnregistrer() {
	return enregistrer;
}

public void setEnregistrer(String enregistrer) {
	this.enregistrer = enregistrer;
}

private String j_username;
private String j_password;
private int page=0;
private int nbligne=2;
private Long nbpages;
public static int flag;


public int getFlag() {
	return flag;
}

public void setFlag(int flag) {
	this.flag = flag;
}

public int getPage() {
	return page;
}

public void setPage(int page) {
	this.page = page;
}

public int getNbligne() {
	return nbligne;
}

public void setNbligne(int nbligne) {
	this.nbligne = nbligne;
}

public Long getNbpages() {
	return nbpages;
}

public void setNbpages(Long nbpages) {
	this.nbpages = nbpages;
}

public String getJ_username() {
	return j_username;
}

public void setJ_username(String j_username) {
	this.j_username = j_username;
}

public String getJ_password() {
	return j_password;
}

public void setJ_password(String j_password) {
	this.j_password = j_password;
}

public String getConfirmer() {
	return confirmer;
}

public void setConfirmer(String confirmer) {
	this.confirmer = confirmer;
}

public String getSupprimer() {
	return supprimer;
}

public void setSupprimer(String supprimer) {
	this.supprimer = supprimer;
}

public Citoyen getCitoyen() {
	return citoyen;
}

public void setCitoyen(Citoyen citoyen) {
	this.citoyen = citoyen;
}

private String exception;
private List<Patient> patients;
private List<Médecin> medecins;
private String typemedecin;
public List<Médecin> getMedecins() {
	return medecins;
}

public String getTypemedecin() {
	return typemedecin;
}

public void setTypemedecin(String typemedecin) {
	this.typemedecin = typemedecin;
}

public void setMedecins(List<Médecin> medecins) {
	this.medecins = medecins;
}

private String nom;
private String prenom;
private String Adresse;
private String description;
private Médecin med;
private Maladie maladie;
private String libelle;
private String designation;
private String specialite;
private String lieu_travail;


public String getSpecialite() {
	return specialite;
}

public void setSpecialite(String specialite) {
	this.specialite = specialite;
}

public String getLieu_travail() {
	return lieu_travail;
}

public void setLieu_travail(String lieu_travail) {
	this.lieu_travail = lieu_travail;
}

public String getLibelle() {
	return libelle;
}

public void setLibelle(String libelle) {
	this.libelle = libelle;
}

public String getDesignation() {
	return designation;
}

public void setDesignation(String designation) {
	this.designation = designation;
}

public Maladie getMaladie() {
	return maladie;
}

public void setMaladie(Maladie maladie) {
	this.maladie = maladie;
}

public Médecin getMed() {
	return med;
}

public void setMed(Médecin med) {
	this.med = med;
}

public String getNom() {
	return nom;
}

public void setNom(String nom) {
	this.nom = nom;
}

public String getPrenom() {
	return prenom;
}

public void setPrenom(String prenom) {
	this.prenom = prenom;
}

public String getAdresse() {
	return Adresse;
}

public void setAdresse(String adresse) {
	Adresse = adresse;
}


public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public List<Patient> getPatients() {
	return patients;
}

public void setPatients(List<Patient> patients) {
	this.patients = patients;
}

public String getException() {
	return exception;
}

public void setException(String exception) {
	this.exception = exception;
}

public Patient getPatient() {
	return patient;
}

public void setPatient(Patient patient) {
	this.patient = patient;
}

public String getCode() {
	return code;
}

public void setCode(String code) {
	this.code = code;
}
}

