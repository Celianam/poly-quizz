package modele;

import modele.base.BaseInvitation;

/**
 * This is the object class that relates to the invitation table.
 * Any customizations belong here.
 */
public class Invitation extends BaseInvitation {

/*[CONSTRUCTOR MARKER BEGIN]*/
	public Invitation () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public Invitation (
		java.lang.Integer _joueurEnAttente,
		java.lang.Integer _joueurCreateur) {

		super (
			_joueurEnAttente,
			_joueurCreateur);
	}

/*[CONSTRUCTOR MARKER END]*/
}