package modele;

import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RoundRepository 
{
	public static List<Round> findAll()
	{
		List<Round> listRounds = new ArrayList<Round>();
		try
		{
			Session session = HibernateUtil.currentSession();
			Query query = session.createQuery("from ROUND");
			Iterator<Round> rounds = query.iterate();
			
			while(rounds.hasNext())
			{
				listRounds.add((Round)rounds.next());
			}
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return listRounds;
	}
	
	public static Round find(int id)
	{
		Round j = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			j = (Round) session.load(Round.class, id);
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return j;
	}

	public static void save(Round round)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			int i = (Integer) session.save(round);
			round.setId(i);
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
	
	public static void update(Round round)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.update(round);
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
	
	public static void delete(Round round)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.delete(round);
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
}
