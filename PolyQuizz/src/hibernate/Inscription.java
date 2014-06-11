package hibernate;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.Joueur;
import modele.JoueurRepository;

public class Inscription extends HttpServlet {
	public static final String VUE          = "/WebContent/inscription.jsp";
    public static final String CHAMP_PSEUDO  = "pseudo";
    public static final String CHAMP_PASSWORD   = "password";
    public static final String CHAMP_CONF   = "passwordConf";
    public static final String ATT_ERREURS  = "erreurs";
    public static final String ATT_RESULTAT = "resultat";

//    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
//        /* Affichage de la page d'inscription */
//        //this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
//    	request.getSession().invalidate();
//    	response.sendRedirect(VUE);
//    }
//    
//    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
//    	String resultat = null;
//    	Map<String, String> erreurs = new HashMap<String, String>();
//    	/* Récupération des champs du formulaire. */
//        String pseudo = request.getParameter( CHAMP_PSEUDO );
//        String motDePasse = request.getParameter( CHAMP_PASSWORD );
//        String confirmation = request.getParameter( CHAMP_CONF );
//
//        System.out.println("ok");
//        
//        /* Validation du champ pseudo. */
//        try {
//            validationPseudo( pseudo );
//        } catch ( Exception e ) {
//        	erreurs.put( CHAMP_PSEUDO, e.getMessage() );
//        }
//
//        /* Validation des champs mot de passe et confirmation. */
//        try {
//            validationPassword( motDePasse, confirmation );
//        } catch ( Exception e ) {
//        	erreurs.put( CHAMP_PASSWORD, e.getMessage() );
//        }
//        
//        if (erreurs.isEmpty())
//        {
//        	resultat = "Succès de l'inscription";
//        	ajoutNouvelUtilisateur(pseudo,motDePasse);
//        }
//        else 
//        {
//        	resultat = "Echec de l'inscription";
//        	System.out.println("Echec de l'inscription");
//        }
//        /* Stockage du résultat et des messages d'erreur dans l'objet request */
//        request.setAttribute( ATT_ERREURS, erreurs );
//        request.setAttribute( ATT_RESULTAT, resultat);
//        
//        /* Transmission de la paire d'objets request/response à notre JSP */
//        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
//
//    }
    
    /**
     * Valide le nom d'utilisateur saisi.
     */
    public static void validationPseudo( String pseudo) throws Exception {
        if ( pseudo != null && pseudo.trim().length() < 3 ) {
        	System.out.println("Le nom d'utilisateur doit contenir au moins 3 caractères.");
            throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
        System.out.println("val pseudo");
        //Vérifier que l'utilisateur n'existe pas dans la BDD, 
        //lancer une exception disant que le nom d'utilisateur existe déjà
    }
    
    /**
     * Valide les mots de passe saisis.
     */
    public static void validationPassword( String motDePasse, String confirmation) throws Exception{
        if (motDePasse != null && motDePasse.trim().length() != 0 && confirmation != null && confirmation.trim().length() != 0) {
            if (!motDePasse.equals(confirmation)) {
            	System.out.println("Les mots de passe entrés sont différents, merci de les saisir à nouveau.");
                throw new Exception("Les mots de passe entrés sont différents, merci de les saisir à nouveau.");
                
            } else if (motDePasse.trim().length() < 3) {
            	System.out.println("Les mots de passe doivent contenir au moins 3 caractères.");
                throw new Exception("Les mots de passe doivent contenir au moins 3 caractères.");
                
            }
        } else {
            throw new Exception("Merci de saisir et confirmer votre mot de passe.");
        }
    }
    
    public static void ajoutNouvelUtilisateur(String pseudo, String motDePasse)
    {
    	Joueur j = new Joueur();
    	j.setPseudo(pseudo);
    	j.setMdp(motDePasse.getBytes());
    	
    }

    
}