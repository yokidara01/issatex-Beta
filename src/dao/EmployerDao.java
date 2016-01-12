package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Client;
import beans.Employer;
import connexion.Singleton;

public class EmployerDao {

	
	public ArrayList<Employer> getEmployes() {
		// TODO Auto-generated method stub
		
		ResultSet res = null ;
		Connection cn = Singleton.getInstance() ; 
		ArrayList<Employer> le =new ArrayList<Employer>() ; 
		try {
			Statement st= cn.createStatement(); 
			String req="select * from employer"  ;
			System.out.println(req) ;
			res =st.executeQuery(req);
			while(res.next())
			{
				Employer e = new Employer(); 
			e.id=res.getInt(1);
			e.nom=res.getString(2);
			e.ilot=res.getInt(3);
			le.add(e) ;
			
			}
		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		}
		
		return le;
	}
	
	
}
