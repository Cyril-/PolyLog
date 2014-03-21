package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.Manager;

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
		
  	  Document document = new Document();
  	try {
        
  		/********Permet d'afficher le pdf en ligne***********/
  	
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", " inline; filename=ConventionUtilisation.pdf");
        PdfWriter.getInstance(document,response.getOutputStream());
        
        /****************************************************/

        document.open();
          
        
        /*********************Mise en place de la presentation du document***********************/
        
        document.addTitle("Convention d'utilisation");
        
        String nom=request.getParameter("nom");
        String prenom=request.getParameter("prenom");
        String adresse=request.getParameter("adresse");
        String ville=request.getParameter("ville");
        String tel=request.getParameter("tel");
        String nomEvent=request.getParameter("nomEvent");
        String desc=request.getParameter("desc");
        String date=request.getParameter("date");
        String nbPart=request.getParameter("nbPart");
        String prix=request.getParameter("prix");
        String nomAssur=request.getParameter("nomAssur");
        String nbAssur=request.getParameter("nbAssur");
        String dateSous=request.getParameter("dateSous");
        
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
        document.add(new Phrase("Date: "+date+"\n"));
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

        System.out.println("pdf creeer");
        document.close();
       
  }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
