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
	
	
	public static List<Partie> alreadyMet(Joueur j1, Joueur j2)
	{
		boolean exist = false;
		List<Partie> listParties = new ArrayList<Partie>();
		
		try
		{
			Session session = HibernateUtil.currentSession();
			String hql = "from Partie "  + 
	             	 	 "WHERE (joueur1 = :j1 AND joueur2 =:j2) " +
	             	 	 "OR (joueur1 = :j3 AND joueur2 =: j4)";
			Query query = session.createQuery(hql);
			query.setParameter("j1", j1.getId());
			query.setParameter("j2", j2.getId());
			query.setParameter("j3", j2.getId());
			query.setParameter("j4", j1.getId());
			
			if(query.list().size() == 1)
			{
				exist = true;
			}
			
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
}
