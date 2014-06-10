package modele;

import modele.base.BaseJoueur;

/**
 * This is the object class that relates to the joueur table.
 * Any customizations belong here.
 */
public class Joueur extends BaseJoueur {

/*[CONSTRUCTOR MARKER BEGIN]*/
	public Joueur () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public Joueur (java.lang.Integer _id) {
		super(_id);
	}

/*[CONSTRUCTOR MARKER END]*/
}