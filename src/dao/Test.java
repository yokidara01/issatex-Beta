package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int refof=4;
		
		ResultSet resultart =null ; 
		int tempArticle =0 ;
		Connection cn = connexion.Singleton.getInstance(); 
		ResultSet resultof =null ; 
		try {
			cn.createStatement();
			Statement st = cn.createStatement() ;
			String req = "select * from of where refof="+refof;
			
			System.out.println(req);
		resultof = st.executeQuery(req);
		resultof.next();
		System.out.println("reference article of that of is  = "+resultof.getInt("refart"));

		String req2="" ;
		try {
		 req2= "select * from article where refart="+resultof.getInt("refart") ;
		 System.out.println(req2) ; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		 resultart  = st.executeQuery(req2);
		 
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			resultart.next(); 
			 System.out.println("temp unitaire " +resultart.getInt("tempsunitaire")+"") ;
			 
			 System.out.println("qté M"+resultof.getString(6)) ;
			//tempArticle=resultart.getInt("tempsunitaire")*resultof.getInt(7)+resultart.getInt("tempsunitaire")*resultof.getInt(8)+resultart.getInt("tempsunitaire")*resultof.getInt(6) ;
		
			 tempArticle=25;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
