package modele;

import modele.base.BasePartie;

/**
 * This is the object class that relates to the partie table.
 * Any customizations belong here.
 */
public class Partie extends BasePartie {

/*[CONSTRUCTOR MARKER BEGIN]*/
	public Partie () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public Partie (java.lang.Integer _id) {
		super(_id);
	}

/*[CONSTRUCTOR MARKER END]*/
}