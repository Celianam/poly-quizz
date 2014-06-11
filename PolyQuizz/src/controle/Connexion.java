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

public class Connexion extends HttpServlet {
	public static final String VUE          = "/connexion.jsp";
    public static final String CHAMP_PSEUDO  = "InputPseudo";
    public static final String CHAMP_PASSWORD   = "InputPassword";
    public static final String ATT_ERREURS  = "erreurs";
    public static final String ATT_RESULTAT = "resultat";
    
    private boolean pseudoOK = false;
    private boolean passwordOK = false;
    private boolean login = false;

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }
    
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
    	String resultat = null;
    	String pseudoLogin = null;
    	Map<String, String> erreurs = new HashMap<String, String>();
    	/* Récupération des champs du formulaire. */
        String pseudo = request.getParameter( CHAMP_PSEUDO );
        String motDePasse = request.getParameter( CHAMP_PASSWORD);
        
        /* Validation du champ pseudo. */
        try {
            FormValidation.validationPseudo( pseudo );
            pseudoOK = true;
        } catch ( Exception e ) {
        	erreurs.put( CHAMP_PSEUDO, e.getMessage() );
        }

        /* Validation des champs mot de passe*/
        try {
            FormValidation.validationPassword(motDePasse);
            passwordOK = true;
        } catch ( Exception e ) {
        	erreurs.put( CHAMP_PASSWORD, e.getMessage());
        }
        
        if (pseudo != null && motDePasse != null && pseudo != "" && motDePasse != "")
    	{
//    		try
//    		{
//    			JoueurRepository.exist(pseudo, motDePasse.getBytes());
//    			login = true;
//    		}
//    		catch(Exception e)
//    		{
//    			erreurs.put( "login", e.getMessage() );
//    		}
    		
    	}
        
        /* Stockage du résultat et des messages d'erreur dans l'objet request */
        request.setAttribute( ATT_ERREURS, erreurs );
        request.setAttribute( ATT_RESULTAT, resultat);
        
        if(erreurs.isEmpty())
        {
        	System.out.println("ok");
        	request.setAttribute(CHAMP_PSEUDO,pseudoLogin);
        }
  
        /* Transmission de la paire d'objets request/response à notre JSP */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }

    
}