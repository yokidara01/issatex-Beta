package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.AdminDao;
import dao.ClientDao;
import beans.Admin;
import beans.Client;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		
		
		java.io.PrintWriter out = response.getWriter();
		/*if (c==null){

			Admin admin = new Admin() ; 
			AdminDao adao = new AdminDao() ;
			admin=adao.login(nom,mdp);
			if (admin==null)
			{
				RequestDispatcher d=request.getRequestDispatcher("AdminPanel.jsp");
				d.forward(request, response);
			}
			request.getSession().setAttribute("admin",admin);
			RequestDispatcher d=request.getRequestDispatcher("AdminPanel.jsp");
			d.forward(request, response);
			
		}else
		{
		
		
		 request.getSession().setAttribute("user", c);
		  RequestDispatcher d=request.getRequestDispatcher("Index.jsp");
			d.forward(request, response);
		}*/
		
		Client c = new Client() ; 
		String nom =request.getParameter("nom");
		String mdp = request.getParameter("mdp"); 
		ClientDao cdao = new ClientDao() ; 
		c=cdao.login(nom, mdp); 
		
		
		Admin admin = new Admin() ; 
		AdminDao adao = new AdminDao() ;

		//admin=adao.login(nom,mdp);
		RequestDispatcher da=request.getRequestDispatcher("admin/dashboard.jsp");
		
		/*if (admin!=null)
		{
			request.getSession().setAttribute("Role","Admin");
			request.getSession().setAttribute("Nom",nom);
		
		}*/
		if(c!=null)
		{
			
			if(c.getNom().equals("admin"))
			{  
				request.getSession().setAttribute("Role","Admin");
				request.getSession().setAttribute("Nom",nom);
				 System.out.println("***********************in login id : "+c.getIdClient());
				request.getSession().setAttribute("id", c.getIdClient());
				
				
			}else{
				
			 request.getSession().setAttribute("Role","Utilisateur");
			 request.getSession().setAttribute("Nom",nom);
			 System.out.println("***********************in login id : "+c.getIdClient());
			 request.getSession().setAttribute("id", c.getIdClient());
				
			}
		da.forward(request, response);		
			
		}
		else {
			request.getSession().setAttribute("Role","Null");
			System.out.println("*********************** Role=Nulllll");
			 da=request.getRequestDispatcher("login.jsp");
				da.forward(request, response);		
		
	
		}
		
		
		
	}

}
