package modele.base;

import java.io.Serializable;


/**
 * This class has been automatically generated by Hibernate Synchronizer.
 * For more information or documentation, visit The Hibernate Synchronizer page
 * at http://www.binamics.com/hibernatesync or contact Joe Hudson at joe@binamics.com.
 *
 * This is an object that contains data related to the JOUEUR table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="JOUEUR"
 */
public abstract class BaseJoueur  implements Serializable {

	public static String PROP_MDP = "Mdp";
	public static String PROP_PSEUDO = "Pseudo";
	public static String PROP_ID = "Id";


	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer _id;

	// fields
	private byte[] _mdp;
	private java.lang.String _pseudo;

	// collections
	private java.util.Set _invitations;


	// constructors
	public BaseJoueur () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseJoueur (java.lang.Integer _id) {
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
	 * Return the value associated with the column: mdp
	 */
	public byte[] getMdp () {
		return _mdp;
	}

	/**
	 * Set the value related to the column: mdp
	 * @param _mdp the mdp value
	 */
	public void setMdp (byte[] _mdp) {
		this._mdp = _mdp;
	}


	/**
	 * Return the value associated with the column: pseudo
	 */
	public java.lang.String getPseudo () {
		return _pseudo;
	}

	/**
	 * Set the value related to the column: pseudo
	 * @param _pseudo the pseudo value
	 */
	public void setPseudo (java.lang.String _pseudo) {
		this._pseudo = _pseudo;
	}


	/**
	 * Return the value associated with the column: invitations
	 */
	public java.util.Set getInvitations () {
		return this._invitations;
	}

	/**
	 * Set the value related to the column: invitations
	 * @param _invitations the invitations value
	 */
	public void setInvitations (java.util.Set _invitations) {
		this._invitations = _invitations;
	}
	
	public void addToInvitations (Object obj) {
		if (null == this._invitations) this._invitations = new java.util.HashSet();
		this._invitations.add(obj);
	}



	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof modele.base.BaseJoueur)) return false;
		else {
			modele.base.BaseJoueur mObj = (modele.base.BaseJoueur) obj;
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