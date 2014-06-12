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
	
	public static List<Partie> recupListeParties(Joueur joueurConnecte, Joueur joueurCourant)
	{
		List<Partie> listParties = new ArrayList<Partie>();
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
				// Liste des parties
				Iterator<Partie> parties = query.iterate();
				while(parties.hasNext())
				{
					listParties.add((Partie)parties.next());
				}
			}				

			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return listParties;
	}
	
	public static boolean dejaRencontre(Joueur joueurConnecte, Joueur joueurCourant)
	{
		boolean rencontre = false;
		
		List listParties = recupListeParties(joueurConnecte, joueurCourant);
		if(listParties.size() > 0)
			rencontre = true;
		
		return rencontre;
	}
	
	public static int incrementerScoreJoueurCourant(Partie p)
	{
		int newScore = 0;
		if(p.getJoueurCourant().equals(p.getJoueur1()))
		{
			newScore = p.getScoreJoueur1();
			newScore++;
			p.setScoreJoueur1(newScore);
		}
		else
		{
			newScore = p.getScoreJoueur2();
			newScore++;
			p.setScoreJoueur2(newScore);
		}
		
		update(p);
		return newScore;
	}
	
	public static int getScoreJoueurCourant(Partie p)
	{
		int score = 0;
		if(p.getJoueurCourant().equals(p.getJoueur1()))
		{
			score = p.getScoreJoueur1();
		}
		else
		{
			score = p.getScoreJoueur2();
		}
		return score;
	}
	
	public static int incrementerRoundJoueurCourant(Partie p)
	{
		int newRound = 0;
		if(p.getJoueurCourant().equals(p.getJoueur1()))
		{
			newRound = p.getNumRoundJoueur1();
			newRound++;
			p.setNumRoundJoueur1(newRound);
		}
		else
		{
			newRound = p.getNumRoundJoueur2();
			newRound++;
			p.setNumRoundJoueur2(newRound);
		}
		
		update(p);
		return newRound;
	}
	
	public static int getRoundJoueurCourant(Partie p)
	{
		int round = 0;
		if(p.getJoueurCourant().equals(p.getJoueur1()))
		{
			round = p.getNumRoundJoueur1();
		}
		else
		{
			round = p.getNumRoundJoueur2();
		}
		return round;
	}
	
	public static int nbVictoires(Joueur joueurCourant, Joueur joueurAdversaire)
	{
		int nbVictoires = 0;
		List<Partie> listParties = PartieRepository.recupListeParties(joueurCourant, joueurAdversaire);
		for(Partie p : listParties)
		{
			if(p.getNumRoundJoueur1() > 3 && p.getNumRoundJoueur2() > 3)
			{
				int scoreJoueurCourant = 0; 	// Joueur courant
				int scoreJoueurAdversaire = 0;	// Joueur adversaire
				
				if(joueurAdversaire.equals(p.getJoueur1()))
				{
					scoreJoueurAdversaire = p.getScoreJoueur1();
					scoreJoueurCourant = p.getScoreJoueur2();
				}
				else if(joueurAdversaire.equals(p.getJoueur2()))
				{
					scoreJoueurAdversaire = p.getScoreJoueur2();
					scoreJoueurCourant = p.getScoreJoueur1();
				}
				
				if(scoreJoueurCourant != scoreJoueurAdversaire)
				{
					if(scoreJoueurCourant > scoreJoueurAdversaire)
						nbVictoires++;
				}
			}
		}
		
		return nbVictoires;
	}
	
	public static int nbDefaites(Joueur joueurCourant, Joueur joueurAdversaire)
	{
		int nbDefaites = 0;
		List<Partie> listParties = PartieRepository.recupListeParties(joueurCourant, joueurAdversaire);
		for(Partie p : listParties)
		{
			if(p.getNumRoundJoueur1() > 3 && p.getNumRoundJoueur2() > 3)
			{
				int scoreJoueurCourant = 0; 	// Joueur courant
				int scoreJoueurAdversaire = 0;	// Joueur adversaire
				
				if(joueurAdversaire.equals(p.getJoueur1()))
				{
					scoreJoueurAdversaire = p.getScoreJoueur1();
					scoreJoueurCourant = p.getScoreJoueur2();
				}
				else if(joueurAdversaire.equals(p.getJoueur2()))
				{
					scoreJoueurAdversaire = p.getScoreJoueur2();
					scoreJoueurCourant = p.getScoreJoueur1();
				}
				
				if(scoreJoueurCourant != scoreJoueurAdversaire)
				{
					if(scoreJoueurCourant < scoreJoueurAdversaire)
						nbDefaites++;
				}
			}
		}
		
		return nbDefaites;
	}
}
