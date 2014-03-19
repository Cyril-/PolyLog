package test;

import static org.junit.Assert.*;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.util.ArrayList;

import org.apache.commons.fileupload.FileItem;
import org.junit.Test;

import Bean.Boat;
import Bean.Group;
import base.Base;

public class test {
	

	private Connection connection = null;
	
	
	
	
	@Test
	public void TestAjouterBateau() throws RemoteException {
		
		Base maBase = new Base();
		maBase.ouvrir();
		System.out.println("\rTest ajouter un bateau");
		String name_boat= "MISTER";
		String notice= "attention au vent";
		FileItem f=null;
		int group= 1;
		
		maBase.ajouterBateau(name_boat,notice,f,group); // ajouteBateau est obligé d'avoir une image pour pouvoir enregistrer le bateau dans la bdd
		ArrayList<Boat> rs=maBase.consultBateau();
		String name = null;
		for(int i=0;i<rs.size();i++){
			if(name_boat==rs.get(i).getName_boat()) name=rs.get(i).getName_boat();
		
		}
		assertFalse(name_boat==name);
	}
	

	
	@Test
	public void TestIdentification() {
		
		Base maBase = new Base();
		maBase.ouvrir();	
		String user="marsault";
		String mdp="123456";
		Boolean b=false;
		b=maBase.identification(user,mdp);
		System.out.println("Test identification");
		assertTrue(b==true);
		
	}
	
	@Test
	public void TestModifierBateau()throws RemoteException{
		
		Base maBase = new Base();
		maBase.ouvrir();
		Boolean b=false;
		 b=maBase.modifierBateau(2,"Titanic", "Attention ICE",null,3);
		 System.out.println("\rTest Modification ");	
		assertTrue(b==true);
	}
	
	@Test
	public void TestModifierBateau2()throws RemoteException{
	
	Base maBase = new Base();
	maBase.ouvrir();
	Boolean b=false;
	 b=maBase.modifierBateau(2,"Titanic", "Attention ICE",3);
	 System.out.println("\rTest Modification ");	
	assertTrue(b==true);
}
	@Test
	public void TestRecupGroup() throws RemoteException{
		Base maBase = new Base();
		maBase.ouvrir();
		
		String type=maBase.recupGroup(3);
		assertTrue(type.equals("Kayak"));
		
	}
	
	@Test
	public void TestConsultBateau() throws RemoteException {
		
		Base maBase = new Base();
		maBase.ouvrir();
		System.out.println("\rTest lister les bateaux");	
		ArrayList<Boat> rs=maBase.consultBateau();
		Boolean b = false;
		for(int i=0;i<rs.size();i++){
			b=true;	
		}
		assertTrue(b==true);
	}
	
	@Test
	public void TestconsultBateau2()throws RemoteException{
		Base maBase = new Base();
		maBase.ouvrir();
		System.out.println("\rTest lister les bateaux dont le nom contient Lancelot");	
		ArrayList<Boat> rs=maBase.consultBateau("Saupiquet","name_boat");
		Boolean b = false;
		for(int i=0;i<rs.size();i++){
			b=true;	
		}
		assertTrue(b==true);
	}
	
	@Test
	public void TestconsultBateau3()throws RemoteException{
		Base maBase = new Base();
		maBase.ouvrir();
		System.out.println("\rTest liste du bateau d'id=44");	
		ArrayList<Boat> rs=maBase.consultBateau(44);
		Boolean b = false;
		for(int i=0;i<rs.size();i++){
			b=true;	
		}
		assertTrue(b==true);
	}
		
	@Test
	public void TestconsultBateau4()throws RemoteException{
		Base maBase = new Base();
		maBase.ouvrir();
		System.out.println("\rTest liste des kayaks");
		ArrayList<Boat> rs=maBase.consultBateau("3");
		
		Boolean b = false;
		for(int i=0;i<rs.size();i++){
			System.out.println("type:"+ rs.get(i).getName_boat());
			b=true;	
		}
		assertTrue(b==true);
	}
	
	@Test	
	public void TestrecupBlob()throws RemoteException{  /* si l'image vaut vide alors on a pas rŽussi a la rŽcup */
		Base maBase = new Base();
		maBase.ouvrir();
		System.out.println("\rTest recupération d'image");
		byte[] buffer=null;
		String image="";
		buffer=maBase.recupBlob(4);
		image=buffer.toString();
		assertFalse(image.equals(""));
		}
		
	@Test	
	public void TestRecupSelectG()throws RemoteException{
		Base maBase = new Base();
		maBase.ouvrir();
		System.out.println("\rTest recupération de la liste des groupes");
		ArrayList<Group> groupe= maBase.recupSelectG();
		String voilier="";
		for(int i=0;i<groupe.size();i++){
			if(i==6) voilier= groupe.get(i).getNom();
		}
		assertTrue(voilier.equals(voilier));
	}
	
	@Test
	public void Testfermer()throws RemoteException{
		System.out.println("\rTest deconnexion");
		Base maBase = new Base();
		maBase.ouvrir();
		maBase.fermer();
		connection=maBase.getConnection();
		assertTrue(connection==null);
	}
		
	@Test
	public void Testouvrir()throws RemoteException{
		System.out.println("\rTest connexion");
		Base maBase = new Base();
		maBase.ouvrir();
		connection=maBase.getConnection();
		assertTrue(connection!=null);
		}

}
