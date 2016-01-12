package beans;

public class Article  {
	private String refArt, libArt, tempsUnitaire, PUMoy;
	private int temp;
	

	public Article(String libArt, String tempsUnitaire, String pUMoy, int temp) {
		super();
		this.libArt = libArt;
		this.tempsUnitaire = tempsUnitaire;
		PUMoy = pUMoy;
		this.temp = temp;
	}
	

	public Article() {
		super();
	}


	public int getTemp() {
		return temp;
	}

	public void setTemp(int temp) {
		this.temp = temp;
	}

	public String getRefArt() {
		return refArt;
	}

	public void setRefArt(String refArt) {
		this.refArt = refArt;
	}

	public String getLibArt() {
		return libArt;
	}

	public void setLibArt(String libArt) {
		this.libArt = libArt;
	}

	public String getTempsUnitaire() {
		return tempsUnitaire;
	}

	public void setTempsUnitaire(String tempsUnitaire) {
		this.tempsUnitaire = tempsUnitaire;
	}

	public String getPUMoy() {
		return PUMoy;
	}

	public void setPUMoy(String pUMoy) {
		PUMoy = pUMoy;
	} 
	
	
}
