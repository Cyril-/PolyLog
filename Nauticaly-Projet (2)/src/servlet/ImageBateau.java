package servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.Manager;

/**
 * Servlet implementation class ImageBateau
 */
@WebServlet("/ImageBateau")
public class ImageBateau extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageBateau() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Manager manager = (Manager) request.getSession().getAttribute("manager");
		if(manager==null) manager = new Manager();
		request.getSession().setAttribute("manager", manager);
		String id=request.getParameter("idBateau");
		byte[] buffer  = null;
		buffer = manager.getIsr().recupBlob(Integer.parseInt(id)); // recupere le byte[] de la photo
		ServletOutputStream ot = response.getOutputStream();
		response.setContentType("image/jpg");
		ot.write(buffer);  //Žcrit le byte
		ot.flush();
		ot.close();
		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
