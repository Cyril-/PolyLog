package serveurRMI;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface InterfaceServeurRMI extends Remote {

	/* Connecte un utilisateur a la base de donnees */
	public boolean connexion(String identifiant, String mdp)
			throws RemoteException;

}