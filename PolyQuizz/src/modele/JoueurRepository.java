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
	
	public static boolean exist(String pseudo)
	{
		boolean exist = false;
		try
		{
			Session session = HibernateUtil.currentSession();
			Query query = session.createQuery("from Joueur where pseudo = '" + pseudo + "'");
			exist = (query.list().size() == 1);
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
}
