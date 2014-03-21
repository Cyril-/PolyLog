package servlet;

import java.io.FileInputStream;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.Manager;
import beans.Reservation;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class Pdf
 */
@WebServlet("/ConventionPDF")
public class ConventionPDF extends HttpServlet {
	private static final long serialVersionUID = 8461920144699965519L;
	private Manager manager;
	private Reservation reserv;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConventionPDF() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Manager manager = (Manager) request.getSession().getAttribute("manager");
		if(manager==null) manager = new Manager();
		request.getSession().setAttribute("manager", manager);
		reserv=manager.getReserv();
			creerConvention(request,response);
		
  }
    
    protected void creerConvention(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Document document = new Document();
      	try {
            
      		/********Permet d'afficher le pdf en ligne************/
      	
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", " inline; filename=ConventionUtilisation.pdf");
            PdfWriter.getInstance(document,response.getOutputStream());
      		

            /********Permet d'ouvrir le pdf**********
          	
      		response.setContentType("application/pdf");
    		response.setHeader("Content-Disposition",
    				"attachment; filename=ConventionUtilisation");
    		OutputStream os = response.getOutputStream();
    		try {
    			FileInputStream ips = new FileInputStream(System.getProperty("user.dir")
    					+ ("\\ConventionUtilisation.pdf"));
    			InputStreamReader ipsr = new InputStreamReader(ips);

    			byte buffer[] = new byte[512 * 1024];
    			int nbLecture;
    			while ((nbLecture = ips.read(buffer)) != -1) {
    				os.write(buffer, 0, nbLecture);
    			}

    		} catch (Exception e) {
    			e.printStackTrace();
    		} finally {
    			try {
    				os.close();
    			} catch (Exception e) {
    			}
    		}
            
            /****************************************************/

            document.open();
              
            
            /*********************Mise en place de la presentation du document***********************/
            
            document.addTitle("Convention d'utilisation");
System.out.println("PDF   "+reserv);
            String nom=reserv.getNom();
            String prenom=reserv.getPrenom();
            String adresse=reserv.getAdresse();
            String ville=reserv.getVille();
            String tel=reserv.getTel();
            String nomEvent=reserv.getNomEvent();
            String desc=reserv.getDesc();
            String dateDebut=reserv.getDateDebut();
            String dateFin=reserv.getDateFin();
            String nbPart=reserv.getNbPart();
            String prix=reserv.getPrix();
            String nomAssur=reserv.getNomAssur();
            String nbAssur=reserv.getNbAssur();
            String dateSous=reserv.getDateSous();
            
            Paragraph p = new Paragraph("Convention d'utilisation",FontFactory.getFont(FontFactory.HELVETICA, 24, Font.BOLD)); // creation de la 1ere ligne du pdf qui correspond au titre 
            p.setSpacingAfter(8);
            document.add(p);
            Paragraph p2 = new Paragraph("Informations sur le locataire",FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD));
            document.add(p2);
            document.add(new Phrase("Nom: "+nom+"        Prénom: "+prenom+"\n"));
            document.add(new Phrase("Adresse: "+adresse+"        Ville: "+ville+"\n"));
            document.add(new Phrase("Telephone: "+tel+"\n"));
            p.setSpacingAfter(8);
            
            Paragraph p3 = new Paragraph("Informations sur l'événement",FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD));
            document.add(p3);
            document.add(new Phrase("Nom de l'événement: "+nomEvent+"\n"));
            p.setSpacingAfter(1);
            document.add(new Phrase("Description: "+desc+"\n"));
            document.add(new Phrase("Date Debut: "+dateDebut+"       Date Fin: "+dateFin+"\n"));
            document.add(new Phrase("Nombre de participants : "+nbPart+"\n"));
            document.add(new Phrase("Prix : "+prix+"\n"));
            p.setSpacingAfter(8);
            
            Paragraph p4 = new Paragraph("Informations sur l'assurance",FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD));
            document.add(p4);
            document.add(new Phrase("Agence d'assurance: "+nomAssur+"\n"));
            p.setSpacingAfter(1);
            document.add(new Phrase("Numéro de police d'assurance: "+nbAssur+"\n"));
            document.add(new Phrase("Date de souscription: "+dateSous+"\n"));
            


            
      	} catch (DocumentException de) {
    		System.out.println("Erreur Servlet: " + de.getMessage());
    	}

            document.close();
           
    }
    
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
    }

}
