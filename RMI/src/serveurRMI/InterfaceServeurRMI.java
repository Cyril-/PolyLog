package serveurRMI;


import java.rmi.Remote;

import Bean.Boat;
import Bean.Group;

import java.rmi.RemoteException;
import java.util.ArrayList;

import org.apache.commons.fileupload.FileItem;

import base.Base;

public interface InterfaceServeurRMI extends Remote {

	boolean ajouterBateau(String name_boat, String notice,FileItem item,int group) throws RemoteException;
	boolean modifierBateau(int id,String name_boat, String notice,int group) throws RemoteException;
	boolean modifierBateau(int id,String name_boat, String notice,FileItem item,int group) throws RemoteException;
	ArrayList<Boat> consultBateau() throws RemoteException;
	ArrayList<Boat> consultBateau(String search, String categorie,String groupe) throws RemoteException;
	ArrayList<Boat> consultBateau(String search, String categorie) throws RemoteException;
	ArrayList<Boat> consultBateau(String categorie) throws RemoteException;
	ArrayList<Boat> consultBateau(int id) throws RemoteException;
	boolean identification(String ident, String pwd) throws RemoteException;
	public byte[]  recupBlob(int id) throws RemoteException;
	public Base getMaBase() throws RemoteException;
	public ArrayList<Group> recupSelectG() throws RemoteException;
	}

