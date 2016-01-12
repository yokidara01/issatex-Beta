

package controllers;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PresenceDao;

import beans.Presence;

/**
 * Servlet implementation class addOF
 */
@WebServlet("/AddPresence")
public class AddPresence extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPresence() {
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
		// TODO Auto-generated method stub
		
		Presence pr = new Presence(); 
		
		pr.setNbHeures(request.getParameter("NbHeures"));
	
		pr.setDate(request.getParameter("Date"));
		pr.setidEmp(request.getParameter("emp"));
	
		PresenceDao prdao = new PresenceDao() ; 
		prdao.addPresence(pr) ;
		request.setAttribute("pr", pr);
		RequestDispatcher d=request.getRequestDispatcher("Index.jsp");
		d.forward(request, response);
		
		
	}

}
