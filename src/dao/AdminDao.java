package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import connexion.Singleton;
import beans.Admin;

public class AdminDao {

	public Admin login(String nom, String mdp) {
		Admin admin = new Admin() ; 
ResultSet res =null ; 
		
		try {
			Connection cn = Singleton.getInstance() ;
			Statement st  =cn.createStatement() ;
			String req="select * from admin where nom='"+nom+ "' and mdp='"+mdp+"'"  ;
			System.out.println(req) ;
			res =st.executeQuery(req);
				
if(res.next())
			{
			{
				while(res.next())
				{
				
				admin.setId(res.getString("id"));
				admin.setMdp(res.getString("mdp"));
				admin.setNom(res.getString("nom"));
				
				}
				
			}
			}

else
{
	System.out.print("ADMIN NOT FOUND");
	admin=null ;
}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return admin ;
		
	}

}
