package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClientDao;
import beans.Client;

/**
 * Servlet implementation class Inscription
 */
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inscription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Client c= new Client() ; 
		c.setNom(request.getParameter("nom"));
		c.setPrénom(request.getParameter("prenom")); 
		c.setAdresse(request.getParameter("adresse"));
		c.setPays(request.getParameter("pays"));
		c.setRefDouane(request.getParameter("refDouane"));
		c.setTel(request.getParameter("tel"));
		c.setMdp(request.getParameter("mdp"));

		dao.ClientDao daoc = new ClientDao() ;
		
		daoc.inscription(c) ; 
		
		RequestDispatcher d=request.getRequestDispatcher("login.jsp");
		d.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
