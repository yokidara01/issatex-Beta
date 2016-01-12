package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RendAnne
 */
public class RendAnne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RendAnne() {
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
		String date = request.getParameter("date") ; 
		date=date.substring(0, 4);
		System.out.println(date);
		
		String req= "select * from presence where date like '"+date+"%'" ;
		System.out.println((req));
		int total =0 ; 
		int i=0;
		try {
			Connection cn = connexion.Singleton.getInstance();
			
			Statement st = cn.createStatement() ;
			
			ResultSet rs= st.executeQuery(req); 
			
			while(rs.next())
			{i++ ; 
				total+=rs.getInt(4) ;
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		RequestDispatcher da = request.getRequestDispatcher("admin/Rendement/ResultRendement.jsp");

		if ((total==0) || (i==0))
		{
			request.setAttribute("rendement", 0);
			da.forward(request, response);
		}
		
		int s=0;
		try {
			s= (total*100)/(8*i) ; 
			request.setAttribute("rendement", s);
			
			da.forward(request, response);
		} catch (ArithmeticException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
