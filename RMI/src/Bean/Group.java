package Bean;

import java.io.Serializable;

public class Group implements Serializable {

	int id;
	String nom;
	
	public Group(int idd,String name){
		this.id=idd;
		this.nom=name;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	private static final long serialVersionUID = 4928302798204508127L;

}
