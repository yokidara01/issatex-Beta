package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insertilot
 */
@WebServlet("/insertilot")
public class insertilot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertilot() {
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
		
		String[] listmachine = request.getParameterValues("machine");
		String[] listemployer = request.getParameterValues("employer");
		int idiot  = 1 + (int)(Math.random()*1000); 
		
		int i =Integer.parseInt(listmachine[0]);
		
		
		
		int j =Integer.parseInt(listemployer[0]);
		
		
		Connection cn = connexion.Singleton.getInstance(); 
		
		
		for(int k = 1; k <= listemployer.length; k++)
		{
		  try {
			  cn.createStatement();
				Statement st = cn.createStatement() ;
				String updateemployer = "UPDATE employer SET  ilot="+idiot+" WHERE id="+listemployer[k-1];
				st.executeUpdate(updateemployer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		
		
		

		for(int k = 1; k <= listmachine.length; k++)
		{
		  try {
			  cn.createStatement();
				Statement st = cn.createStatement() ;
				String updateMachine = "UPDATE machine SET  ilot="+idiot+" WHERE id="+listmachine[k-1];
				st.executeUpdate(updateMachine);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		
		
		
		try {
			cn.createStatement();
			Statement st = cn.createStatement() ;
			String req = "INSERT INTO `ilot`( `codeilot`, `nbreEmployes`, `nbreMachines`)"
					+ " VALUES ("+idiot+","+listemployer.length+","+listmachine.length+")"; 
			System.out.println(req);
		 st.executeUpdate(req);
			RequestDispatcher d=request.getRequestDispatcher("admin/ilot/Ajouterilot.jsp");
			d.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
	}

}
