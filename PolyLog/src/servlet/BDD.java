package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import manager.Manager;
import beans.Reservation;


/**
 * Servlet implementation class BDD
 */
@WebServlet("/BDD")
public class BDD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Manager manager;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BDD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		manager = (Manager) request.getSession().getAttribute("manager");
		if(manager==null) manager = new Manager();
		request.getSession().setAttribute("manager", manager);
		String nom=request.getParameter("nom");
		String prenom=request.getParameter("prenom");
		String adresse=request.getParameter("adresse");
		String ville=request.getParameter("ville");
		String tel=request.getParameter("tel");
		String nomEvent=request.getParameter("nomEvent");
		String desc=request.getParameter("desc");
		String dateDebut=request.getParameter("dateDebut");
		String dateFin=request.getParameter("dateFin");
		String nbPart=request.getParameter("nbPart");
		String prix=request.getParameter("prix");
		String nomAssur=request.getParameter("nomAssur");
		String nbAssur=request.getParameter("nbAssur");
		String dateSous=request.getParameter("dateSous");

		manager.setReserv(new Reservation(nom,prenom,adresse,ville,tel,nomEvent,desc,dateDebut,dateFin,nbPart,prix,nomAssur,nbAssur,dateSous));
		System.out.println("BDD   "+manager.getReserv());
		response.sendRedirect("http://localhost:8080/Nauticaly/accueil/create.jsp");
	}
	

}
