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
			session.save(partie);
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
	
	public static List<Partie> rencontre(int joueurCourant, int joueurListe)
	{
		boolean exist = false;
		List<Partie> listParties = new ArrayList<Partie>();
		
		try
		{
			Session session = HibernateUtil.currentSession();
			String hql = "from Partie "  + 
	             	 	 "where joueur1 = :joueurCourant "
	             	 	 + "and joueur2 =:joueurListe ";
			Query query = session.createQuery(hql);
			query.setParameter("joueurCourant", joueurCourant);
			query.setParameter("joueurListe", joueurListe);
			
			String hql2 = "from Partie "  + 
            	 	 "where joueur1 = :joueurListe "
            	 	 + "and joueur2 =:joueurCourant";
			Query query2 = session.createQuery(hql2);
			query2.setParameter("joueurCourant", joueurCourant);
			query2.setParameter("joueurListe", joueurListe);
			
			if(query.list().size() == 1 || query2.list().size() == 1)
			{
				exist = true;
			}
			
			Iterator<Partie> parties = query.iterate();
			Iterator<Partie> parties2 = query2.iterate();
			
			while(parties.hasNext())
			{
				listParties.add((Partie)parties.next());
			}
			while(parties2.hasNext())
			{
				listParties.add((Partie)parties2.next());
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
