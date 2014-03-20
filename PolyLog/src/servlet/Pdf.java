package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.Manager;
import Bean.Boat;

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
@WebServlet("/Pdf")
public class Pdf extends HttpServlet {
	private static final long serialVersionUID = 8461920144699965519L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pdf() {
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
        response.setHeader("Content-Disposition", " inline; filename=ListBoat.pdf"); //ListeBoat.pdf sera le nom si on veut enregistrer le pdf sur son ordinateur
        PdfWriter.getInstance(document,response.getOutputStream());
        
        /****************************************************/
        String search = "";
        String type = "";
        String groupe = "";
        ArrayList<Boat> rs = new ArrayList<Boat>();
        search = request.getParameter("searchBarValue"); // on recupere les elements de la recherche pour pouvoir afficher les bon bateaux dans le pdf
        type = request.getParameter("group");
        groupe = request.getParameter("groupe");
        if (groupe == null) groupe = "1";

        document.open();
          
        if(groupe.equals("1")==false && groupe!=null){
			rs=manager.getIsr().consultBateau(search,type,groupe); // on fait appelle aux fonctionx consultBateau pour venregistrer dans l'arraylist la bonne liste en fonction de la recherche
		}
		else{
			rs=manager.getIsr().consultBateau(search,type);	
		}
        
        /*********************Mise en place de la presentation du document***********************/
        
        document.addTitle("Liste des bateaux");
        
        Paragraph p = new Paragraph("Liste des bateaux",FontFactory.getFont(FontFactory.COURIER, 24, Font.BOLD)); // creation de la 1ere ligne du pdf qui correspond au titre 
        p.setSpacingAfter(8);
        document.add(p);

        PdfPTable   table = new PdfPTable(new float[] { 3f, 4f, 3f,2f }); // creation d'un tableau
        
        table.addCell(new Phrase("Nom",FontFactory.getFont(FontFactory.COURIER, 18, Font.BOLD))); // titre des colonnes
        table.addCell(new Phrase("Notice",FontFactory.getFont(FontFactory.COURIER, 18, Font.BOLD)));
        table.addCell(new Phrase("Image",FontFactory.getFont(FontFactory.COURIER, 18, Font.BOLD)));
        table.addCell(new Phrase("Type",FontFactory.getFont(FontFactory.COURIER, 18, Font.BOLD)));
        
        /********************* Ajout des éléments dans le tableaux *********************************/
        
        for(int i=0;i<rs.size();i++){
        	int ok=0;
        	Image pdfImage=null;
        	if(manager.getIsr().recupBlob(rs.get(i).getId_boat()).length != 0){
        		pdfImage = Image.getInstance(manager.getIsr().recupBlob(rs.get(i).getId_boat()),true); // recuperation de l'image
        		ok=1;
        	}	
      	  table.addCell(rs.get(i).getName_boat());
      	  table.addCell(rs.get(i).getNotice());
      	  if(ok==0){
      		  table.addCell("Pas D'image");
      	  }else{
          	  table.addCell(pdfImage);      		  
      	  }

      	  table.addCell(rs.get(i).getGroupe());
      	
      	 
      	  
            
        }
        document.add(table);

        
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
