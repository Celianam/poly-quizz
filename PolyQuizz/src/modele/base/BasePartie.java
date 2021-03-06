package modele.base;

import java.io.Serializable;


/**
 * This class has been automatically generated by Hibernate Synchronizer.
 * For more information or documentation, visit The Hibernate Synchronizer page
 * at http://www.binamics.com/hibernatesync or contact Joe Hudson at joe@binamics.com.
 *
 * This is an object that contains data related to the PARTIE table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="PARTIE"
 */
public abstract class BasePartie  implements Serializable {

	public static String PROP_NUM_ROUND_JOUEUR1 = "NumRoundJoueur1";
	public static String PROP_SCORE_JOUEUR1 = "ScoreJoueur1";
	public static String PROP_SCORE_JOUEUR2 = "ScoreJoueur2";
	public static String PROP_JOUEUR2 = "Joueur2";
	public static String PROP_JOUEUR1 = "Joueur1";
	public static String PROP_JOUEUR_COURANT = "JoueurCourant";
	public static String PROP_ID = "Id";
	public static String PROP_NUM_ROUND_JOUEUR2 = "NumRoundJoueur2";
	public static String PROP_ROUND_COURANT = "RoundCourant";


	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer _id;

	// fields
	private java.lang.Integer _scoreJoueur2;
	private java.lang.Integer _scoreJoueur1;
	private java.lang.Integer _numRoundJoueur1;
	private java.lang.Integer _numRoundJoueur2;

	// many to one
	private modele.Joueur _joueur1;
	private modele.Round _roundCourant;
	private modele.Joueur _joueurCourant;
	private modele.Joueur _joueur2;

	// collections
	private java.util.Set _rounds;


	// constructors
	public BasePartie () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BasePartie (java.lang.Integer _id) {
		this.setId(_id);
		initialize();
	}

	protected void initialize () {}



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="native"
     *  column="id"
     */
	public java.lang.Integer getId () {
		return _id;
	}

	/**
	 * Set the unique identifier of this class
	 * @param _id the new ID
	 */
	public void setId (java.lang.Integer _id) {
		this._id = _id;
		this.hashCode = Integer.MIN_VALUE;
	}


	/**
	 * Return the value associated with the column: scoreJoueur2
	 */
	public java.lang.Integer getScoreJoueur2 () {
		return _scoreJoueur2;
	}

	/**
	 * Set the value related to the column: scoreJoueur2
	 * @param _scoreJoueur2 the scoreJoueur2 value
	 */
	public void setScoreJoueur2 (java.lang.Integer _scoreJoueur2) {
		this._scoreJoueur2 = _scoreJoueur2;
	}


	/**
	 * Return the value associated with the column: scoreJoueur1
	 */
	public java.lang.Integer getScoreJoueur1 () {
		return _scoreJoueur1;
	}

	/**
	 * Set the value related to the column: scoreJoueur1
	 * @param _scoreJoueur1 the scoreJoueur1 value
	 */
	public void setScoreJoueur1 (java.lang.Integer _scoreJoueur1) {
		this._scoreJoueur1 = _scoreJoueur1;
	}


	/**
	 * Return the value associated with the column: numRoundJoueur1
	 */
	public java.lang.Integer getNumRoundJoueur1 () {
		return _numRoundJoueur1;
	}

	/**
	 * Set the value related to the column: numRoundJoueur1
	 * @param _numRoundJoueur1 the numRoundJoueur1 value
	 */
	public void setNumRoundJoueur1 (java.lang.Integer _numRoundJoueur1) {
		this._numRoundJoueur1 = _numRoundJoueur1;
	}


	/**
	 * Return the value associated with the column: numRoundJoueur2
	 */
	public java.lang.Integer getNumRoundJoueur2 () {
		return _numRoundJoueur2;
	}

	/**
	 * Set the value related to the column: numRoundJoueur2
	 * @param _numRoundJoueur2 the numRoundJoueur2 value
	 */
	public void setNumRoundJoueur2 (java.lang.Integer _numRoundJoueur2) {
		this._numRoundJoueur2 = _numRoundJoueur2;
	}


	/**
     * @hibernate.property
     *  column=joueur1
	 */
	public modele.Joueur getJoueur1 () {
		return this._joueur1;
	}

	/**
	 * Set the value related to the column: joueur1
	 * @param _joueur1 the joueur1 value
	 */
	public void setJoueur1 (modele.Joueur _joueur1) {
		this._joueur1 = _joueur1;
	}


	/**
     * @hibernate.property
     *  column=roundCourant
	 */
	public modele.Round getRoundCourant () {
		return this._roundCourant;
	}

	/**
	 * Set the value related to the column: roundCourant
	 * @param _roundCourant the roundCourant value
	 */
	public void setRoundCourant (modele.Round _roundCourant) {
		this._roundCourant = _roundCourant;
	}


	/**
     * @hibernate.property
     *  column=joueurCourant
	 */
	public modele.Joueur getJoueurCourant () {
		return this._joueurCourant;
	}

	/**
	 * Set the value related to the column: joueurCourant
	 * @param _joueurCourant the joueurCourant value
	 */
	public void setJoueurCourant (modele.Joueur _joueurCourant) {
		this._joueurCourant = _joueurCourant;
	}


	/**
     * @hibernate.property
     *  column=joueur2
	 */
	public modele.Joueur getJoueur2 () {
		return this._joueur2;
	}

	/**
	 * Set the value related to the column: joueur2
	 * @param _joueur2 the joueur2 value
	 */
	public void setJoueur2 (modele.Joueur _joueur2) {
		this._joueur2 = _joueur2;
	}


	/**
	 * Return the value associated with the column: rounds
	 */
	public java.util.Set getRounds () {
		return this._rounds;
	}

	/**
	 * Set the value related to the column: rounds
	 * @param _rounds the rounds value
	 */
	public void setRounds (java.util.Set _rounds) {
		this._rounds = _rounds;
	}
	
	public void addToRounds (Object obj) {
		if (null == this._rounds) this._rounds = new java.util.HashSet();
		this._rounds.add(obj);
	}



	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof modele.base.BasePartie)) return false;
		else {
			modele.base.BasePartie mObj = (modele.base.BasePartie) obj;
			if (null == this.getId() || null == mObj.getId()) return false;
			else return (this.getId().equals(mObj.getId()));
		}
	}


	public int hashCode () {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getId()) return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":" + this.getId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}


	public String toString () {
		return super.toString();
	}

}