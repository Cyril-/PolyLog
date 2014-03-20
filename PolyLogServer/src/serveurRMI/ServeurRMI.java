package serveurRMI;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import base.Base;

public class ServeurRMI implements InterfaceServeurRMI {

	private int port = 20100;
	private Registry registry = null;
	private static Base base = new Base();
	private static Connection connection;

	public static void main(String[] args) {
		ServeurRMI serveur = new ServeurRMI();
		serveur.lancer();
		serveur.connexionBase();
	}

	public void lancer() {
		try {
			LocateRegistry.createRegistry(port);
			registry = LocateRegistry.getRegistry(port);
			InterfaceServeurRMI serveurDistant = (InterfaceServeurRMI) UnicastRemoteObject
					.exportObject(this, 0);
			registry.rebind("serveurRMI", serveurDistant);
		} catch (RemoteException e) {
			System.out.println("Erreur ServeurRMI.lancer(): " + e.getMessage());
		}

		System.out.println("Serveur RMI prêt");
	}
	
	public void connexionBase(){
		connection = base.ouvrir();
	}

	@Override 
	public boolean connexion(String identifiant, String mdp)
			throws RemoteException {
		boolean connecte = false;

		try {
			Statement st = connection.createStatement();
			String sql = "select * from user where name_user = '"
					+ identifiant + "' and pwd='" + mdp + "'";
			ResultSet rs = st.executeQuery(sql);

			if (rs.next())
				connecte = true;

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {}
			
			try {
				if (st != null)
					st.close();
			} catch (Exception e) {}
			
		} catch (SQLException e) {
			System.out.println("erreur : " + e.getMessage());
			return false;
		}

		return connecte;
	}

}
