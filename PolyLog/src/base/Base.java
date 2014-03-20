package base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ResourceBundle;

public class Base {

	final String ficProp = "base";
	private String url;
	private String user;
	private String pwd;
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			System.out.println("Base erreur Class.forName " + e.getMessage());
		}
	}
	
	public Base() {
	}
	
	public Connection getConnection() {
		return connection;
	}

	private boolean debug = true;
	
	private Connection connection = null;
	
	private void message(String s){
		if(debug)
		System.out.println(s);
	}
	
	public void ouvrir() {
		
		try{
			ResourceBundle rb = ResourceBundle.getBundle(ficProp);
			url = rb.getString("url");
			user = rb.getString("user");
			pwd = rb.getString("pwd");

			connection = DriverManager.getConnection(url,user,pwd);
			
			message("User = "+ user );
			message("Url = "+ url );
			message("Pwd = "+ pwd );
			message("Base.ouvrir connexion effectuée");
		}catch (Exception e){
			System.out.println("Base.ouvrir erreur: "+ e.getMessage());
		}
	}
	
	public void fermer() {
		
		try{
			connection.close();
		}catch (Exception e){
			System.out.println("Base.fermer erreur: "+ e.getMessage());
		}
		connection = null;
		message("Base.fermer déconnexion effectuée");
	}	
	
	public boolean identification(String ident,String pwd){
		PreparedStatement ps = null;
		String sql="SELECT * FROM user WHERE name_user='"+ident+"' AND pwd='"+pwd+"'";
		try{
			ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery(sql);
			int compteur = 0;
			while (rs.next())
			{
			    compteur++;
			}
			if(compteur==0) return false; 
			else return true;
		}
		catch (Exception e){
			System.out.println("Base: Identification "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
			return true;
		}
		catch(Exception e){		return false;}

	}
	
	
}
