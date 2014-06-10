package misc;

public class FormValidation {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	/**
     * Valide le nom d'utilisateur saisi.
     */
    public static void validationPseudo(String pseudo) throws Exception {
    	if (pseudo != null && pseudo.trim().length() != 0) {
        	if (pseudo.trim().length() < 3) {
            throw new Exception( "Le pseudo doit contenir au moins 3 caract�res." );
        	}
	    } else {
	        throw new Exception("Merci de saisir votre pseudo.");
	    }
        
        //V�rifier que l'utilisateur n'existe pas dans la BDD, 
        //lancer une exception disant que le nom d'utilisateur existe d�j�
    }
    
    /**
     * Valide les mots de passe saisis.
     */
    public static void validationPassword(String motDePasse, String confirmation) throws Exception{
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
    
    /**
     * Valide le mot de passe saisi.
     */
    public static void validationPassword(String motDePasse) throws Exception{
        if (motDePasse != null && motDePasse.trim().length() != 0) {
        	if (motDePasse.trim().length() < 3) {
                throw new Exception("Les mots de passe doivent contenir au moins 3 caract�res.");
            }
        } else {
            throw new Exception("Merci de saisir votre mot de passe.");
        }
    }

}
