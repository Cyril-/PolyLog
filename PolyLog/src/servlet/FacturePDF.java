package servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;

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
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class FacturePDF
 */
@WebServlet("/FacturePDF")
public class FacturePDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacturePDF() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void creerFacture(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Document document = new Document();
      	try {
      		/********Permet d'afficher le pdf en ligne************/
          	
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", " inline; filename=ConventionUtilisation.pdf");
            PdfWriter.getInstance(document,response.getOutputStream());
            
      		/********Permet d'ouvrir le pdf***********
      	
      		response.setContentType("application/pdf");
    		response.setHeader("Content-Disposition",
    				"attachment; filename=Facture");
    		OutputStream os = response.getOutputStream();
    		try {
    			FileInputStream ips = new FileInputStream(System.getProperty("user.dir")
    					+ ("\\Facture.pdf"));
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
            
            document.addTitle("Facture");
            
            String prix=request.getParameter("prix");
           
            
            Paragraph p = new Paragraph("Facture",FontFactory.getFont(FontFactory.HELVETICA, 24, Font.BOLD)); // creation de la 1ere ligne du pdf qui correspond au titre 
            p.setSpacingAfter(8);
            document.add(p);
            document.add(new Phrase("Prix : "+prix+"\n"));
            p.setSpacingAfter(8);
            System.out.println("Facture");
            
      	} catch (DocumentException de) {
    		System.out.println("Erreur Servlet: " + de.getMessage());
    	}

            System.out.println("pdf creeer");
            document.close();
           
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Manager manager = (Manager) request.getSession().getAttribute("manager");
		if(manager==null) manager = new Manager();
		request.getSession().setAttribute("manager", manager);
			
			creerFacture(request,response);
	}

}
