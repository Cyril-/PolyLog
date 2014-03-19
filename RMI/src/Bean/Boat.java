package Bean;

import java.io.Serializable;

public class Boat implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7980651980947655106L;
	Integer id_boat = null;
	String name_boat = null;
	String notice = null;
	String groupe = null;
	int group;
	
	public Boat(String name,String notice,int groupe){
	this.name_boat = name;
	this.notice = notice;

	this.group = groupe;
	}
	
	public Boat(String name,String notice,String groupe){
		this.name_boat = name;
		this.notice = notice;
		this.groupe = groupe;
		}
	
	public Boat(int id,String name,String notice,int groupe){
		this.id_boat=id;
		this.name_boat = name;
		this.notice = notice;
		this.group = groupe;
		}
	
	public Boat(int id,String name,String notice,String groupe){
		this.id_boat=id;
		this.name_boat = name;
		this.notice = notice;
		this.groupe = groupe;
		}
	
	public Integer getId_boat() {
		return id_boat;
	}
	public void setId_boat(Integer id_boat) {
		this.id_boat = id_boat;
	}
	public String getName_boat() {
		return name_boat;
	}
	public void setName_boat(String name_boat) {
		this.name_boat = name_boat;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	
	public String getGroupe() {
		return groupe;
	}
	public void setGroupe(String group) {
		this.groupe = group;
	}
	
}
