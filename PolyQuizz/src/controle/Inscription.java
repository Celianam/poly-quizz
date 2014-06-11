package controle;

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
	public static final String VUE          = "/inscription.jsp";
    public static final String CHAMP_PSEUDO  = "InputPseudo";
    public static final String CHAMP_PASSWORD   = "InputPassword";
    public static final String CHAMP_CONF   = "InputPasswordConf";
    public static final String ATT_ERREURS  = "erreurs";
    public static final String ATT_RESULTAT = "resultat";
    
    private boolean pseudoOK = false;
    private boolean passwordOK = false;

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }
    
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
    	String resultat = null;
    	Map<String, String> erreurs = new HashMap<String, String>();
    	/* Récupération des champs du formulaire. */
        String pseudo = request.getParameter( CHAMP_PSEUDO );
        String motDePasse = request.getParameter( CHAMP_PASSWORD);
        String confirmation = request.getParameter( CHAMP_CONF);
        
        /* Validation du champ pseudo. */
        try {
            FormValidation.validationPseudo( pseudo );
            pseudoOK = true;
        } catch ( Exception e ) {
        	erreurs.put( CHAMP_PSEUDO, e.getMessage() );
        }

        /* Validation des champs mot de passe et confirmation. */
        try {
            FormValidation.validationPassword( motDePasse, confirmation );
            passwordOK = true;
        } catch ( Exception e ) {
        	erreurs.put( CHAMP_PASSWORD, e.getMessage());
        }
        
        if (pseudoOK == true && passwordOK==true)
        {
        	resultat = "Succès de l'inscription";
        	try{
        		FormValidation.ajoutNouvelUtilisateur(pseudo,motDePasse);
        	} catch (Exception e) {
        		erreurs.put( CHAMP_PSEUDO, e.getMessage());
        	}
        }
        else 
        {
        	resultat = "Echec de l'inscription";
        	System.out.println("Echec de l'inscription");
        }
        /* Stockage du résultat et des messages d'erreur dans l'objet request */
        request.setAttribute( ATT_ERREURS, erreurs );
        request.setAttribute( ATT_RESULTAT, resultat);
        
        /* Transmission de la paire d'objets request/response à notre JSP */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }

    
}