package beans;

public class Reservation {
	String nom;
    String prenom;
    String adresse;
    String ville;
    String tel;
    String nomEvent;
    String desc;
    String dateDebut;
    String dateFin;
    String nbPart;
    String prix;
    String nomAssur;
    String nbAssur;
    String dateSous;
    
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getNomEvent() {
		return nomEvent;
	}

	public void setNomEvent(String nomEvent) {
		this.nomEvent = nomEvent;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getDateDebut() {
		return dateDebut;
	}

	public void setDateDebut(String dateDebut) {
		this.dateDebut = dateDebut;
	}

	public String getDateFin() {
		return dateFin;
	}

	public void setDateFin(String dateFin) {
		this.dateFin = dateFin;
	}

	public String getNbPart() {
		return nbPart;
	}

	public void setNbPart(String nbPart) {
		this.nbPart = nbPart;
	}

	public String getPrix() {
		return prix;
	}

	public void setPrix(String prix) {
		this.prix = prix;
	}

	public String getNomAssur() {
		return nomAssur;
	}

	public void setNomAssur(String nomAssur) {
		this.nomAssur = nomAssur;
	}

	public String getNbAssur() {
		return nbAssur;
	}

	public void setNbAssur(String nbAssur) {
		this.nbAssur = nbAssur;
	}

	public String getDateSous() {
		return dateSous;
	}

	public void setDateSous(String dateSous) {
		this.dateSous = dateSous;
	}

	public Reservation(String nom, String prenom, String adresse, String ville,
			String tel, String nomEvent, String desc, String dateDebut,
			String dateFin, String nbPart, String prix, String nomAssur,
			String nbAssur, String dateSous) {
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.ville = ville;
		this.tel = tel;
		this.nomEvent = nomEvent;
		this.desc = desc;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.nbPart = nbPart;
		this.prix = prix;
		this.nomAssur = nomAssur;
		this.nbAssur = nbAssur;
		this.dateSous = dateSous;
	}
    
}
