package com.gestion.MedecinPatients.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Role implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long Id_role;
	private String role_Name;
	@OneToMany(mappedBy="role",fetch=FetchType.LAZY)
	private Collection<Utilisateur> users;
	
	
	public Long getId_role() {
		return Id_role;
	}
	public Collection<Utilisateur> getUsers() {
		return users;
	}
	public void setUsers(Collection<Utilisateur> users) {
		this.users = users;
	}
	public void setId_role(Long id_role) {
		Id_role = id_role;
	}
	public String getRole_Name() {
		return role_Name;
	}
	public void setRole_Name(String role_Name) {
		this.role_Name = role_Name;
	}
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Role(String role_Name) {
		super();
		this.role_Name = role_Name;
	}
}
