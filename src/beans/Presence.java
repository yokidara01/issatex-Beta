package beans;

public class Presence {
	private int idPresence ;
	String idEmp;
	String NbHeures; 
	private String Date; 
	
	public int getidPresence() {
		return idPresence;
	}

	public void setidPresence(int idPresence) {
		this.idPresence = idPresence;
	}
	
	public String getNbHeures() {
		return NbHeures;
	}

	public void setNbHeures(String NbHeures) {
		this.NbHeures = NbHeures;
	}
	
	public String getidEmp() {
		return idEmp;
	}

	public void setidEmp(String idEmp) {
		this.idEmp = idEmp;
	}
	
	public String getDate() {
		return Date;
	}

	public void setDate(String Date) {
		this.Date = Date;
	}
	
	

}
