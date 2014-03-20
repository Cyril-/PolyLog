package manager;

import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import serveurRMI.InterfaceServeurRMI;
import base.Base;

public class Manager{
	private InterfaceServeurRMI serveur;
	private boolean identifie = false;
	private String nom = "";
	Base base = new Base();
	
	public Manager(){
		int port = 20100;

		try {
			Registry registry = LocateRegistry.getRegistry(port);
			serveur = (InterfaceServeurRMI) registry.lookup("serveurRMI");
		} catch (RemoteException | NotBoundException e) {
			System.out.println("Erreur Manager(): " + e.getMessage());
		}
	}
	
	public InterfaceServeurRMI getServeur() {
		return serveur;
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
