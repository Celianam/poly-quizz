package modele;

import hibernate.HibernateUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class QuestionRepository 
{
	public static List<Question> findAll()
	{
		List<Question> listQuestions = new ArrayList<Question>();
		try
		{
			Session session = HibernateUtil.currentSession();
			Query query = session.createQuery("from Question");
			Iterator<Question> questions = query.iterate();

			while(questions.hasNext())
			{
				listQuestions.add((Question)questions.next());
			}
			
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return listQuestions;
	}
	
	public static Question find(int id)
	{
		Question j = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			j = (Question) session.load(Question.class, id);
			HibernateUtil.closeSession();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		
		return j;
	}
	
	public static boolean random3Questions(Theme theme, Round round)
	{
		boolean ok = false;
		try
		{
			if(theme != null && round != null)
			{
				ok = true;
				Session session = HibernateUtil.currentSession();
				Query query = session.createQuery("FROM Question WHERE theme = :theme ORDER BY RAND()");
				query.setParameter("theme", theme.getId());
				query.setMaxResults(3);
				
				Iterator<Question> questions = query.iterate();
				while(questions.hasNext())
				{
					round.addToQuestions((Question)questions.next());
				}
				RoundRepository.update(round);
				
				HibernateUtil.closeSession();
			}
			
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return ok;
	}
	
	public static void save(Question question)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.save(question);
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
	
	public static void update(Question question)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.update(question);
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
	
	public static void delete(Question question)
	{
		Transaction tx = null;
		try
		{
			Session session = HibernateUtil.currentSession();
			tx = session.beginTransaction();
			session.delete(question);
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
