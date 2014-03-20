package manager;

import base.Base;

public class Manager{
	private boolean identifie = false;
	private String nom = "";
	Base base = new Base();
	
	public Manager(){
		base.ouvrir();
	}
	
	public boolean isIdentifie() {
		return identifie;
	}

	public void setIdentifie(boolean identifie) {
		this.identifie = identifie;
	}

	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}

	public Base getBase() {
		return base;
	}

	public void setBase(Base base) {
		this.base = base;
	}
	
	
}
