package modele;

import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ThemeRepository 
{
	public static List<Theme> findAll()
	{
		List<Theme> listThemes = new ArrayList<Theme>();
		try
		{
			Session session = HibernateUtil.currentSession();
			Query query = session.createQuery("from THEME");
			Iterator<Theme> themes = query.iterate();
			
			while(themes.hasNext())
			{
				listThemes.add((Theme)themes.next());
			}
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return listThemes;
	}
	
	public static Theme find(int id)
	{
		Theme j = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			j = (Theme) session.load(Theme.class, id);
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return j;
	}
	
	public static Theme find(String theme)
	{
		Theme j = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			String hql = "FROM THEME "  + 
            	 	 	"WHERE nom = :nom ";
			Query query = session.createQuery(hql);
			query.setParameter("nom", theme);
		
			if(query.list().size() == 1)
			{
				j = (Theme)query.list().get(0);
			}
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return j;
	}
	
	public static void save(Theme theme)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.save(theme);
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
	
	public static void update(Theme theme)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.update(theme);
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
	
	public static void delete(Theme theme)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.delete(theme);
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
