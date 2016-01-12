package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Article;
import dao.ArticleDao;

/**
 * Servlet implementation class AddArticle
 */
public class AddArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Article art = new Article();
		art.setLibArt(request.getParameter("desArticle"));
		art.setTempsUnitaire(request.getParameter("tempsUni"));
		art.setPUMoy(request.getParameter("PUmoy"));
		art.setTemp(0);
		ArticleDao artdao = new ArticleDao();
		artdao.AddArticle(art);
		
		if(request.getSession().getAttribute("Role") == "Utilisateur"){
		
		request.setAttribute("art", art);
		System.out.println("USER");
		RequestDispatcher rd = request.getRequestDispatcher("Profil.jsp");
		rd.forward(request, response);
		
		}
		else if (request.getSession().getAttribute("Role") == "Admin"){
			
			System.out.println("ADMIN");
			RequestDispatcher rda = request.getRequestDispatcher("admin/dashboard.jsp");
			rda.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
