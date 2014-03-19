package serveurRMI;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;

import org.apache.commons.fileupload.FileItem;

import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventAttendee;
import com.google.api.services.calendar.model.EventDateTime;
import com.google.api.client.googleapis.services.*;
import Bean.Boat;
import Bean.Group;
import base.Base;

public class ServeurRMI implements InterfaceServeurRMI{
	
	Event event = new Event();
	int port = 20100;
	Registry registry = null;
	Base maBase = new Base();
	
	public void lancer() {
		try {
			LocateRegistry.createRegistry(port);
			registry = LocateRegistry.getRegistry(port);
			InterfaceServeurRMI serveurDistant = 
					(InterfaceServeurRMI) UnicastRemoteObject.exportObject(this, 0);
			registry.rebind("serveurRMI", serveurDistant);
			maBase.ouvrir();
		} catch (RemoteException e) {
			System.out.println("Erreur ServeurRMI.lancer(): " + e.getMessage());
		}
		
		System.out.println("Serveur RMI pret");
	}

	public Base getMaBase() {
		return maBase;
	}

	public static void main(String [] args) {
		ServeurRMI serveur = new ServeurRMI();
		serveur.lancer();
	}

	@Override
	public boolean ajouterBateau(String name, String notice,FileItem item,int group) throws RemoteException {
		if(maBase.ajouterBateau(name,notice,item,group)) return true;
		else return false;
	}

	public ArrayList<Group> recupSelectG(){ // recupere la liste des types de bateaux
		return maBase.recupSelectG();
	}
	
	@Override
	public boolean modifierBateau(int id,String name_boat, String notice,FileItem item,int group) throws RemoteException{ // modifie tous les champs du bateau
		return maBase.modifierBateau(id,name_boat,notice,item,group);
	}
	
	@Override
	public boolean modifierBateau(int id,String name_boat, String notice,int group) throws RemoteException{ // modifie tous sauf l'image
		return maBase.modifierBateau(id,name_boat,notice,group);
	}

	@Override
	public ArrayList<Boat> consultBateau() throws RemoteException {  // Permet de lister tous les bateaux
		return maBase.consultBateau();
	}
	
	public ArrayList<Boat> consultBateau(String search, String categorie) throws RemoteException {  // permet de lister les bateaux en fonction de la recherche et de la catégorie(notice ou nom du bateau
		return maBase.consultBateau(search, categorie);
	}
	
	public ArrayList<Boat> consultBateau(String categorie) throws RemoteException { // permet de lister les bateaux en fonction du type des bateaux (voilier, à moteur...)
		return maBase.consultBateau(categorie);
	}
	
	public ArrayList<Boat> consultBateau(int id) throws RemoteException { // affiche le bateau en fonction de l'id
		return maBase.consultBateau(id);
	}
	
	public ArrayList<Boat> consultBateau(String search, String categorie,String groupe) throws RemoteException { // permet de lister les bateaux en fonction du nom ou de la notice et du type
		return maBase.consultBateau(search, categorie,groupe);
	}
	
	
	@Override
	public boolean identification(String ident,String pwd) throws RemoteException {
		if(maBase.identification(ident,pwd)) return true;
		else return false;
	}

	public byte[]  recupBlob(int id) throws RemoteException{ // recuperer en tableau de byte l'image
		return maBase.recupBlob(id);
	}
}
