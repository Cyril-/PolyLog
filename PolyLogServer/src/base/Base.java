package base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class Base {

	final String ficProp = "base";
	private String url;
	private String user;
	private String pwd;

	private Connection connection = null;

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			System.out.println("Base erreur Class.forName " + e.getMessage());
		}
	}

	public Connection ouvrir() {
		try {
			ResourceBundle rb = ResourceBundle.getBundle(ficProp);
			url = rb.getString("url");
			user = rb.getString("user");
			pwd = rb.getString("pwd");

			connection = DriverManager.getConnection(url, user, pwd);
		} catch (Exception e) {
			System.out.println("Base.ouvrir erreur : " + e.getMessage());
		}
		
		System.out.println("Connection à la base effectuée");

		return connection;
	}

	public void fermer() {
		try {
			if (connection != null)
				connection.close();
		} catch (Exception e) {
			System.out.println("Base.fermer erreur :" + e.getMessage());
		}
		connection = null;
	}

	public Connection getConnection() {
		return connection;
	}

}
