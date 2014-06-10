package modele;

import modele.base.BaseReponse;

/**
 * This is the object class that relates to the reponse table.
 * Any customizations belong here.
 */
public class Reponse extends BaseReponse {

/*[CONSTRUCTOR MARKER BEGIN]*/
	public Reponse () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public Reponse (modele.ReponsePK _id) {
		super(_id);
	}

/*[CONSTRUCTOR MARKER END]*/
}