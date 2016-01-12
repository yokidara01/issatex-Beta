package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Article;

/**
 * Servlet implementation class preparerOF
 */
public class preparerOF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public preparerOF() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			Article a = new Article();ArrayList<Article> la = new ArrayList<>() ;
		Connection cn = connexion.Singleton.getInstance(); 
		try {
			cn.createStatement();
			Statement st = cn.createStatement() ;
			String req = "select * from article"; 
		ResultSet rs = st.executeQuery(req);
		System.out.println("Query of select all article : "+req);
		
	
		while (rs.next())
		{
			a.setLibArt(rs.getString("libArt"));
			a.setPUMoy(rs.getString("PUMoy"));
			a.setRefArt(rs.getString("refArt"));
			a.setTempsUnitaire(rs.getString("tempsUnitaire"));
			la.add(a) ;
			a = new Article();
			
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("la", la);
		 RequestDispatcher d=request.getRequestDispatcher("AddOF.jsp");
			d.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
