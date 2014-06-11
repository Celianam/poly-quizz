package hibernate;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class gestionInscription extends HttpServlet {
	public static final String VUE          = "/WEB-INF/inscription.jsp";
    public static final String CHAMP_PSEUDO  = "pseudo";
    public static final String CHAMP_PASSWORD   = "password";
    public static final String CHAMP_CONF   = "passwordConf";
    public static final String ATT_ERREURS  = "erreurs";
    public static final String ATT_RESULTAT = "resultat";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }
    
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
    	String resultat;
    	Map<String, String> erreurs = new HashMap<String, String>();
    	/* R�cup�ration des champs du formulaire. */
        String pseudo = request.getParameter( CHAMP_PSEUDO );
        String motDePasse = request.getParameter( CHAMP_PASSWORD );
        String confirmation = request.getParameter( CHAMP_CONF );

        /* Validation du champ pseudo. */
        try {
            validationPseudo( pseudo );
        } catch ( Exception e ) {
        	erreurs.put( CHAMP_PSEUDO, e.getMessage() );
        }

        /* Validation des champs mot de passe et confirmation. */
        try {
            validationPassword( motDePasse, confirmation );
        } catch ( Exception e ) {
        	erreurs.put( CHAMP_PASSWORD, e.getMessage() );
        }
        
        if (nbErreurs == 0)
        {
        	System.out.println("Succ�s de l'inscription");
        	ajoutNouvelUtilisateur(pseudo,motDePasse);
        }
        else 
        {
        	System.out.println("Echec de l'inscription");
        }
        /* Stockage du r�sultat et des messages d'erreur dans l'objet request */
        request.setAttribute( ATT_ERREURS, erreurs );
        request.setAttribute( ATT_RESULTAT, resultat );
        
        /* Transmission de la paire d'objets request/response � notre JSP */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }
    
    /**
     * Valide le nom d'utilisateur saisi.
     */
    private void validationPseudo( String pseudo) throws Exception {
        if ( pseudo != null && pseudo.trim().length() < 3 ) {
            throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caract�res." );
        }
        
        //V�rifier que l'utilisateur n'existe pas dans la BDD, 
        //lancer une exception disant que le nom d'utilisateur existe d�j�
    }
    
    /**
     * Valide les mots de passe saisis.
     */
    private void validationPassword( String motDePasse, String confirmation) throws Exception{
        if (motDePasse != null && motDePasse.trim().length() != 0 && confirmation != null && confirmation.trim().length() != 0) {
            if (!motDePasse.equals(confirmation)) {
                throw new Exception("Les mots de passe entr�s sont diff�rents, merci de les saisir � nouveau.");
            } else if (motDePasse.trim().length() < 3) {
                throw new Exception("Les mots de passe doivent contenir au moins 3 caract�res.");
            }
        } else {
            throw new Exception("Merci de saisir et confirmer votre mot de passe.");
        }
    }
    
    private void ajoutNouvelUtilisateur(String pseudo, String motDePasse)
    {
    	//Ajouter le nouvel utilisateur (pseudo et mdp) dans la base de donn�es
    }

    
}