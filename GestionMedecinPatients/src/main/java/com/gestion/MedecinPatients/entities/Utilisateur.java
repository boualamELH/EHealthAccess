package com.gestion.MedecinPatients.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
@Entity
public class Utilisateur implements Serializable{
    @Id
	private String Code_user;
	private String User_Name;
	private String Password;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_idRole")
	private Role role;
	
	
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Utilisateur() {
		super();
		// TODO Auto-generated constructor stub
	}

	


	public Utilisateur(String user_Name, String password) {
		super();
		User_Name = user_Name;
		Password = password;
	}

	public String getCode_user() {
		return Code_user;
	}
	public void setCode_user(String code_user) {
		Code_user = code_user;
	}
	public String getUser_Name() {
		return User_Name;
	}
	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
}
