package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import beans.Presence;

public class PresenceDao {
public int addPresence(Presence pr)
{
	
	Connection cn = connexion.Singleton.getInstance(); 
	int result = 0 ; 
	try {
		cn.createStatement();
		Statement st = cn.createStatement() ;
		String req = "INSERT INTO `presence`(`idEmp`,`Date`,`NbHeures`)"
				+ " VALUES ("
						+ "'"+pr.getidEmp()+"',"
						+"'"+pr.getDate()+"',"
						+"'"+pr.getNbHeures()+"'"+
					
						
						
						")"; 
		System.out.println(req);
	result = st.executeUpdate(req);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return result ;
}

public int getEstimatedTime(int refof)
{ResultSet resultart =null ; 
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
	
	
	Statement st2 = cn.createStatement() ;
	 resultart  = st2.executeQuery(req2);
	 
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		resultart.next(); 
		 System.out.println("temp unitaire " +resultart.getInt("tempsunitaire")+"") ;
		 
		// System.out.println("qté M"+resultof.getString("QteM")) ;
		tempArticle=resultart.getInt("tempsunitaire")*resultof.getInt(7)+resultart.getInt("tempsunitaire")*resultof.getInt(8)+resultart.getInt("tempsunitaire")*resultof.getInt(6) ;
	
		// tempArticle=25;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	return tempArticle;
	
}


public int getMinTeamRequired(int refof)
{
	int x = getEstimatedTime(refof);
	
	if(x/8!=0)
	{
		x+=8;
	}
	
	
	
	
	return Integer.valueOf((int) Math.round(x));
	
}

}
