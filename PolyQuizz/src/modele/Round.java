package modele;

import modele.base.BaseRound;

/**
 * This is the object class that relates to the round table.
 * Any customizations belong here.
 */
public class Round extends BaseRound {

/*[CONSTRUCTOR MARKER BEGIN]*/
	public Round () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public Round (java.lang.Integer _id) {
		super(_id);
	}

	/**
	 * Constructor for required fields
	 */
	public Round (
		java.lang.Integer _id,
		modele.Partie _partie) {

		super (
			_id,
			_partie);
	}
/*[CONSTRUCTOR MARKER END]*/
}