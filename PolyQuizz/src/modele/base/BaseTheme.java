package modele.base;

import java.io.Serializable;


/**
 * This class has been automatically generated by Hibernate Synchronizer.
 * For more information or documentation, visit The Hibernate Synchronizer page
 * at http://www.binamics.com/hibernatesync or contact Joe Hudson at joe@binamics.com.
 *
 * This is an object that contains data related to the THEME table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="THEME"
 */
public abstract class BaseTheme  implements Serializable {

	public static String PROP_ID = "Id";
	public static String PROP_NOM = "Nom";


	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer _id;

	// fields
	private java.lang.String _nom;


	// constructors
	public BaseTheme () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseTheme (java.lang.Integer _id) {
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
	 * Return the value associated with the column: nom
	 */
	public java.lang.String getNom () {
		return _nom;
	}

	/**
	 * Set the value related to the column: nom
	 * @param _nom the nom value
	 */
	public void setNom (java.lang.String _nom) {
		this._nom = _nom;
	}


	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof modele.base.BaseTheme)) return false;
		else {
			modele.base.BaseTheme mObj = (modele.base.BaseTheme) obj;
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