package com.gestion.MedecinPatients.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
@Entity
public class Etat implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String description;
	@OneToOne(mappedBy="etat",fetch=FetchType.LAZY)
	private Patient patients;

	public String getDescription() {
		return description;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Patient getPatients() {
		return patients;
	}

	public void setPatients(Patient patients) {
		this.patients = patients;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Etat(String description) {
		super();
		this.description = description;
	}

	public Etat() {
		super();
		// TODO Auto-generated constructor stub
	}

}
