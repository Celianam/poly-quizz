package modele;

import modele.base.BaseQuestion;

/**
 * This is the object class that relates to the question table.
 * Any customizations belong here.
 */
public class Question extends BaseQuestion {

/*[CONSTRUCTOR MARKER BEGIN]*/
	public Question () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public Question (java.lang.Integer _id) {
		super(_id);
	}

	/**
	 * Constructor for required fields
	 */
	public Question (
		java.lang.Integer _id,
		java.lang.Integer _theme) {

		super (
			_id,
			_theme);
	}

/*[CONSTRUCTOR MARKER END]*/
}