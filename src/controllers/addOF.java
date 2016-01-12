package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OFDao;
import beans.OF;

/**
 * Servlet implementation class addOF
 */
public class addOF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOF() {
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
		
		OF of = new OF(); 
		of.setDateOF(request.getParameter("dateOF")) ;
		of.setIdClient(request.getParameter("IdClient"));
		of.setPUProp(request.getParameter("prixP"));
		of.setQteM(request.getParameter("tailleM"));
		of.setQteL(request.getParameter("tailleL"));
		of.setQteXL(request.getParameter("tailleXL"));
		of.setRefArt(request.getParameter("refArticle"));
		of.setCodeIlot("1");
		of.setPURéel("0");
		OFDao ofdao = new OFDao() ; 
		ofdao.addOF(of) ;
		request.setAttribute("of", of);
		RequestDispatcher d=request.getRequestDispatcher("recu.jsp");
		d.forward(request, response);
		
		
	}

}
