package modele;

import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class JoueurRepository 
{
	public static List<Joueur> findAll()
	{
		List<Joueur> listJoueurs = new ArrayList<Joueur>();
		try
		{
			Session session = HibernateUtil.currentSession();
			Query query = session.createQuery("from Joueur");
			Iterator<Joueur> joueurs = query.iterate();
			
			while(joueurs.hasNext())
			{
				listJoueurs.add((Joueur)joueurs.next());
			}
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return listJoueurs;
	}
	
	public static Joueur find(int id)
	{
		Joueur j = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			j = (Joueur) session.load(Joueur.class, id);
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return j;
	}
	
	public static void invite(Joueur j1, Joueur j2)
	{
		j2.addToInvitations(j1);
		update(j2);
	}
	
	public static void removeInvitation(Joueur j1, Joueur j2)
	{
		boolean ok = j1.getInvitations().remove(j2);
		if(ok)
		{
			update(j1);
		}
	}
	
	public static Joueur find(String pseudo)
	{
		boolean exist = false;
		Joueur j = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			String hql = "from Joueur "  + 
	             	 	 "where pseudo = :pseudo ";
			Query query = session.createQuery(hql);
			query.setParameter("pseudo", pseudo);
			
			if(query.list().size() == 1)
			{
				j = (Joueur)query.list().get(0);
			}
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return j;
	}
	
	public static boolean exist(String pseudo)
	{
		boolean exist = false;
		try
		{
			Session session = HibernateUtil.currentSession();
			String hql = "from Joueur "  + 
	             	 	 "where pseudo = :pseudo ";
			Query query = session.createQuery(hql);
			query.setParameter("pseudo", pseudo);
			
			exist = (query.list().size() == 1);
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return exist;
	}
	
	public static boolean exist(String pseudo, byte[] mdp) throws Exception
	{
		boolean exist = false;
		
		try
		{
			String hql = "from Joueur "  + 
		             	 "where pseudo = :pseudo " + 
					     "and mdp = :mdp";
			Session session = HibernateUtil.currentSession();
			Query query = session.createQuery(hql);
			query.setParameter("pseudo", pseudo);
			query.setParameter("mdp", getHash(mdp));
			
			exist = (query.list().size() == 1);
			
			if(!exist)
			{
				throw new Exception("Pseudo / Mot de passe incorrect");
			}
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return exist;
	}
	
	public static boolean save(Joueur joueur)
	{
		Transaction tx = null;
		joueur.setMdp(getHash(joueur.getMdp()));
		
		try
		{
			if (exist(joueur.getPseudo()))
			{
				return false;
			}
			else
			{
				Session session = HibernateUtil.currentSession();
				tx = session.beginTransaction();
				session.save(joueur);
				tx.commit();
				HibernateUtil.closeSession();
			}
		}
		catch(HibernateException e)
		{
			if(tx != null)
			{
				tx.rollback();
			}
			e.printStackTrace();
		}
		return true;
	}
	
	public static void update(Joueur joueur)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.update(joueur);
			tx.commit();
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			if(tx != null)
			{
				tx.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public static void delete(Joueur joueur)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.delete(joueur);
			tx.commit();
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			if(tx != null)
			{
				tx.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public static byte[] getHash(byte[] password)
	{
		try 
		{
			return MessageDigest.getInstance("MD5").digest(password);
		} 
		catch (NoSuchAlgorithmException e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<Joueur> joueursLibres(Joueur joueur)
	{
		List<Joueur> joueurs = new ArrayList<Joueur>();
		
		try
		{
			Session session = HibernateUtil.currentSession();
//			String hql = "select id from joueur where id <> :joueurConnecte "
//					+ "and id not in "
//					+ "(select joueur1 from partie where joueur2 = :joueurConnecte "
//					+ "and (numRoundJoueur1 < 4 or numRoundJoueur2 < 4)) "
//					+ "and id not in "
//					+ "(select joueur2 from partie where joueur1 = :joueurConnecte "
//					+ "and (numRoundJoueur1 < 4 or numRoundJoueur2 < 4)) "
//					+ "and id not in "
//					+ "(select joueurCreateur from invitation where joueurEnAttente = :joueurConnecte) "
//					+ "and id not in "
//					+ "(select joueurEnAttente from invitation where joueurCreateur = :joueurConnecte) ";
//			
//			Query query = session.createQuery(hql);
//			query.setParameter("joueurConnecte", joueur.getId());
			
			int id = joueur.getId();
			String sql = "select id from joueur where id <> " + id
					+ " and id not in "
					+ "(select joueur1 from partie where joueur2 = " + id
					+ " and (numRoundJoueur1 < 4 or numRoundJoueur2 < 4)) "
					+ "and id not in "
					+ "(select joueur2 from partie where joueur1 = " + id
					+ " and (numRoundJoueur1 < 4 or numRoundJoueur2 < 4)) "
					+ "and id not in "
					+ "(select joueurCreateur from invitation where joueurEnAttente = " + id + ")"
					+ " and id not in "
					+ "(select joueurEnAttente from invitation where joueurCreateur = " + id + ")";
			
			Query query = session.createSQLQuery(sql);
			
			Iterator<Integer> listId = query.list().iterator();
			
			while(listId.hasNext())
			{
				Joueur j = JoueurRepository.find(listId.next());
				joueurs.add((Joueur) j);
			}

			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return joueurs;
	}
	
	public static List<Joueur> joueursPartieEnCours(Joueur joueur)
	{
		List<Joueur> joueurs = new ArrayList<Joueur>();
		try
		{
			Session session = HibernateUtil.currentSession();
			
			int id = joueur.getId();
			String sql = "select joueur1 from partie where joueur2 = " + id
					+ " and (numRoundJoueur1 < 4 or numRoundJoueur2 < 4 ) "
					+ "UNION select joueur2 from partie where joueur1 = " + id
					+ " and (numRoundJoueur1 < 4 or numRoundJoueur2 < 4) ";					
			
			Query query = session.createSQLQuery(sql);			
			Iterator<Integer> listId = query.list().iterator();
			
			while(listId.hasNext())
			{
				Joueur j = JoueurRepository.find(listId.next());
				joueurs.add((Joueur) j);
			}	
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return joueurs;
	}
}
