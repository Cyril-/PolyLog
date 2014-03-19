package manager;

import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import serveurRMI.InterfaceServeurRMI;

public class Manager{
	boolean identifie = false;
	String nom = "";
	private InterfaceServeurRMI isr;
	
	public Manager() throws RemoteException{
		int port = 20100;
		
		try {
			Registry registry = LocateRegistry.getRegistry(port);
			isr = (InterfaceServeurRMI) registry.lookup("serveurRMI");
			} catch (RemoteException | NotBoundException e) {
			System.out.println("Erreur ClientRMI.main(): " + e.getMessage());
		}
	}
	

	public InterfaceServeurRMI getIsr() {
		return isr;
	}
	
	public void setIsr(InterfaceServeurRMI isr) {
		this.isr = isr;
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
	
	
}
