package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Employer;
import beans.Machine;
import connexion.Singleton;

public class MachineDao {

	public ArrayList<Machine> getMachines() {
		// TODO Auto-generated method stub
		
		ResultSet res = null ;
		Connection cn = Singleton.getInstance() ; 
		ArrayList<Machine> le =new ArrayList<Machine>() ; 
		try {
			Statement st= cn.createStatement(); 
			String req="select * from machine"  ;
			System.out.println(req) ;
			res =st.executeQuery(req);
			while(res.next())
			{
				Machine e = new Machine(); 
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
