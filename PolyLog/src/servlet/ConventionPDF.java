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
        
        String nom="Le Plénier";
        String prenom="Cyril";
        
        Paragraph p = new Paragraph("Convention d'utilisation",FontFactory.getFont(FontFactory.COURIER, 24, Font.BOLD)); // creation de la 1ere ligne du pdf qui correspond au titre 
        p.setSpacingAfter(8);
        document.add(p);
        Paragraph p2 = new Paragraph("Informations sur le locataire",FontFactory.getFont(FontFactory.COURIER, 24, Font.BOLD));
        document.add(p2);
        document.add(new Phrase("Nom : "+nom+"        Prénom : "+prenom));
        


        
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
