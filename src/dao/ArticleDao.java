package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Article;
import beans.OF;
import connexion.Singleton;

public class ArticleDao {
	Connection cn = connexion.Singleton.getInstance();

	public Float getPUMoyByRefArt(int refart) {

		Article art = new Article();
		Float PUMoy = 0.0f;

		try {

			Statement st = cn.createStatement();
			String req = "SELECT `PUMoy` FROM `article` WHERE `refArt`=" + refart;
			ResultSet res = st.executeQuery(req);
			System.out.println("Requette de récupération de PUMoy : " + req);

			while (res.next()) {

				// art.setPUMoy(res.getString("PUMoy"));
				PUMoy = res.getFloat("PUMoy");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("kkkk: " + PUMoy);
		return PUMoy;

	}
	
	public String getLibArtByRefArt(int refart){
		String LibArticle = null;
		
		try {
			
			
			Statement st = cn.createStatement();
			String req = "SELECT `libArt` FROM `article` WHERE `refArt`=" + refart;
			ResultSet res = st.executeQuery(req);
			System.out.println("Requette de récupération de libArt : " + req);
			
			while(res.next()) {
				
				LibArticle = res.getString("libArt");
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		System.out.println("libellé article : " + LibArticle);
		return LibArticle;
		
		
	}
	
	public int AddArticle(Article art){
		
		int res=0;
		try {
			Statement st = cn.createStatement();
			String req = "INSERT INTO `article`(`libArt`, `tempsUnitaire`, `PUMoy`, `Temp`) VALUES ("
					+"'"+art.getLibArt()+"',"
					+"'"+art.getTempsUnitaire()+"',"
					+"'"+art.getPUMoy()+"',"
					+"'"+art.getTemp()+"'"
					+")";
					System.out.println("requete d'ajout d'un article : "+req);
					res=st.executeUpdate(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return res;
		
	}
	
	public ArrayList<Article> GetAllArticle(){
		
		ResultSet res = null ;
		Connection cn = Singleton.getInstance() ; 
		ArrayList<Article> ListArticle = new ArrayList<Article>();
		
		try {
			
			
			Statement st = cn.createStatement();
			String req = "select * from article";
			System.out.println("requete de selection des articles :"+req);
			res= st.executeQuery(req);
			
			while(res.next()){
				
				Article article = new Article();
				
				article.setRefArt(res.getString("refArt"));
				article.setLibArt(res.getString("libArt"));
				article.setTempsUnitaire(res.getString("tempsUnitaire"));
				article.setPUMoy(res.getString("PUMoy"));
				article.setTemp(res.getInt("Temp"));
				
				ListArticle.add(article);
				
				
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("Exception :  erreur selection d'article");
			// TODO: handle exception
		}
		
		
		return ListArticle;
		
		
		
		
	}
	
	public Article GetArtByRefArt(int refart){
		
		Article art = new Article();
		ResultSet res= null;
		Connection cn = Singleton.getInstance() ;
		try {
			
			
			Statement st = cn.createStatement();
			String req= "select * from article where refArt = "+refart;
			System.out.println("requete de selection d'article selon refArt : "+req);
			res= st.executeQuery(req);
			
			while(res.next()){
				
				
				art.setRefArt(res.getString("refArt"));
				art.setLibArt(res.getString("libArt"));
				art.setTempsUnitaire(res.getString("tempsUnitaire"));
				art.setPUMoy(res.getString("PUMoy"));
				art.setTemp(res.getInt("Temp"));
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("erreur recuperation article avec refart");
			// TODO: handle exception
		}
	
		
		return art;
		
	
	}
	
	public Article SetModifieArticle(Article art){
		
		int res=0;
		try {
			
			
			Statement st = cn.createStatement();
			String req = "UPDATE `article` SET `refArt`='"+art.getRefArt()+"'"
					+ ",`libArt`='"+art.getLibArt()+"'"
					+ ",`tempsUnitaire`='"+art.getTempsUnitaire()+"',"
					+ "`PUMoy`='"+art.getPUMoy()+"'"
					+ ",`Temp`='"+art.getTemp()+"' WHERE `refArt` = '"+art.getRefArt()+"'";
			
			System.out.println("requete de modification d'article : "+req);
			res= st.executeUpdate(req);
			if(res == 1){
				
				System.out.println("modifier avec succés");
				
			}
			else System.out.println("erroooooooooooooooooooooooor upadate aricle");
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return art;
		
	}
	
	public int deleteArt(int refart){
		
		int res=0;
		try {
			
			
			Statement st = cn.createStatement();
			String req = "DELETE FROM `article` WHERE `refArt`="+refart;
			System.out.println("requete de supression d'article : "+req);
			res = st.executeUpdate(req);
			
			if(res == 1) System.out.println("Votre article est supprimé");
			else System.out.println("ma tfasa5ch l'article");
		
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
		return res;
		
		
		
	}
	
	public int ValiderArt(int refart){
		
		int res= 0;
		try {
			
			
			Statement st =cn.createStatement();
			String req = "UPDATE `article` SET `Temp`="+1+" WHERE `refArt`="+refart;
			System.out.println("requete de validation d'article : "+req);
			res=st.executeUpdate(req);
			if(res == 1) System.out.println("Votre article est valider");
			else System.out.println("article non validé");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return res;
		
	}
public int DevaliderArt(int refart){
		
		int res= 0;
		try {
			
			
			Statement st =cn.createStatement();
			String req = "UPDATE `article` SET `Temp`="+0+" WHERE `refArt`="+refart;
			System.out.println("requete de dévalidation d'article : "+req);
			res=st.executeUpdate(req);
			if(res == 1) System.out.println("Votre article n'est pas valider");
			else System.out.println("article validé");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return res;
		
	

}
}
