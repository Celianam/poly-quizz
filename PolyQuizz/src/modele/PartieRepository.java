package modele;

import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class PartieRepository 
{
	public static List<Partie> findAll()
	{
		List<Partie> listParties = new ArrayList<Partie>();
		try
		{
			Session session = HibernateUtil.currentSession();
			Query query = session.createQuery("from Partie");
			Iterator<Partie> parties = query.iterate();
			
			while(parties.hasNext())
			{
				listParties.add((Partie)parties.next());
			}
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return listParties;
	}
	
	public static Partie find(int id)
	{
		Partie j = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			j = (Partie) session.load(Partie.class, id);
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return j;
	}
	
	public static void save(Partie partie)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			int id = (Integer)session.save(partie);
			partie.setId(id);
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
	
	public static void update(Partie partie)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.update(partie);
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
	
	public static void delete(Partie partie)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.delete(partie);
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
	
	public static boolean rencontre(Joueur joueurConnecte, Joueur joueurCourant)
	{
		boolean rencontre = false;
		
		try
		{
			Session session = HibernateUtil.currentSession();
			String hql = "from Partie "  + 
	             	 	 "where (joueur1 = :joueurConnecte "
	             	 	 + "and joueur2 = :joueurCourant) "
	             	 	 + "or (joueur1 = :joueurCourant "
	             	 	 + "and joueur2 = :joueurConnecte)";			

			Query query = session.createQuery(hql);
			query.setParameter("joueurConnecte", joueurConnecte.getId());
			query.setParameter("joueurCourant", joueurCourant.getId());
			
			if(!query.list().isEmpty())
			{
				rencontre = true;
			}			
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return rencontre;
	}
		
}
