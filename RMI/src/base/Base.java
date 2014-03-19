package base;

import Bean.Boat;
import Bean.Group;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ResourceBundle;

import org.apache.commons.io.IOUtils;
import org.apache.commons.fileupload.FileItem;



public class Base{

	final String ficProp = "base";
	private String url;
	private String user;
	private String pwd;
	
	public Connection getConnection() {
		return connection;
	}

	private boolean debug = true;
	
	private Connection connection = null;
	
	private void message(String s){
		if(debug)
		System.out.println(s);
		

	}
	

	
	public void ouvrir(){
		
		try{
			ResourceBundle rb = ResourceBundle.getBundle(ficProp);
			url = rb.getString("url");
			user = rb.getString("user");
			pwd = rb.getString("pwd");
			connection = DriverManager.getConnection(url,user,pwd);
		}catch (Exception e){
			System.out.println("Base.ouvrir erreur: "+ e.getMessage());
		}
		
		message("User = "+ user );
		message("Url = "+ url );
		message("Pwd = "+ pwd );
		message("Base.ouvrir connexion effectuée");
		
	}
	
	public boolean ajouterBateau(String name_boat, String notice,FileItem item,int group){
		PreparedStatement ps = null;  
		
		String sql="insert into boat (name_boat,notice,picture_b,group_boat) values (?,?,?,?)";
		try{
			ps = connection.prepareStatement(sql); // connexion ‡ la bdd avec la requete
			ps.setString(1, name_boat);		// recupere les valeurs des points d'interogation pour effectuer l'ajout dans la bonne catÈgorie
			ps.setString(2, notice);
			ps.setBinaryStream(3,item.getInputStream());
			ps.setInt(4, group);
			ps.executeUpdate();
		}
		catch (Exception e){
			System.out.println("Base: AjouterBateau "+ e.getMessage());
			return false;
		}
		
		try{
			if(ps!= null) ps.close();
			return true;
		}
		catch(Exception e){}
		return false;
	}
	
	public boolean modifierBateau(int id,String name_boat, String notice,FileItem item,int group){
		Boat monBoat = new Boat(name_boat,notice,group);
		PreparedStatement ps = null;
		String sql="UPDATE boat SET name_boat=?, notice=?, picture_b=?, group_boat=?  WHERE id_boat='"+id+"'";
		
		try{
			ps = connection.prepareStatement(sql);
			ps.setString(1, monBoat.getName_boat());
			ps.setString(2, monBoat.getNotice());
			ps.setBinaryStream(3,item.getInputStream());
			ps.setInt(4, monBoat.getGroup());
			ps.executeUpdate();
		}
		catch (Exception e){
			System.out.println("Base: ModifBateau "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
			return true;
		}
		catch(Exception e){}
		return false;
	}
	
	public boolean modifierBateau(int id,String name_boat, String notice,int group){
		Boat monBoat = new Boat(name_boat,notice,group);
		PreparedStatement ps = null;
		String sql="UPDATE boat SET name_boat=?, notice=?, group_boat=?  WHERE id_boat='"+id+"'";
		
		try{
			ps = connection.prepareStatement(sql);
			ps.setString(1, monBoat.getName_boat());
			ps.setString(2, monBoat.getNotice());
			ps.setInt(3, monBoat.getGroup());
			ps.executeUpdate();
		}
		catch (Exception e){
			System.out.println("Base: ModifBateau "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
			return true;
		}
		catch(Exception e){}
		return false;
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
	
	public ArrayList<Boat> consultBateau(){
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArrayList<Boat> list = new ArrayList<Boat>();
		String sql="SELECT * FROM boat";
		try{
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next())
			{
				String ret = recupGroup(rs.getInt("group_boat"));
				list.add(new Boat(rs.getInt("id_boat"),rs.getString("name_boat"), rs.getString("notice"), ret)); // ajout dans l'arraylist
			} 
			
		}
		catch (Exception e){
			System.out.println("Base: ConsultBateau "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
		}
		catch(Exception e){}
		return list;
	}
	
	public String recupGroup(int group){
		PreparedStatement ps = null;
		ResultSet rs=null; 
		String ret =null;
		String sql="SELECT * FROM groupe WHERE id_group="+group;
		try{
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery(); 
			while (rs.next())
			{
				ret=rs.getString("name_group");
			}

		}
		catch (Exception e){
			System.out.println("Base: recupGroup "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
		}
		catch(Exception e){}
		
		return ret;
	}
	
	public ArrayList<Boat> consultBateau(String search, String categorie){
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArrayList<Boat> list = new ArrayList<Boat>();
		String sql="SELECT * FROM boat where "+categorie+" like '%"+search+"%'";
		try{
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next())
			{
				String ret = recupGroup(rs.getInt("group_boat"));
			    list.add(new Boat(rs.getInt("id_boat"),rs.getString("name_boat"), rs.getString("notice"), ret));
			} 
			
		}
		catch (Exception e){
			System.out.println("Base: ConsultBateauSearch "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
		}
		catch(Exception e){}
		return list;
	}
	
	public ArrayList<Boat> consultBateau(String search, String categorie,String groupe){
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArrayList<Boat> list = new ArrayList<Boat>();
		String sql="SELECT * FROM boat where "+categorie+" like '%"+search+"%' AND group_boat="+groupe;
		try{
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next())
			{
				String ret = recupGroup(rs.getInt("group_boat"));
			    list.add(new Boat(rs.getInt("id_boat"),rs.getString("name_boat"), rs.getString("notice"), ret));
			} 
			
		}
		catch (Exception e){
			System.out.println("Base: ConsultBateauSearch "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
		}
		catch(Exception e){}
		return list;
	}
	
	public ArrayList<Boat> consultBateau(String categorie){
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArrayList<Boat> list = new ArrayList<Boat>();
		String sql="SELECT * FROM boat where group_boat like "+categorie;
		try{
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next())
			{
				String ret = recupGroup(rs.getInt("group_boat"));
			    list.add(new Boat(rs.getInt("id_boat"),rs.getString("name_boat"), rs.getString("notice"), ret));
			} 
			
		}
		catch (Exception e){
			System.out.println("Base: ConsultBateauSearch "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
		}
		catch(Exception e){}
		return list;
	}
	
	public ArrayList<Boat> consultBateau(int id){
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArrayList<Boat> list = new ArrayList<Boat>();
		String sql="SELECT * FROM boat where id_boat='"+id+"'";
		try{
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next())
			{
				String ret = recupGroup(rs.getInt("group_boat"));
			    list.add(new Boat(rs.getInt("id_boat"),rs.getString("name_boat"), rs.getString("notice"), ret));
			} 
		}
		catch (Exception e){
			System.out.println("Base: ConsultBateau "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
		}
		catch(Exception e){}
		return list;
	}

	public byte[] recupBlob(int id){
		PreparedStatement ps = null;
		ResultSet rs=null;
		InputStream b=null;
		byte[]  buffer  = null;
		String sql="SELECT picture_b FROM boat where id_boat="+id;
		try{
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			b = rs.getBinaryStream("picture_b");
			buffer = IOUtils.toByteArray(b);
		}
		catch (Exception e){
			System.out.println("Base: recupBlob "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
		}
		catch(Exception e){}
		return buffer;
	}
	
	public ArrayList<Group> recupSelectG(){
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArrayList<Group> list = new ArrayList<Group>();
		String sql="SELECT * FROM groupe GROUP BY id_group";
		try{
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next())
			{
			   list.add(   new Group(    rs.getInt("id_group"),rs.getString("name_group")   )   );
			} 
		}
		catch (Exception e){
			System.out.println("Base: RecupSelectG "+ e.getMessage());
		}
		
		try{
			if(ps!= null) ps.close();
		}
		catch(Exception e){}
		return list;
	}
	
	public void fermer(){
		
		try{
			connection.close();
		}catch (Exception e){
			System.out.println("Base.fermer erreur: "+ e.getMessage());
		}
		connection = null;
		message("Base.fermer déconnexion effectuée");
	}	
	


	
	   
	
}
